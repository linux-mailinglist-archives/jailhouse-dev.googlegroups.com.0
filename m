Return-Path: <jailhouse-dev+bncBCOKB247TIDBBFFRWT3AKGQECETRQJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D11E22DF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 26 May 2020 15:24:37 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id a26sf5460549ljn.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 May 2020 06:24:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590499477; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tlf45CFHY6nRyTrPGJWIe8gP+AW2t6QPiB7I+BlZ89keFaHPd/fH01joYLbQw++bBN
         wPc6uup8092euXSY2jsE5OOR2nY2Un2SPlAiKx7JV0i4AprNW1Q/X/8wO3LGtz90PJOb
         pvFpvlYZXeP3/YuRL+OqnPWZqmMdikFOXEU2bNHOAgEfsRKgwNJvtHBEixZHgHABqHl4
         +IfDytF6J8USBzy+9/ASqPkRtn6SNIIoOSmSMdlQi1Iouwa8C1rCqiqMCkTEqSepMN29
         qz+uWSnZwP5UOolPW/7eWboyjnlBdbUHNitkRKjD9N9pEtm1bPIVi+imfrck5DlQmhn8
         nX+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=jkmUpTpsjt2HAfQvLiLu7Png+w5XaQKcatW4vXkJOEE=;
        b=aSR7hivF0BGSgIE9KcZ30J1lj7I8SAeGHpV6gPO1bAAR14k993sgdUcMrHdaCGa5S2
         RSsueQ9ZYGOtZf5cnXOwEnDkKqU5n1OapgxKvXCH4yKPwDA9TrsYz7/pj+xZuPalY5J+
         rwzWxjEVNGesXz9po5edaaFwvlGLe3JjgUGL1x57tvFOztevd2CJHQmGT0C4XWO90Wl6
         hee8PMLSWicfhgX+tjEq0hETWjeGp4gZl4i0H5QHwhwm6BLQBpoRBIqHtDsFM53DzWNB
         VA6ulWfCrVGeQXjKozmsugWt5ChvTAaz5cH1aAFdUlcIFNl0aT1v0MN9e45dS2Dg5Hzp
         jLaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=Lo57IWRT;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=jkmUpTpsjt2HAfQvLiLu7Png+w5XaQKcatW4vXkJOEE=;
        b=NNVwN+tJdi6wH0zo1j5w07DWUkiTQEqoabYf/YCEuDNFtWJmfFK+kg6UB7FjJhX2Nk
         UodoKm9Dy4sZtJ3Znyh0TN+UTHXcI0pQqFZM2xE33q9j37cV2NZUXYv6OBOlTAeCN3I2
         Uy+sgWV6dM7rCQze67RhEJnhTGXiJaWvxKbMeiEexqSTZRHcsOBVOmC3cqvh+orxoeKK
         Ly0BNFu6v+1YEseG6FA3x7+Jeg/E9wEcH9egl5od11uuBhDs7qXOpV8VPjbntke3ynmx
         s1/9wYoBHHhNXdYrmTH16NEDi7tQFDcwzrzsrfgpUXi+8F8lNidsXZhmwE5U9YEhT6z0
         7xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jkmUpTpsjt2HAfQvLiLu7Png+w5XaQKcatW4vXkJOEE=;
        b=g0eACyGfU/tq+fgsxrnEzSGHs0E2hMxofgMTGezy7lYDNa4atwTrd6ca5whV+FYROj
         nRTe/vCMWmKtm2LNeezL1We+rYCR3xzsd9yGGyMMqZsa2pxNxHbryOgnA+RXQ5f5mrJF
         2+tWy1JVGqB/bTGvc34V9fsJvUOAnmvfsXbwy0avD0lVZRTKa0sUsFOsNPyzG6llOJGt
         KqCTz7DzXuUQcmN5rvc72sLa73fhIZcHU5w9bLuvVm4GXl2+1LAKhkrtauiqWr9+YESI
         SSf5Z9mMFCEORABx26rg4xUYAnLPK5U/n73Jb6/ucfXk9urEl8VIX4mqqU8qPOYczO09
         jZCw==
X-Gm-Message-State: AOAM530bCAJpgJ4/bYhoRizeJ435/IUH2Mnm9sl4C9GgXlHTCXNO1Mb2
	K24/L8aot4KcllxN4ES1Gcc=
