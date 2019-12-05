Return-Path: <jailhouse-dev+bncBCOKB247TIDBB67KUTXQKGQEU6YC6QA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A96114522
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 17:51:08 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id d14sf1125033ljg.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 08:51:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575564668; cv=pass;
        d=google.com; s=arc-20160816;
        b=oHG/QX/pV9Q+EitH/HuQdTlP+Simwul3VDMj10NFZyszCJ3L7rV/952qYx3NJnAlpe
         zZgyumkEqaUEv9OaB/ZS6Vu0K1OI57H0TKh/g+7FshtwybXfFT4uEDpfXyDJrFtaJ1IW
         sU7ncrBC1xohoIecgTcjTQVRsRO2vPiEAOJcGPO/L27sSGk/fLhnlwCDtoDogGJQDhOO
         OxxobJaZIU3XAAd1obCn/+Li1L475S3KLjpBS/XaTBssa8h0TTdQjhNsLuatj6yj1nO7
         xQ6er3X2c2hWCWOAH1c0dBPZ4Yb3RvtSNkcHoXYiVlQVUTJpcQ4THj6tSLbavDpN/QjD
         DeIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=JobUaQtgpb0lVOtsawr00Yg2Rfzybio7MPeZfjJ0QDc=;
        b=tJIsqYCV3DrB0lBzyQndNStPMPeGgCqLj6G5SiTLnLKTpwBecc/3KpJuw719Q8DL2U
         vub3amV2hmEeppTLXLEhZt2goRjessflI3lLxZRwNe07F6eWNkYE75P3HLuH9NXHkhP/
         qqbUwctwABSUbZqb+S/V30zBY4yhnsJlBxsNqadF3SUGobhA491b+ODDMQA+TuT8w8TJ
         IYI98sE1qrzK34qia39ecOw4dWD4Tyz/saQV5HdrTt4MCJJtXNh8oBkgOblgLDOGcGIV
         d/CwQblSV5HOu3/GFDJSszybQKUB5su6coV1WNZfwkJ19sQdzyVfhS0Yrwu2ECFHOFI1
         Bldg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=XVIB7AXa;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=JobUaQtgpb0lVOtsawr00Yg2Rfzybio7MPeZfjJ0QDc=;
        b=UtKC9k9HXu10w3L1E6qE+G49+hKqr8rs6t+JJltL2Tgbcm91JWocOwHiQ/q0rwntsy
         hFE1Hr/o8oJghIFiQP0+K7NJk3Fa+OlsIlQnNZ6avmhA08Y9pz30cKnANzcArsuJTu7u
         93Wc5BXFOC3UvQ0LE76JCRRJKpAZGunZdNs3/OGkq+RUYGcZmNthTmmQBtwjDP1JXi8i
         /nu+U6RXr9AxgXMznxBUOxKT30+GfharJPpaCGl310fL/bo3GzYP5aZTbROfRljmtdGW
         BlvgPzU3NB8nCSgFS8tCXVQ78RqoedVwDxK4o/PwyhsvFeqxcpHTgKhGupFwzIozEWGn
         NhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JobUaQtgpb0lVOtsawr00Yg2Rfzybio7MPeZfjJ0QDc=;
        b=ecVw6xspGRObn//IT1vF3ChYRiIuLDBFJGbti0oKYUjN1qdBHEVaeLG9A8XXWy6+2y
         cXpz2qsdexPYcZwKYaY11HXFTiwtXMXzyRkApg4Ez518JOuNWKmwjaE/MdSOfu6vcJ1C
         /TU4ZjIz1fXrz+H4Ve1thQjBjLPu4nzEgjsNuzhkLAy7LFZG3ysIo1zaZyg5XumPQai5
         Oc1tJCmTdGhIY2guA9trAvveRD+vUc1KBNUDMWmWqVesid/9qPR73HCyQx2KP+u/BFIo
         5mN3WLxXuhFjSZpS7mdmIZ4VKoHxJa0kjBM9a+dFfo7UXo1FwvCz9LDsVfKIuRMkUmo0
         UI6w==
X-Gm-Message-State: APjAAAXhX3mpBeX03OG/MdpkWZ8A1/N+FDtNooWAPhdkNPZbi3ZxrLml
	VLz//zd+ZJjkdbv9TgIG6+U=
