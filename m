Return-Path: <jailhouse-dev+bncBCOKB247TIDBBVGZ774AKGQEBM5HRSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA18230649
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 11:16:05 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id m13sf5353919lfr.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 02:16:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595927764; cv=pass;
        d=google.com; s=arc-20160816;
        b=VQeRDvAnXTXelarMkVUyFGI5VHxg+C7FNPjekc7K7fNVstRbgHl4xTrxgzU2dD4Xdo
         D9NQYUFZulf/oyKtYHyFu4qTyJJ+fs9SzBTVQ3KpBo9fvHGiAi/N2gIDN5B5/4fCLAe9
         wjoaZle8/TLWvgxK8V0GdMTizdRM8l2nwO81MFRCjroDvd/ts6DceNl+Pcy8Ffz2GWkc
         14JbVoE9vFf/V1bDvTPvZxfEfVibW23WVsGZmf/AE5c0LtVULEAz/oujIhizAMvmEFw9
         KqWY9LJicK+eqlkGHjMtd5CXOhaSRN/V/AjHdvxnbqQEl5LDsX2y4NcBM0yueR/xP2dd
         Swpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=WQ2RwlYbu7yeMc5J/vXaHcFj27dcu059nlzP709Grb0=;
        b=HaIgNXC3pagMgteaT3edZnnoXctjLTdUcwBPbOecdTAXseHO68BOWAM1uv8Y4lOV/4
         QIDVsKDuaWtTuUxAbheDag+uZBCHkYYs2fV5rkXcYGMO+CFx8kuEBn1sHqMpQEu/u4Ht
         EyOKUh80b7o7fNIWaek8zOlA3mkX2tzs7kfHZ3JB/2tIgxe2l6uG1a1bA6l2fJttFrv0
         LqJouMBqgherLuZTK7dm6QIWBZQkoAnGHruQOmPF5BzvWxT23sNcgUAENIauf0jdIJNG
         pgbAtC8gMTNJ7nvx0LRI/DTHqUNqkMrDALosPqY09xjW2IN9NGfYxPg4Eoqe+yYj4y02
         ce0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=C4sgkES9;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::643 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=WQ2RwlYbu7yeMc5J/vXaHcFj27dcu059nlzP709Grb0=;
        b=YomoRESlLwLsZHiqIx+ZaQME0Q8pcg+FI+QopHi9BQk3TSYTQ4kUGZkuXv6DNjud6b
         ILfWjyvt9+Bsh83/rg+e/Pnee3GMVdjRLDF7181P2wg4DFeZ45gRSmwk4iguc0+CVSBy
         +FEDCA9U1imdDib3qJBFflv6dshIW8rM5/9Ool/Ag0mkl6NzreQ6dSti5j8RXRPaAm6u
         ES7i8jHgJMfnVG5VTPJx8i7GSxSulwX8A+9OJq0MFxPvHhILe+xGy0DehoCCJxtrWZTj
         0aNExoXEsqbTe24QmBIq14Ej8nVwMBszjxDDKIZya4FuMvd3GkEYS9bZhH/r42w9MO2M
         2okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WQ2RwlYbu7yeMc5J/vXaHcFj27dcu059nlzP709Grb0=;
        b=oWbwUT6ZmL+CFQXeo9sxJg4XuKKDjQCX001NPAICr6zQO+TsHKeJOmmLLlK/3a5UTc
         Mr7IZ6J5a4lmGCeHRIkZG82s1pYshifPjCe3rxHPX2XP1n0lMLn60aXzRznI+H4iqkuZ
         lTaLwmnSGhZ9gDc6egtLG7XhzzmFVjAvFvb1e9vsKyUQ9Z38Y1RYLMVM/oRX9Zr9etgL
         eDSlb+4ZTRIGxjU/k6JJ0wGOui+/qZS2DJSop8rh8S6XjKguXwagIBqWQRnnM64Rx9Ko
         zqZsN2I45Htki1JDqac9QRmLITp2pGeJ+AUu7ijNPPmfD9ufw37UvnIYklWTsiLK0eao
         CDhw==
