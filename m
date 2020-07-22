Return-Path: <jailhouse-dev+bncBCOKB247TIDBBZGZ4L4AKGQEQ6N3ZSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE522A13F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 23:17:25 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id dg19sf1192456edb.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 14:17:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595452645; cv=pass;
        d=google.com; s=arc-20160816;
        b=jdWWMtXjFHGfqC36Lj7wycxDPHBz/8K8MUBJ81coYkLobK+mKBdWO3mXs7Q0g4NqHk
         2A7fsuCNpLibmNOKdhGwq8otOBfUUVPUl+ze8Dbukx9GdwRE8/HZRVEUPX3BZ1BmH/C0
         yEeEl73adhQee/a3xQ1NO+2xw5piRwcWreyXp2qsmHEeQzKJZhmLAPX3/QLOnGS+ofDB
         89ksZNnncB5BdvPKqb5G68sT9PSKFWoQAl/XpZzn7y9s5Ksh1SJ6/WOyXBbIkYzMytD6
         w5KY5CAnGFwGAggh5C2wcZHKbUoe389nuedZkcyZyCGQXo0Xwz4fBYExjrn5cyHfS4C4
         SNqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=fo+IYGlaLRNxJngAD2YdoTnxD/5WpDE2xrsXSwfCS8Q=;
        b=DZec6sjFbmeZb2YIg4CxcOHfvCvlvqAWWtFEU/GGVF42ZrZIgtOL30eGZ5u388jSFl
         Xm1SuzczXmU2VS+kb0M0RMq/gJsdOWsFshTs/Q0wFNuLc/QZjZMNRcwKDjrFO7X2/LZj
         RfbV67JHM4FB/Lz26BBHIJy2a6QsE/I4IbDoQWv30bFgJ3C2I2CHn5zK9mX+Td7aFO0i
         4SfM+XklLtIbjJPWYm6N/ZEATiZIixic8xIsWlC3L5ldz9dSYGleSa3NHm9jQX1OUyH8
         cYQrmmj2ISKNv/1W/MitNsTqt8KLfJlJkQR++6Rp73tKCEDVKGSM27paJr5xFVZ2Rx5N
         Xtvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=Q7jAL8jY;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::644 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=fo+IYGlaLRNxJngAD2YdoTnxD/5WpDE2xrsXSwfCS8Q=;
        b=fZjZGxhSCO73BdPRMpZZQUe/89QRqlRIN7rAhsb2ccJbTyD02UTsytYjI9dfHSiZXw
         q82Ai3vGD4rl9RugQ6lZR9MzMDf2tcnZXyHKV2GogBxwVXmVhZCENrigZKk5PWsguOga
         63OUvFI+krrPW8+h5YllBKjlvBVQwRE8KSgqVCxTK0LCQ4xnPgCcImxzllmz2AbhJDQu
         kM12IZ1Yi6i7ATkvUdxqJRIRhmywEYR/GX795nTT4JqtUmjCS75uRQXmPmilGNcV6hRy
         SDAZFWpsw8cISJSpKVmtTzT07DNTuzRHeBEhtWCBJtbKk+DX8L/Nnm/3N/Q+cdGVQuMw
         jrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fo+IYGlaLRNxJngAD2YdoTnxD/5WpDE2xrsXSwfCS8Q=;
        b=Sc+fO/ntusC++CbVhRwQEsnEimgvoU3pZU3d1NoNmEc56dGXRcKUjuwDCsfOihXmyW
         bngzTtqGM8X+3/64eFm9h0bsRnkdTN64/r/K1e8N7umJdSgxP+EpJGIjzxDCc7YA6dDg
         UHQH9PZ/Rbd0cSPBMwaGH0LUUdnwH9Lwd+eHAYQyV4PWaBdinp/Qmhfa5PmK4PqxQzOD
         XZDTchIRhxLA/YaePaOBLTO/vQaLxNkbbQ/j+sdviT4cbLBcrsaLEQObyeXmp2H5zML1
         WJx+lTYT/1gd6tS5H4F9j5t1mKFMwjJNeVma1DgjaH5Sis4N8V+NbPB950AmdCEBpka/
         nNtw==
X-Gm-Message-State: AOAM530p9+Vz0dButgBJ2HafcCCOPc5gSobisYFpPZ9giJ35HPHIiqTm
	/aSViNsRwVf/6ZsH7n480CM=
X-Google-Smtp-Source: ABdhPJxqcRcbVh61XzaEgbGVYSVRolqVFAlpU2zjz9JFbmTXNvWK8u6PVGKdldsABW7Cnz9/VWLc3w==
X-Received: by 2002:aa7:d7d0:: with SMTP id e16mr1357698eds.10.1595452645118;
        Wed, 22 Jul 2020 14:17:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d37:: with SMTP id dh23ls1620460edb.1.gmail; Wed,
 22 Jul 2020 14:17:24 -0700 (PDT)