X-Google-Smtp-Source: APXvYqxmojdt5iO2O5XR0l/q4QGjhWVk63bszYbRPZihZ3J9BgdPz3+I3h6UK5aMlUborGenVrYM1A==
X-Received: by 2002:a2e:9e03:: with SMTP id e3mr1252154ljk.186.1575564667341;
        Thu, 05 Dec 2019 08:51:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:51c:: with SMTP id o28ls374527lfb.4.gmail; Thu, 05
 Dec 2019 08:51:06 -0800 (PST)
X-Received: by 2002:ac2:4119:: with SMTP id b25mr5865059lfi.90.1575564666603;
        Thu, 05 Dec 2019 08:51:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575564666; cv=none;
        d=google.com; s=arc-20160816;
        b=MtfMWI6CEFWD8xbM3oexwOrrjEH1I0M1CdUkguoKkdQfwnEXoSi2nTmz15ywsuPjXP
         o6YfW4thSCxDAulmMJMVun42JneeHl690G7LiJekAAdri41IdDSQQFQCa3TTvMaYjOj0
         eTJxgxaU/e5VSKOKhShkHqpzmdY+zAQD5l8q86ENFfpeyjpgkJ+GAGRdxlEAbwaXSCAM
         5m/+8OL9vRTQ4DL6+Hu5T13RKeW0N8sedhV5qN792x3/ySkIbJAgzFwAYOxcibbzzOnX
         Tyjhd9fydTHTcfySMLIsXPIkKLroTZjZZZoozvNsizQzKkATT3E2WQ3A2ldQquN9QsRr
         m2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=tj3Y2cwcjD5jPTATye/x1tUVgK/Eh7ttSRynbsBqeWY=;
        b=dEVrzvNV2EF47KRZm1HmAnZK7FHlPkkVxUulz+/cL5xTFrKHB6ZAt52eukDQ9rmV25
         rAn2FL9dERflkAMbXFuxJl4Mt3nldKFYM2SAhx+plH6//tT3BVAcNq52i1OZSNlF3I6G
         7cPa+vdKW9F3YNF6RzBLQ+1XkzxTc/X3VtJGkO32kDFFzxic3rLijwLDxx3hCG5Jc6Pk
         enBo3rGWJKz8DaRXya3XBkcPNMIlYCNHkxP1aFsMQ8H+EQj0AoeVouTdho1KeJIHBfd5
         BZuO2zc6NxV/km7z5beTKhEK7VLtHUj3vIxeKSVMuPtHznbZ749qko56YMlYQK1euj7t
         GVxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=XVIB7AXa;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com. [2a00:1450:4864:20::444])
        by gmr-mx.google.com with ESMTPS id x5si324644ljh.5.2019.12.05.08.51.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2019 08:51:06 -0800 (PST)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::444 as permitted sender) client-ip=2a00:1450:4864:20::444;
Received: by mail-wr1-x444.google.com with SMTP id z3so4492267wru.3
        for <jailhouse-dev@googlegroups.com>; Thu, 05 Dec 2019 08:51:06 -0800 (PST)
X-Received: by 2002:adf:8541:: with SMTP id 59mr5055986wrh.307.1575564665766;
        Thu, 05 Dec 2019 08:51:05 -0800 (PST)
Received: from localhost (hipert-gw1.mat.unimo.it. [155.185.5.1])
        by smtp.gmail.com with ESMTPSA id u16sm12775619wrr.65.2019.12.05.08.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 08:51:02 -0800 (PST)
Date: Thu, 5 Dec 2019 17:50:31 +0100
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	"marko.bertogna@unimore.it" <marko.bertogna@unimore.it>,
	"tomasz.kloda@unimore.it" <tomasz.kloda@unimore.it>,
	"giulioc@xilinx.com" <giulioc@xilinx.com>,
	"'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
	"fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
Message-ID: <20191205165031.gl2f4tbx3klq6rfy@carbon.xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20191203004700.cw7fgubui363mxee@carbon.xt3.it>
 <AM0PR04MB44815D033BBEC85ABBBEE5DB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3bxi3ubqe25ztiwe"
Content-Disposition: inline
In-Reply-To: <AM0PR04MB44815D033BBEC85ABBBEE5DB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=XVIB7AXa;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--3bxi3ubqe25ztiwe
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2019 at 08:41:13AM +0000, Peng Fan wrote:
> > On Mon, Dec 02, 2019 at 02:52:04AM +0000, Peng Fan wrote:
> > > > I am reading the patchset, but this patchset could not resolve the
> > > > cache contention between root cell Linux and inmate cell, right? It
> > > > only address the cache contention inside the inmate cell, if I unde=
rstand
> > correctly.
> >=20
> > This is correct.  The documentation reads:
> >=20
> > | Since Jailhouse is currently lacking SMMU support, and since the
> > | colored memory mapping must be provided to DMA devices to allow them =
a
> > | coherent memory view, coloring for this kind of devices is not
> > | available. This also explains why also coloring support for the Linux
> > | root cell is not provided, although possible and tested with a simple=
 hot
