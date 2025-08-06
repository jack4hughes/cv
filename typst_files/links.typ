#let links = (
  "website": none,
  "instagram": none,
  "youtube": none,
  "Linkedin": "https://www.linkedin.com/in/jack-hughes-latchamdirect/",
  "Github": "https://github.com/jack4hughes"
)

#let get_active_links(links) = {
  let pairs = links.pairs()
  let filtered_pairs = pairs.filter(x => x.at(1) != none)
  return filtered_pairs
  }
}

#let create_link(url, name) = {
  return link(url)[#name]
}

#let display_links(link_dict) = {
  let active_link_pairs = get_active_links(link_dict)
  let links = active_link_pairs.map(x => create_link(
    x.at(1), 
    x.at(0))
  )
  let link_output = links.join(" | ")
  return link_output
}