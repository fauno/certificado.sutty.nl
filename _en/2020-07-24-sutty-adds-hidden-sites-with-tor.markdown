---
title: Sutty adds hidden sites with Tor
description: 'We have joined Tor Network´s campaign #MoreOnionsPorFavor to strengthen
  the anonymous web'
author:
- Sutty
image:
  description: ''
permalink: hidden-sites-with-tor/
order: 6
layout: post
uuid: aa579fcf-d9ef-48c8-98b7-4581d812abac
liquid: false
usuaries:
- 1
- 5
uuid: 1769c8b4-2b26-4897-9b3c-7f38f30d83a3
locales:
- b2195303-b342-49fa-a9e9-e6e570d07644
---



The Tor network is known for allowing anonymous web browsing. By using the [Tor browser](https://www.torproject.org/download/), we can access websites without our physical location being detected. At the same time, it protects us from other identification and tracking techniques that violate our right to anonymity, privacy and as well as the possibility to [choose what is done with our data](http://wagesforfacebook.com/).

After all, not all the services that we use daily adopt [privacy policies](https://sutty.nl/en/privacy-policy/) that are consistent with these rights, or that function in a way that internet providers and other intermediaries are not able to know which sites we visit.  Even in cases where we do make an effort to prevent this.

Those of us who host sites can facilitate this anonymous navigation by hosting them within the Tor network, so as to minimize the chances of exposing our information and data.

We can achieve this by using web addresses only available through Tor, called *hidden services* or  more commonly *onions*.

During the month of July, the Tor project has launched the campaign "[More onions por favor](https://blog.torproject.org/more-onions-porfavor)" to promote the use of this type of addresses.

**Starting today, all sites hosted by Sutty can opt to be hosted through this anonymous alternative by selecting the "Host as a hidden service in Tor" option in the settings panel.**

This allows visitors to reach a site using the Tor browser, have the option to automatically switch to the alternative address, and , as a result, to only access our sites through it.

> **Attention!**  This "onionisation" does not make the authors of the site anonymous or hide the fact they are hosted at Sutty.  Other strategies can be used to achieve anonymity for authors of sites, such as registering to Sutty with an anonymous email address.  We only require you to comply with our [terms of service](terms-of-service/) and our [code of conduct](code-of-conduct/) ;)

## How we achieved this

After almost 9 hours of collective *hacking* we incorporated the option to enable and disable `.onion` addresses on Sutty's Panel, added  [Tor to our infrastructure](https://0xacab.org/sutty/containers/tor/), and developed a [Jekyll plugin](https://0xacab.org/sutty/jekyll/jekyll-onion-location/) that announces the Onion's location.

As always, everything we develop is free and anti-fascist software.

If you like our work, we invite you to help us support it by making a [contribution](https://donaciones.sutty.nl/en/) or [hiring us](index.html#contact) to develop a project. We can also convert an existing site, both its design and content, to Sutty, adding our characterizing security, speed, and other features :)

## What still needs to be done

Currently, sites can **not** be published **only** within the Tor network.

In order to do this, we need to adapt some of the associated plug-ins as these could lead to information about where sites are hosted. Of course, this doesn't affect Sutty's current privacy levels!

## Using onions

When you open your Sutty site in the Tor browser, a window will now appear inviting you to *try onion services*. *There is a more private and secure version of this site available on the Tor network via onion services. Onion services help website publishers and their visitors overcome surveillance and censorship*. You will be able to choose the *Always prioritize Onions* setting and will be redirected to the Onion version of the site, and possibly the Browsing Preferences site. You can also *read more* at Tor's site.

You'll notice that you can browse the same version of the site without using the onion from Tor. What is the difference then?

* Onion services can be accessed **only** through Tor.

* The location and IP address of Onions are hidden. Sites on Sutty will still be accessible through their public address (e.g. https://adhesiones.sutty.nl/en/) through any browser.

* Traffic between Tor users and Onions is encrypted end-to-end, regardless of whether or not HTTPS is used (which we use in Sutty!).

* Onion addresses are generated automatically. This prevents some types of attacks, such as machine in the middle (MITM) where an address masquerading as another to redirect visits.

* Does it increase safety? Yes, it does.

* Can we publish totally anonymous sites? For now, no. We hope to offer it soon. You do have the option to only publish the onion address of your site. But it is important to consider that Sutty uses other tools to make the site indexable and to position it high (more visible) in search engines.

* Why are you telling us that we can create Onion sites? At Sutty, we are committed to the development, and maintenance of a free, accessible and anti-fascist Internet that serves as a true peer-to-peer network. This is another step we are taking in the right direction and we like being able to share it. :)