X-Received: by 2002:a05:6402:318d:: with SMTP id di13mr1385006edb.172.1595452644420;
        Wed, 22 Jul 2020 14:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595452644; cv=none;
        d=google.com; s=arc-20160816;
        b=Weyt9DXLG4lhfTuhNCTiRKu4YBX7jdoIEYdSo7GXIR6tmTUFcHffm7+IG9E5aNexJr
         5RKVCjzF5/IOhPG9tGJCwgjovgvCFgugDxwJ6Lcj+tYZA0ZNb3tC6rr+P2G71udnW0Bg
         +w450Rv1I+wkvzMn0BbFmQX13M6gjHr5+mgj+e7Gj8gB2eCNz7DqVOWKHyB3UucDXh46
         KWExclubz0lM0cCSRCZyYIhE9VNsZAePoyYMnHe3y2Irgt9aQVd9oNQA/iPXpv4YRYsM
         hImLUOHNqTmUye1Wfy0d+ozmoKxI/+85g/DwgbA8P87Kde31JQ3CvCgpposTwTYTT2+j
         IS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=CHP+xy1KNyJLctYun1gn3zPm/UzisOEisMAB2fLeS+g=;
        b=ZMSgPzTz390bbT29z4fs1z9sFPFa9IBwYZrcDeHP7k/v9BrwudDWunk6Q0kAB63tbB
         2ptJWiQYkFnGZk1+FIKwuYkllPu1Mqe1U/LR09kwhyN1PnMRnfzvKWZhaABBYs1Xf/rU
         2sYaSeIJv79vKQzwFTcbzjJAh/RBTaDca+R2LHTkWc+BSaeVosBlCPq4Bhb5KXpZjBej
         wIEcuVdAV5swUvQUrGfArkbjqu8xA5GRK4FgzlxSOwwjLKVuE9kFuuJTx8OVXsd4xGAy
         mfKWBPkfYhhvsGDgHISOvR0zfbfhfgPJfPQcCDPOasegA3LNltL/34daUG+B5NpMv8RP
         Lclw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=Q7jAL8jY;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::644 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com. [2a00:1450:4864:20::644])
        by gmr-mx.google.com with ESMTPS id p61si34759edd.0.2020.07.22.14.17.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 14:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::644 as permitted sender) client-ip=2a00:1450:4864:20::644;
Received: by mail-ej1-x644.google.com with SMTP id l4so3815874ejd.13
        for <jailhouse-dev@googlegroups.com>; Wed, 22 Jul 2020 14:17:24 -0700 (PDT)
X-Received: by 2002:a17:906:9348:: with SMTP id p8mr1458095ejw.467.1595452644076;
        Wed, 22 Jul 2020 14:17:24 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id bs18sm674403edb.38.2020.07.22.14.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 14:17:22 -0700 (PDT)
Date: Wed, 22 Jul 2020 20:19:20 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200722181920.qw6znac4bfwjf235@carbon.xt3.it>
References: <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <20200722142016.zokufzzm63ly2oo5@carbon.xt3.it>
 <5a66e10a-6215-9c1e-241b-7cab268731c1@siemens.com>
 <20200722164256.n4c43mf7rrt6lzp2@carbon.xt3.it>
 <d60bd3f8-9a0b-eaf6-8bc1-7a544daa60c0@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vu5lhqvdlo773wco"
Content-Disposition: inline
In-Reply-To: <d60bd3f8-9a0b-eaf6-8bc1-7a544daa60c0@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=Q7jAL8jY;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::644 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
X-Original-From: Marco Solieri <marco.solieri@unimore.it>
Reply-To: Marco Solieri <marco.solieri@unimore.it>
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>


