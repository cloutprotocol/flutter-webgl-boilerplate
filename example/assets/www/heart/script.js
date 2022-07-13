var container;
var camera, scene, renderer, textureCube, object;
var mouseX = 0, mouseY = 0;
var clock = new THREE.Clock();
var path = 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/253981/';
var format = ".png";
var order = ["sky", "sky", "sky", "sky", "cov", "sky"];
var urls = [];
order.forEach(side => {urls.push(`${path}${side}${format}`);});
var loaded = false;
init();

function init() {
	renderer = new THREE.WebGLRenderer({antialias:true, alpha: true });
	renderer.setPixelRatio( window.devicePixelRatio );
	renderer.setSize( window.innerWidth, window.innerHeight );
	container = document.createElement( 'div' );
	document.body.appendChild( container );
	container.appendChild( renderer.domElement );
	var textureCube = new THREE.CubeTextureLoader().load(urls);
	textureCube.format = THREE.RGBFormat;

	height = window.innerHeight;
	width = window.innerWidth;
	camera = new THREE.PerspectiveCamera( 50, width / height, 1, 1000 );
	camera.position.z =-200;
	scene = new THREE.Scene();
	//renderer.setClearColor( 0x000000, 0 );
	scene.background = new THREE.Color( 0x111111 );

	var ambientLight = new THREE.AmbientLight( 0xcccccc, 0.5 );
	scene.add( ambientLight );
	var pointLight = new THREE.PointLight( 0xffffff, 0.9);
	camera.add( pointLight );
	scene.add( camera );
	uniforms = {
		mRefractionRatio: { value: 0.96 },
		mFresnelBias: { value: 0.05 },
		mFresnelPower: { value: 2.0 },
		mFresnelScale: { value: 0.5 },
		tCube: { value: textureCube },
		texture: {type: 't',value: null},
		u_useTexture: {type: 'i',value: true},
		u_albedo: {type: 'v3',value: new THREE.Color(0x000000)},
		u_ambient: {type: 'v3',value: new THREE.Color(0x000000)},
		u_lightPos: {type: 'v3',value: new THREE.Vector3(-600, 0, 400)},
		u_lightCol: {type: 'v3',value: new THREE.Color(0xffffff)},
		u_lightIntensity: {type: 'f',value: .6},
		CamPos: {type: 'v3',value:  new THREE.Vector3(-600, 0, 400)}
	}
	group = new THREE.Group();
	material = new THREE.ShaderMaterial( {
		uniforms: uniforms,
		vertexShader: document.getElementById( 'vertexShader' ).textContent,
		fragmentShader: document.getElementById( 'fragmentShader' ).textContent
	});
	var manager = new THREE.LoadingManager( function(){
		object.traverse( function ( child ) {
			if ( child.isMesh ) {
				child.material = material;
				child.material.side = THREE.DoubleSide;
			}
		});
		scale = 90;
		object.scale.set(scale,scale,scale);
		group.position.y = 3;
		//group.rotation.y =Math.PI * -.5;
		object.castShadow = true;
		object.receiveShadow = true;
		group.add(object);
		scene.add( group );
		;
	} );
	var loader = new THREE.OBJLoader( manager );
	loader.load( 'heart10.obj', function ( obj ) {
		object = obj;
		loaded = true;
		animate();
	});

	window.addEventListener( 'resize', onWindowResize, false );
}
function onWindowResize() {
	camera.aspect = window.innerWidth / window.innerHeight;
	camera.updateProjectionMatrix();
	renderer.setSize( window.innerWidth, window.innerHeight );
}
function animate() {
	requestAnimationFrame( animate );
	render();
}
function render() {
	timer = 0.001 * Date.now();
	if(loaded){
		group.rotation.x = Math.sin(timer * .5  ) * (Math.PI / 4) * -.5;
		group.rotation.y = (Math.PI / 2) + Math.sin(timer * .125  ) * (Math.PI);
		group.rotation.z = Math.sin(timer * .25  ) * (Math.PI / 8);
		group.position.z = Math.sin(timer *.125  ) * -20;
	}
	camera.lookAt( scene.position );
	camera.position.y = -5;
	renderer.render( scene, camera );
}