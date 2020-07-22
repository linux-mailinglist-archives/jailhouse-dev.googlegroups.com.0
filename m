Return-Path: <jailhouse-dev+bncBCOKB247TIDBBUEW4H4AKGQEJULUZOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B622299F1
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 16:21:04 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id z1sf678292wrn.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 07:21:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595427664; cv=pass;
        d=google.com; s=arc-20160816;
        b=GaP3mSOotzFccNAnHmi501hNEOpYh78kIWHur2ciXxiM3FGv9BXdFYeOVzoGG0fh+D
         A+n5P4IHSIUXPLP+zkWF2fDuD/Irw8WEus+sKmszRXcywa7aA+JCxzttI5jHcFXoKf6K
         BFTimehekqz5Q0RifhGjpT7TEFHVVMhIyKLtiirTtvJwvKWYkKdafFF9ZijTsNK98kHd
         CTTJgVQV9VGYfl3upVzOh66cbAjd1IrdJ/Z3HmwNJCIXbybWw/iESepxHxBLTM2ESkZf
         iCs3DWuKy7itAT0AP4t8iWRtsu5+C5+D7Ajd83bFpkuxp4YPThgIkCZTAz7RhBX/lNT5
         TxOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=LNW+PAJiyjDiP6glFhdYASwEJLEeM98+cIaHV7l1/4Y=;
        b=aNhGY03JSmA3nFGOdit6bg4OHQNbEyPnq5acxx7bCWGmvXmNYyQVqbo1Wj54+Rk7OV
         EBldymKlBQEj1U8fU8jyvwJxv00q9qrh4CODfo7yqKXCffgMcBFB39cp4eXyp1OBxk8k
         mQ07Rqy0JnfBYmmwzygzZ3M7mFD3V2GW3IMpyQZyZKbWsiXbFJelCKWNzXAC8L+sD7y1
         jS4I4luQlFsxGHgDvQrfpr36WR4K7hxIdeRX4ZJ7N/ClDBUsqbusJ6igrC6LzO68k2FO
         31GWFcOBPvPLgfNX5GOUXg+NtuRx8eoooj+JV0IBt5YpW2ro9XCNaS/RurP/kLsQ7F+Y
         LOwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=Q2+QvVQa;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::642 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=LNW+PAJiyjDiP6glFhdYASwEJLEeM98+cIaHV7l1/4Y=;
        b=TtoivV1KC7SzSGpVNGvTDf6A8+fZG7uXU4d7QHlkYnz4VUHGIREHQ6FpOaEzq/dmvc
         ECG+/RTrLnsLWbJMAwMojCCmzgbMqaMw5lLvecu5OeLJ/vFb8i3y+N2DyAWzIXzNWtAz
         EaEri2ODxfKcFv3XuMtNZcTiqHkVcOGaA0zmC792gIkC7OvZZZJXounPI1o5bpgM877y
         0XXfz5pHulaNsp/K7/w2FSZyiItbDCR3XfH3f76lMk3PJkjiCjKkTS0vxaNev0EADWQU
         GEpF58v1RCexWOthNfBjA68YR8RXPSpe3lqg2xizECoXiJBfq7fWDTOJ/D/PfxLGfbDa
         EJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LNW+PAJiyjDiP6glFhdYASwEJLEeM98+cIaHV7l1/4Y=;
        b=IVd123ImcDAssWhgMjJZBpxPPTiTx5150VxD839Opl1EjlaAiI0GCWNNLEglHXkE2F
         0W+2e85ldS1O7kGzKvSG8SqrTAI2rKbVtzsUI4+38w/2r/pyIh+aumDhiz22t2C1SKKB
         jXZIuAmU4pzvM8FTD1MnxIwKfnqI4icOnAp+qj8J731b0oW0VDVzMgDPQH96GcdLKaKu
         ckhZnYD2GBhc6SJSCsJ8DZRnkE5m64nvR+38Z7Bi2sUkQpXOOGZ4N7qN8mMQ22q3CtVn
         +Dj76DthsyDqfZs/EpIQcJF03KY+iBErXOraYopZ18dh2gwkEDvHhGbwY3iA0OIdQyYG
         ib2A==
X-Gm-Message-State: AOAM531CnhJsCjnpb777Yt3Bo5uVYQGzYjvLSSSUVJgTbiKGl2NX2A0i
	ItX9sDbAzGzqV2vgK4Vy+P4=