X-Gm-Message-State: AOAM531/+stvelELsTNY4sEEAY+TnEe/xPrTMQhuws7uziQ5cj/h047i
	JhZXXMCvWyos/Ot4/7IhIB8=
X-Google-Smtp-Source: ABdhPJzn6c6eU3mafWi5R8qb+zD+dsYxfhlI51fYc7oCZTnC2r7+SGhkzumFl/8jBpaFSoxi49Ov/Q==
X-Received: by 2002:a2e:3602:: with SMTP id d2mr12532804lja.152.1595927764532;
        Tue, 28 Jul 2020 02:16:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4f43:: with SMTP id a3ls3194082lfk.3.gmail; Tue, 28 Jul
 2020 02:16:03 -0700 (PDT)
X-Received: by 2002:a19:4857:: with SMTP id v84mr13698402lfa.195.1595927763753;
        Tue, 28 Jul 2020 02:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595927763; cv=none;
        d=google.com; s=arc-20160816;
        b=ro18j6OppIN6AldLYSyQB9wsGvJkNqPkp4iNHOAGOKnJA5LIo+hzUOBuYQ8A2wWC/7
         tiLjdqrvqOOu7bpIMs9HLUfd1mAc7MFCEtcon9JQ72kCGNWN4TMpKYy6h2JzbSMWZBol
         IobAhna7LtDJbLrwcCrmD4R3FghyDgCdQ8SSU/Y1QZRnkYnbP0O9de3T3VJzFBBSJT2a
         NLbHZmFPE8GtNvDq9OewT+uUsfFq0+1K+s3qtkN0FPsQc0a9qWNW4pAqrxrR9JHaEuC5
         HpxuOBlKgMkixvscuJA6Jtqfy08m5U+cOP2U8PqUZgFpYfeaQvO7TG0cAKw9XDJGLWzh
         4GCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=A62VReLzsjf2leD5SsG2SuUQlVGtwDpyfvtng400eaw=;
        b=Fo4V9j+Zl6M6PRejovI9I/UFPmvq/FINAVK90cf/sxeAjZEPcvcTifaIt9WloM5R8x
         piJMbAgU0hnErMzAAPH79TrRK5q7+ngiqaPzyphsr0yWPm2AdEUjIN0SArsm33WcIH1R
         jJ8VXGhqJL1JlhOB3nWdiLZqyYJ+yqF1Danj37gQMrIrasAqjs1E4ap/FIxLoA+1gE6B
         GFkzENNqKM/seX/QuF4AGdLZywezZqmLY6wfndjkZPP4cG+flLk7zU/y9UqQ2NESlsFO
         33smPvARUCeD3AxOlRPJmOXW3s3selQZeWWKD3xv0qfJHL21INh6Fr593NgjovkSUpSS
         ZTBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=C4sgkES9;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::643 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com. [2a00:1450:4864:20::643])
        by gmr-mx.google.com with ESMTPS id k9si420440ljj.5.2020.07.28.02.16.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 02:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::643 as permitted sender) client-ip=2a00:1450:4864:20::643;
Received: by mail-ej1-x643.google.com with SMTP id w9so19882508ejc.8
        for <jailhouse-dev@googlegroups.com>; Tue, 28 Jul 2020 02:16:03 -0700 (PDT)
X-Received: by 2002:a17:906:2296:: with SMTP id p22mr24179337eja.510.1595927763325;
        Tue, 28 Jul 2020 02:16:03 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id ch2sm9297519edb.87.2020.07.28.02.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 02:16:02 -0700 (PDT)
Date: Tue, 28 Jul 2020 11:15:07 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
References: <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
 <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nz6hfa24ujx6h4nd"
