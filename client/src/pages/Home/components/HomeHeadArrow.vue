<script lang="ts">
  export default {
	data() {
	  return {
		activeArrow: 0,
	  };
	},
	mounted() {
	  this.startAnimation();
	},
	methods: {
	  startAnimation() {
		setInterval(() => {
		  this.activeArrow = (this.activeArrow + 1) % 3; // Cycles through 0, 1, 2
		}, 250); // Change every second
	  },
	},
  };
  </script>

  <template>
	<svg
	  viewBox="0 0 82 258"
	  fill="none"
	  xmlns="http://www.w3.org/2000/svg"
	>
	  <path
		:class="{ 'active': activeArrow === 0 }"
		d="M81 37.7501V1L41 28.2499L1 1V37.7501L41 65L81 37.7501Z"
		stroke="white"
	  />
	  <path
		:class="{ 'active': activeArrow === 1 }"
		d="M81 133.75V97L41 124.25L1 97V133.75L41 161L81 133.75Z"
		stroke="white"
	  />
	  <path
		:class="{ 'active': activeArrow === 2 }"
		d="M81 229.75V193L41 220.25L1 193V229.75L41 257L81 229.75Z"
		stroke="white"
	  />
	</svg>
  </template>

  <style scoped>
	path {
		transition: fill 0.5s ease, stroke 0.5s ease;
	}
	path.active {
		fill: #fff;
		stroke: #fff;
	}
  </style>