> > | remapping procedure.
> >=20
> > > > Is there any v2 plan to address the upper issue?
> >=20
> > Forward porting to master and integration with SMMU support are the two
> > most important task on my team TODO list. Once these steps are done, it=
 will
> > be very easy to also have root-cell colouring. I have planned the first=
s for
> > 20Q1.
>=20

> NXP i.MX jailhouse has smmu-v2 support, but it currently conflicts with
> smmu-v3 code in upstream. I have not find time to restructure v2 code. Yo=
u
> could refer if you need v2.

I know. Do you have plans to merge SMMU-v2 support in upstream? It is very
important for colouring Linux, such as the root-cell. But I am sure that ma=
ny
others than me are waiting for it.

Also, since v3 support is only preliminary and the SMMU is not really usabl=
e, as
far as I understand, and since v3 devices are quite less common, perhaps th=
e v2
support can be integrated easier and earlier than you think.

> > > > To address root cell color issue, 1:1 mapping in root cell might no=
t
> > > > work, because IPA/PA needs a remap, but this will waste PA space, i=
f
> > > > inmate only need a small area PA space. Seems root/inmate cache
> > > > contention is hard to avoid.
> >=20
> > Beside root cell colouring, PA waste is a potential issue of colouring
> > itself, whenever you have heterogeneous memory needs across cells. Stil=
l, on
> > most high-end systems the size of the shared cache easily allows for 8 =
or 16
> > colours, which means that the smallest PA granularity to assign to a gi=
ven
> > cell is 1/8 or 1/16, which is an acceptable limitation.
>=20
> Without SMMU, if enabling color for root-cell, it means needs to cut off =
at
> least 1/8 or 1/16 memory of the whole dram space from root cell.

For example, 1/16 of 2GiB DRAM looks expendable.

> CMA is not easy to fix here...

I have not ever used CMA. Does it operate without SMMU mediation (i.e.
translation)?


Cheers.

--=20
Marco Solieri, Ph.D.
Research Fellow

High-Performance Real-Time Lab
Universit=C3=A0 degli Studi di Modena e Reggio Emilia
Ufficio 1.37 - Edificio Matematica - 213/b, via Campi - 41125 Modena
Tel: +39-059-205-55-10  -- OpenPGP: Ox75822E7E

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20191205165031.gl2f4tbx3klq6rfy%40carbon.xt3.it.

--3bxi3ubqe25ztiwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl3pNVcACgkQCtn83XWC
Ln470BAAgP8+EDcqyZbdiR8ZQBhQMUak8UyGNJXaFEUu662d6jgTCb2+pZqtbDew
7ATS3PJFMTrK3sDohjNTWKANt7h5Qh1USWYCJCz8nWCxknh3xEbPihoTrYNmNbGo
KmcvzqQ3TkMzq/ac9cc1h3uyhQIKKVmRtSHdGVOBSRGsXB37a0lI+oJMgQdv4JNy
YlGwNU703FMlAsZUP388Nc+kXdtv73yjZTZdnZLDzcB/ZeCxoSwlkeR4Br9AKQGo
ME7TtcOHFX7R7J+yVwEXMo6uuPmKeFCxo4ovho44cP7Vp2TFw0y9XYtrUbzn+H01
sTO3eM+F300vmc0sT8rdydSPOdhSiOFiyoN7a63OORdMtRpJQMt9+D6v53VRR1eR
XcHcH8NTl/e/OmfvOsKS7dElIPUFgwqIdz17PWF7G7XnqHiOTpJF0hq+hleNGQ5O
vengTjwQuBZ7yjijc793U5IZaZ/2xhqytqK0zHbra5swjeZuub9pFF/+iKsbionF
3bojPeRSft14LarSWRa291vEOmpwDEFNvJ3HZtg8P9Bganwk7SETymYFmpczFzu1
F5sti022/QesHSlnVWRuUCt4k4Gq481ySoZtmRspJaKKrHUSdGJkNtyw4eaIMQS6
+GyleJ7Qn/+nXGKawb89aOP2oPTK2DmTjPGbNLGN1tNlTVpSdQo=
=5SnY
-----END PGP SIGNATURE-----

--3bxi3ubqe25ztiwe--