X-Google-Smtp-Source: ABdhPJwU72Xcr32XqhwNWR8AeRRfWO+b0IInxDZMdh7FO+w2dfnFdj8oskWFDhKXMfJ0tkXFLzVlkw==
X-Received: by 2002:a2e:9242:: with SMTP id v2mr637850ljg.41.1590499476756;
        Tue, 26 May 2020 06:24:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8599:: with SMTP id b25ls2116372lji.6.gmail; Tue, 26 May
 2020 06:24:36 -0700 (PDT)
X-Received: by 2002:a2e:901a:: with SMTP id h26mr686541ljg.80.1590499476006;
        Tue, 26 May 2020 06:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590499476; cv=none;
        d=google.com; s=arc-20160816;
        b=HLh5+JYtsBbtowjP7J+PvC7kEknijToBcJHFIqQw6XWIabrBvfJVMHc+Bl/41yf7pX
         OnYqITRc/NgysV/+qwp+7ANXiiSEm5BCVFSc+iAC4LN38LyZ87iMWmcHWhUwMlZ5ucWG
         9rd4VRGhQS4+ATVVIH+rSImIJYU4YHHuVEfZzTNg9QTcFPdqim3UrVyiCPZSW0SBmzt2
         3M5q7ufH2SHn48j4lnA3CHLbdNJz3ReULS+Lo4IKg7xUKNBylWfrZE5ThYPeDQ9+cVH5
         grGQfYfiPTZ5UIjFiPvgUwVZ3h+tmY5PC1oD5ssbCOA+389qynRO+HRO00SapLgreii4
         URzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=rFAE/VNoMfmhVX8Y174Opmfk0XYFvSXrlYfqgi6Y9hk=;
        b=T81Wukt2tygfBq+AUbSPS2W1AKIPK32S2BSe5iX+n5s6V1ZPPJ8xjalR5E4A9NYojd
         ljy9ng8+ZkZ1CDV2t3jmJJ2hCfhTaUGv8Jec919OzactEBhtbPnCKDqXPCtfSToar/xI
         oDQ3Fr56ROMa6FLMACBZE2f6GSc8xPobbOlIdpdQYZ2MiGi8UAubUsD0v6kQ5KQJzr0R
         i9tegUlIIG3i6Ms2VOP75qxO5Zg1ZHt3QO9CGMG25U9IwRbV/W9VwLlV6sEJrqh/dCod
         QVNEXJVA+BxdmPE5UYALUx+Xuwb2nGLknG8qmvstx7b8wOYpI1M0T3AHveb4gT21ARKw
         rHuQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=Lo57IWRT;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com. [2a00:1450:4864:20::343])
        by gmr-mx.google.com with ESMTPS id e7si355ljo.2.2020.05.26.06.24.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 06:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::343 as permitted sender) client-ip=2a00:1450:4864:20::343;
Received: by mail-wm1-x343.google.com with SMTP id u12so3191528wmd.3
        for <jailhouse-dev@googlegroups.com>; Tue, 26 May 2020 06:24:35 -0700 (PDT)
X-Received: by 2002:a1c:b308:: with SMTP id c8mr491977wmf.127.1590499475406;
        Tue, 26 May 2020 06:24:35 -0700 (PDT)
Received: from localhost (hipert-gw1.mat.unimo.it. [155.185.5.1])
        by smtp.gmail.com with ESMTPSA id k13sm20729448wmj.40.2020.05.26.06.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 06:24:34 -0700 (PDT)