X-Google-Smtp-Source: ABdhPJxNauoxQ09Pxd11gLWjOrtfHPOsKUSfjsxAHyJxwb2YzebM3DPflu1kcXAtVL5cDiFikzFW1g==
X-Received: by 2002:a5d:6a01:: with SMTP id m1mr33255992wru.115.1595427664310;
        Wed, 22 Jul 2020 07:21:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4ccd:: with SMTP id c13ls2824019wrt.1.gmail; Wed, 22 Jul
 2020 07:21:03 -0700 (PDT)
X-Received: by 2002:adf:c185:: with SMTP id x5mr34019270wre.403.1595427663659;
        Wed, 22 Jul 2020 07:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595427663; cv=none;
        d=google.com; s=arc-20160816;
        b=nphqMXwoV96yxTGZQKOsMO29jIfreZoIUTou5HRPa2f4GylZ6ioFMIX/qyRPYuV0WA
         qdbbRjmvQzXFMbV5rpBwl0dQuFCUnzR4WUtxsWU4k7sIrPZvh54Ug90bXb6bLl8hHpnF
         tFTIdu3+r4ie3D/nYyGM1L+NtlH0fXKg1/onxqFnJWs3HvJoL/tMwLLgmKD6VTLWLTju
         lGdEA/RXaKHca6xEIDZJL00dtTf2f4VuOtNe5goRIJkW9Df87QWda/PRQtGU+e3OS4Pc
         LLAnNIi5AQYAP/1VkHwaxg2ZfzQCy5VARsUQA3O4R2O6vy8vhw3IFh7J+Aobj68U8hqr
         OOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=9hJXZAwaGCEJy5kKyAPmgV1ENoPj/HK9/dH9sxSQIPQ=;
        b=Sqtw4/aSQ4bo1SV2yx/knUHwHh+nAri63VtgCgmxQNOu2UEGfWQLtB8JE6YYAC1WRV
         hzQtHMKDjlT4/rgeO1gm/fvBbTVn55GpikAukLAZsaHlnXdkpi8xdcauCnuFboV54a++
         n0ubNma3n+4YH9KiFUP00pmWBakYk9v+gLW+jMSfnZHbM8bFtFqMHHC5MV9xp3m+F/g9
         hefSKu+6bGtxHqPcyElGzTl3P10CxEyYv3tGhwmLikW27ebOnXnvPx4AGRUpmo/4+jd4
         BGjbQ7jEOBrqVKA957rkKjuDgXo5hT/zbXbocUs0Y3OGdbdORHdoT0pU/H9iPDCKSl9h
         SX/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=Q2+QvVQa;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::642 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com. [2a00:1450:4864:20::642])
        by gmr-mx.google.com with ESMTPS id q12si266037wmj.0.2020.07.22.07.21.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 07:21:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::642 as permitted sender) client-ip=2a00:1450:4864:20::642;
Received: by mail-ej1-x642.google.com with SMTP id a21so2378013ejj.10
        for <jailhouse-dev@googlegroups.com>; Wed, 22 Jul 2020 07:21:03 -0700 (PDT)
X-Received: by 2002:a17:906:1402:: with SMTP id p2mr29077009ejc.126.1595427663284;
        Wed, 22 Jul 2020 07:21:03 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id o15sm9891edv.55.2020.07.22.07.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 07:21:02 -0700 (PDT)
Date: Wed, 22 Jul 2020 16:20:16 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200722142016.zokufzzm63ly2oo5@carbon.xt3.it>
References: <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7e4zkm7zitxyqrmw"
Content-Disposition: inline
In-Reply-To: <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=Q2+QvVQa;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::642 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--7e4zkm7zitxyqrmw
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 11:29:21PM +0200, Jan Kiszka wrote:
> Regarding dynamic coloring, I can only repeat what I stated before,
> multiple times: I'm extremely pessimistic that you can turn on or
> reconfigure an IOMMU while you may have transactions in flight that are
> affected by that change. How to collect the pieces when you do not know
> if a transaction finished and which address it hit, the one before or
> after the change? That is exactly the scenario when trying to move a
> root cell from uncolored to colored memory. IOW: You may implement this
> but you cannot make it robust.
>=20
> A more promising path is pre-linux Jailhouse boot, maybe even without
> root cells after that at all (needed anyway for shrinking the runtime
> code further).