Content-Disposition: inline
In-Reply-To: <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=C4sgkES9;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::643 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--nz6hfa24ujx6h4nd
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 11:39:48PM +0200, Jan Kiszka wrote:
> On 27.07.20 23:13, Marco Solieri wrote:
> > If we understand correctly your
> > implementation, you are mapping the entire memory region and then
> > copying blocks of the binary image using what you called "colored
> > offset" function.  That was very similar to our first (unpublished)
> > attempt to implement "colored loading", and we soon discovered it is no=
t
> > very efficient.  Loading time grows considerably and could impede
> > scaling up to larger images (e.g. an Ubuntu-like rootfs).  We think tha=
t
> > a better alternative is closer to what we proposed in the last patchset=
,
> > that is:
> > - create a colored mapping,
> > - perform a "virtually" contiguous copy of the image.
> >=20
> > We understand that this logic has to be moved outside the hypervisor, s=
o
> > we would like to move it to the driver, exploiting Linux virtual addres
> > space to create the colored mapping.  What do you think about it?
>=20
> Did you examine what was causing this slowdown? It seems highly
> counter-intuitive to me, given that we are only copying from memory to
> memory in 4K chunks, just using different virtual addresses - that' all.

I think you are right, indeed.  Doublechecking our old (and slow)
prototype, we discovered we were actually not just copying at each
iteration step, but we were also been ioremapping.  That was most
probably the cause of the slowdown.

That leaves only a design point in favour of the contiguous virtual
mapping.  It makes the implementation more robust and elegant, since it
enables the copy operation to be independent from coloring and thus
reusable.  This is enough for us to favour this approach.

--=20
Marco Solieri, Ph.D.
Research Fellow

High-Performance Real-Time Lab
Universit=C3=A0 degli Studi di Modena e Reggio Emilia
Ufficio 1.35 - Edificio Matematica - 213/b, via Campi - 41125 Modena
Tel: +39-059-205-55-10  -- OpenPGP: 0x75822E7E

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200728091507.35bodtnsvbgcwxvr%40carbon.xt3.it.

--nz6hfa24ujx6h4nd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8f7JgACgkQCtn83XWC
Ln5FOA/9Ffz0UP3ItiyYLVIF3Uv1rGT5itjGLjnOG1IbiGrsRGYAW4EdlTt2iSkV
rQHR381wvVcHl8WqAkUOQ1WgSJjCgSnh3tc1ciAts4NCR4PVIZFZ+2sQMRapfSFU
t+ksVWhQvKx/OcWiUwazjnbT8jb6iIPEBJUD7ZuoBb8D/T50gn1UqHYr4zsk5fBM
N3LZBYtIGbpmbNvGCPgZc1v2Do65fxogV6YH0r9MaP89NX+OWtVSeaLKQlkupSQ6
QiFN/NU0Ga7FsFaw8De8e9FNpHiw2OqTBtf7/oa5AWURjgmywCAx8ZJtlqSn+fNI
e087/TaxIBB5MaqBL0yb4GCsqgHkWEYLscTpcUugwbca91dzZBbwLTzjYYxXOov0
O2co5vTSQ0SnozD/4TrZkBr/PmzlIT3ArSwVjeO2tOcapZaXt31T99eJ0qR56gWP
WtasJtxnWy2wx6XqCGUbqgavPWaCvDAuwP62ruaUGwlHRsniztU9uC7WEaM2QJ33
uRfQbhgwzli9uPiP1N3UsI7Bv8Lp3m/XjNZIiOvXpwz/myVC5BFRz2NukWIOhskH
G1a1ji0PP/PuyTGgf74wuikXOyGEhDiFih+a5fR0NtiR8lSYEJ1IfZoa0w+aT4pC
MCKlGm5MyXoINSKunuzSlYY+U9b5f4Hgo91KRRR7Y6mA2aFLp0E=
=3whS
-----END PGP SIGNATURE-----

--nz6hfa24ujx6h4nd--