Date: Tue, 26 May 2020 15:24:29 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3qdxik6jhjx7l7ml"
Content-Disposition: inline
In-Reply-To: <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=Lo57IWRT;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--3qdxik6jhjx7l7ml
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2020 at 08:54:32PM +0200, Jan Kiszka wrote:
> On 22.04.20 10:51, Jan Kiszka wrote:
> > On 22.04.20 09:22, Marco Solieri wrote:
> > > On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
> > > > On 27.03.19 13:18, Marco Solieri wrote:
> > > > > Predictability of memory access latency is severely menaced by th=
e
> > > > > multi-core architectures where the last level of cache (LLC) is
> > > > > shared, jeopardizing applicability of many Arm platform in real-t=
ime
> > > > > critical and mixed-criticality scenarios. Support for cache color=
ing
> > > > > is introduced, a transparent software technique allowing
> > > > > partitioning the LLC to avoid mutual interference between inmates=
.
> > > > > [...]
> > > >=20
> > > > Thanks for updating this! I will refresh my caches on the topic and
> > > > provide feedback soon (I already have some questions and remarks bu=
t
> > > > I'd like to double-check them).
> > >=20
> > > Looking forward to hear from you.
> > >=20
>=20
> Done with the deeper review. Overall, the series looks fairly good. I see
> just two bigger open issues:
>=20
>  - inmate loading interface
>  - more architectural independence
>=20
> But I think those should be solvable.

The major point you raise is that the impact on the hypervisor code size
should be minimised -- the inmate loading interface.  We took a while to
consider and weigh the various alternative designs.

First of all, let us consider the optimal solution in this sense.  That
would be placing the whole colouring logic outside the hypervisor, in
the Linux driver, or in the userspace tools.  No matter how implemented,
this solution would require, sooner or later, to pass to the hypervisor
a list of memory regions, one per each memory segment to be mapped.
Now, such list would grow unacceptably quickly, wasting a lot of memory
to store it.  Take for instance a Linux inmate, and suppose 128 MiB to
be its memory reservation requirement.  Now, assume that each
consecutive fragment is the shortest possible, i.e. page of 4 KiB.  This
means we need 32 Ki elements, each sizing 16 B, which is 512 KiB in
total.

This brings us to a design conclusion.  The mere colouring logic -- i.e.
the algorithm which conceptually expands the colour selection within a
memory area into the lengthy list of contiguously-mapped segment
(next_col) -- must be placed together with the mapping function
(paging_create).

We believe we can leave everything else outside the hypervisor without
much effort.  We can move in the driver:
- the cache probe function (get_llc_waysize)
- the initialisation routines (coloring_paging_init and
  coloring_cell_init).

We believe this is the best compromise.

In this case, a minor issue is also worth to be discussed.  The cell
load function requires an IPA-contiguous mapping for the memcpy to be
efficient.  This in turn requires such mapping to be performed by the
driver (we don't want to add an hypercall, right? ;-)), thus including a
second copy of the colouring logic (next_col).  It would be nice,
perhaps, to have a 'common' section where to place code shared between
hypervisor and the driver.


Looking forward to hear from you.

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
jailhouse-dev/20200526132429.bmhnaiug7ssblxty%40carbon.xt3.it.

--3qdxik6jhjx7l7ml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl7NGIwACgkQCtn83XWC
Ln4dyhAAqpKrMObJupTQuGXlYE9frVDhCsE+EEBr66kNB4qhSuSGZ1N3OUd8MzT4
OkL7o3ba0pPUITzGnnAymuappTxCwzhA8sqmYnjvH0bU9GRur7gt7qgzpTd+YsCo
oKwEF8UmKXaAOdHbubkMc/k9qvYKwXemka1LZU2w7MUjKoemSsDI1IGUiM6s2arq
jcPc66ZyAY9KumnE34IjLHU5ws+7bmyEAVQMKm7kXLwBvF9Y1KNmJWAI4yN4IaR3
Zmio8m7RoXkUdY8P2f66YwxIdr5T0K0cYE2rZ8MP5PBZJvCjsPK4XvH+XMay56tY
hBPLE3g6qL1JvQH3TLqEddDS/Vsnt7jivI7ig5y5PAplHZg8GLOj/Fdew7SBTQhT
4ehRZ5oFs7GVXvhmG94RT02W/G8rI1wQLHxohYvtcQ5eRwvDzJE25BGXAyPZYmmL
5G1ciMp79z0P43a2TdQL19A7e8lGQQbpB5v6v2vUgn+xZcfIvr5e7PZ2vuHemkk4
7+dsWTlNAIjBm6URe2QIfk/WGH4yRO7v1FbqGbW0nxnRt8XIn2N0apn1OHGVu7c3
t+J2+3Cwv+l7djv8JE3M2vTMH/OTTLjvOTyjlLvp+8teSfH9hn2gc1OkxL06nK4R
0bn88/+3ByXEykyFEZFm3STUhS/OBT80J0uLnxPzDEyKBvyWVK4=
=pUur
-----END PGP SIGNATURE-----

--3qdxik6jhjx7l7ml--