This time, let me try to dig a little further on this point.

From a purely technical standpoint, having coloring implemented in the
pre-Linux root-cell loader is of course a more proper way to implement
the feature, by far.

On the other hand, I see two major drawbacks: one on the
software engineering level, and one in the product management one.

- AFAIK, pre-Linux Jailhouse boot is not only highly-experimental and
  immature, but also an inherently optional.  This means that it could
  be dropped anytime, or that boot support could be missing for any of
  the supported hw combinations (with ordinary Linux boot).  This would
  therefore place coloring in a very weak spot, its solidity depending
  on another optional feature.

- Maintaining boot support for all the hw combination one needs to have
  cache coloring support available is costly.  (I bet you know very
  well, Jan, given that you placed the Jailhouse project on the
  Linux-boot design cornestone.)  It is hard to imagine board/chip
  makers widely embracing, contributing and maintaining pre-Linux boot
  feature for their products.  This means such a cost will fall on the
  Jailhouse integrators who wants to use coloring.


> More important to me would be coloring of the runtime paths of the
> hypervisor.

I agree.

> Here the question is if the simplistic approach taken e.g.  by Xen to
> just assign a single color-set to the hypervisor, shared by all cells,
> is enough. Or do we rather want per-cell coloring of the hypervisor,
> using the color of the cell it is serving. The latter is more complex,
> I know, but definitely more partitioning friendly (read:
> deterministic). Before deciding which way to take, it would be good to
> have some numbers.

I fail to understand the solution you propose.

- Assume we have two cells.  If we have 2 regions, instead of 3 (the 3rd
  being for the hypervisor), then each inmate is more prone (not less!)
  to generate cache contention on the hypervisor code/data, because it's
  shared.

- Also, in order to have a region cacheable in multiple colors, this
  needs to reside in multiple physical regions of memory, each mapped to
  a different EL2-VA space, that needs somehow to be chosen at runtime,
  depending on the core where the interrupts dispatch start executing.

- Finally, even if the solution has benefits and is implementable, one
  may still need to have the Xen-like solution, in order to enabling
  hosting some critical, hardware-management-related feature in the
  hypervisor. That would be mapped in all cells, hence unprotected.

Does that make sense?  If not, could you elaborate further, please?


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
jailhouse-dev/20200722142016.zokufzzm63ly2oo5%40carbon.xt3.it.

--7e4zkm7zitxyqrmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8YSyAACgkQCtn83XWC
Ln4r0Q/+Nr2r+Tyy/3+O4nPHQG39J8qEzvYaZ46Dojl1/vKg1o/ZT1uAauU5Wtev
gV3Wl2lQbO8DZ5oVvbrDykp3dinzfpiR9WvfEDTfmFYGLkyP58/bs9YPQWyzCUM1
ikq2XaEaxpCTyRK/cvVn8lGAjYj87+bTL1DoEhT+zIhDbQyQ2OMUl+YSN7tqbTbr
bsy8h0MaEEtv+w+sGPHtpWCmiOSX7jcC2EyOUuq1A2G4SsLhhkiQHBgtrrhL2r5z
3JreSLRURCSj61ZAHpsc2MPtKNTXN51dcv3O40ta71Fad+nQHygmYXaO3n9R5rmp
MVkFjKeai4nupXx4sBLj9I3Gyli3e83BRCqQzroS0xQcTPHGTzkMZOsD5MKlpAZp
NqCCi+TWwrXokOF1D1SEAgH8GeOvv6CD0cVkWLW+ENOfrblPZQnXHE2p1Fa81F/w
rxsGAU+8czOnCUDaWZILUEsDHr98l2BYRR+2rpAmbFS2Uy5UHVw7EaGu00rl1Sm0
wrd4Xu+bXzBxb94YumWifvaYOVKP/SkQIa20sXxEfttJMpresfPQzLjl0JQ4rTCJ
c8XyP4q674iPvHAaDgUS6aKEMxKjpVoIR9SWYm8s5L9Navz0oyXcOKJLPQYZEb2F
TXFUEX1yg1FpWF6/z0QdTj54qjxEkXffUzwX9bmn2TE1T8DQgUg=
=/Ktd
-----END PGP SIGNATURE-----

--7e4zkm7zitxyqrmw--