--vu5lhqvdlo773wco
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 07:28:29PM +0200, Jan Kiszka wrote:
> On 22.07.20 18:42, Marco Solieri wrote:
> > On Wed, Jul 22, 2020 at 04:39:59PM +0200, Jan Kiszka wrote:
> > > On 22.07.20 16:20, Marco Solieri wrote:
> > > > On Mon, Jul 20, 2020 at 11:29:21PM +0200, Jan Kiszka wrote:
> > > > > Regarding dynamic coloring, I can only repeat what I stated befor=
e,
> > > > > multiple times: I'm extremely pessimistic that you can turn on or
> > > > > reconfigure an IOMMU while you may have transactions in flight th=
at are
> > > > > affected by that change. How to collect the pieces when you do no=
t know
> > > > > if a transaction finished and which address it hit, the one befor=
e or
> > > > > after the change? That is exactly the scenario when trying to mov=
e a
> > > > > root cell from uncolored to colored memory. IOW: You may implemen=
t this
> > > > > but you cannot make it robust.
> > > > >=20
> > > > > A more promising path is pre-linux Jailhouse boot, maybe even wit=
hout
> > > > > root cells after that at all (needed anyway for shrinking the run=
time
> > > > > code further).
> > > >=20
> > > > This time, let me try to dig a little further on this point.
> > > >=20
> > > >   From a purely technical standpoint, having coloring implemented i=
n the
> > > > pre-Linux root-cell loader is of course a more proper way to implem=
ent
> > > > the feature, by far.
> > > >=20
> > > > On the other hand, I see two major drawbacks: one on the
> > > > software engineering level, and one in the product management one.
> > > >=20
> > > > - AFAIK, pre-Linux Jailhouse boot is not only highly-experimental a=
nd
> > > >     immature, but also an inherently optional.  This means that it =
could
> > > >     be dropped anytime, or that boot support could be missing for a=
ny of
> > > >     the supported hw combinations (with ordinary Linux boot).  This=
 would
> > > >     therefore place coloring in a very weak spot, its solidity depe=
nding
> > > >     on another optional feature.
> > > >=20
> > > > - Maintaining boot support for all the hw combination one needs to =
have
> > > >     cache coloring support available is costly.  (I bet you know ve=
ry
> > > >     well, Jan, given that you placed the Jailhouse project on the
> > > >     Linux-boot design cornestone.)  It is hard to imagine board/chi=
p
> > > >     makers widely embracing, contributing and maintaining pre-Linux=
 boot
> > > >     feature for their products.  This means such a cost will fall o=
n the
> > > >     Jailhouse integrators who wants to use coloring.
> > > >=20
> > >=20
> > > I don't disagree that we are close to having pre-linux boot ready.
> > > However, neither do we have a sound concept for post-boot Linux
> > > coloring. Morever, pre-Linux boot has the potential to further reduce
> > > the critical runtime code size of Jailhouse, and if that turns out to
> > > be true, it will become a first-class feature of Jailhouse, you can b=
e
> > > sure.
> >=20
> > What you say is true and also very important, I believe. But is waiting
> > for a proper solution worth? Or is it better to bring forward the
> > availability of a complete coloring solution?
> >=20
>=20
> If you can prove my concerns wrong that I have about live-migrating DMA
> transfers from 1:1 to colored, we can try coloring the root cell. But I
> haven't seen any concrete resonsoe on them, although I keep on pointing t=
hat
> out over and over again.

I shall let the code convince you ;-)

Cheers.

--=20
Marco Solieri, Ph.D.
Research Fellow

High-Performance Real-Time Lab
Universit=C3=A0 degli Studi di Modena e Reggio Emilia
Ufficio 1.35 - Edificio Matematica - 213/b, via Campi - 41125 Modena
Tel: +39-059-205-55-10  -- OpenPGP: Ox75822E7E

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200722181920.qw6znac4bfwjf235%40carbon.xt3.it.

--vu5lhqvdlo773wco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8YgygACgkQCtn83XWC
Ln7SXBAAobswZk148nr8LsP8f/7DAra+VPbIJpeodsAqtOcncnBjBpREB5fewWZy
BOOASK9pu2GGix565nErLB3XH/LxfhARYgw1AWYIgp6nWYTSSekQsGZFlcrc7Ai2
RL2KbRAbpw84PlYGv63u9vx0b/h8tP1YqsS2NOdIjCVxCkidMSzWLDMnQesnvvit
HE7QMgXYUXsvCcNZAg0Fva5K74mSYT7eb7nxo4D+fkfpAUB42f3sUGH+lvlleU7l
7He6tL7DIzHfGafXp/5UIvB/zszwYAWRcSq6TOQv814vqMO9nA9yRz6VqJWfOE/q
iuIiJAoEjlRFyEzxDTSLClyHK9NUrkKnw7vtNgIVXtqEsfVbg4G0Xnv/oCMgJKO4
M1foyXDomwZ+mXE1ZNbZb7LISR4QVt76c4CZWpD/22LWCjE/nj66esX1ZdaRW0al
wkT8tmR8kcBU6CR3/FJlqTinS0wPLHzS6xfT++lH+jHn+ZkbLM4H01cLWz/ltpnF
QT+93QdASN0uhzpLQBn6VZYD6UeTCsQFMLXBZBZ6aLRnm464jXXg8fuof7MXXeoH
4F5UqSGDDBfR6pDG/sfpeZCRvQSkJRLJbI1edY/C+w3QEryLBdUsvBeYlyRiF2yE
bkmJQoMCx2e5YlLQLWl3ZoIbWazkLMs+UDHdcvBUn9c8gnd/J8I=
=cNR/
-----END PGP SIGNATURE-----

--vu5lhqvdlo773wco--
