Return-Path: <jailhouse-dev+bncBCOKB247TIDBBXG4Q34QKGQEXZCNX7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F6D23233A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 19:14:05 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id u68sf766855wmu.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 10:14:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596042845; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mdi8lhnT5QevEQ9TOgwuuKu+Tr5hqqu8fBHuGyJy01vvCBGMH+Z+D10aFHih8Ui5pZ
         6TDHEvalLXWxCBpubGnf543hGFx7+usjKaB2HqJcXEmduZ8MLLuS7eXbMbYu3DP5Yupw
         x2mlkfxMuVGHkN7bl0vAnUQ7qd+3uJvumTyzMd4MryAprADues2dtKR6RSYtFLMRrFwz
         rU3q5+nIcW403bEEzVBl+BJH2qOqPLBiuRMITgfoL4mIcUJ8ne5fyPOuivS6/HVqR3vW
         /0Gu9YfLI79Rmq1reEY6kTBcXwcNOt6TGPFd0VUfIp517Or5UOPYTW5k5qdcFCABCMVU
         T/6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=8ubW6T7axxgg2uHCOtHZzpULhMS8au6CCi8rm2x4TTo=;
        b=qhiliaIPuE/8z7pLll6cv+MO/NdTZIztkD0GgqnxxisY4baeq17hbFHqr9gZhlKRBy
         00kPa5WQt+XU2gT12mEMArv8x7E2AY/MZdiMzeJVg85/0ULTAu5n0Qp/v0XpQj2iXx0L
         YeGngNQpo2czxQ+9uuSNe4/8UyaxMnb9i3M2hzIjmAwijxn1wzr1QGjdCwF4AgFkAAJU
         reVHOwkOIXYdBEFjzGt7aFvylrDPREGrhCgnxxmqCzDdzS4O53BoJ4XTuxYpA7F1vPDr
         WKXCR+RsfcjGaQSegT06yEZF65qP1tWfF2jJiq7FdSHU//I5OMGPKcrRSLbCXYSFoVIV
         O9PQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b="U/jnUDBV";
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::544 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=8ubW6T7axxgg2uHCOtHZzpULhMS8au6CCi8rm2x4TTo=;
        b=HyIqBH1lWuLjYvQquMa8QEPKdZ38+2lBJQbx9TCR2Wvlzh1Qest5D27tO4Uk43sgnW
         RiRr8VgircuU5vV8IzLUrX8zLLkt/h+f2lxzgUdf+b9f8yXwvEZmO9Ra3ji4RDPzWQGM
         xg81XyNjLdv0CtR31FzTx1XORNJ6PWt+tGrscRdGTqp9lLKpusbmaE5mSOUXaYPO54Wm
         h1kY/FGXF1Xodm5scylggQK6n4Pl1aHZR9ozojCjr29OZ1bX7outOhdO4hjk9mzzJ0K0
         WI9u/5KGvmc85A7BHnoS+kMzzsvfYuMAThQYLb/gc1BHEjKwKT5afKQLTAFknHiUuDTX
         epSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8ubW6T7axxgg2uHCOtHZzpULhMS8au6CCi8rm2x4TTo=;
        b=TYE6mThpwl17pTN4eUqHOdWk3u9DXNyOgATOsPxaKME3170Mlv3ow10ttZsFIemnZQ
         N5y6lr+QEPl51UBDVTL/JoAQA8IdbCh7Zul6Q4hpoAyDpRgpJTX/NomMHy1ScZpMP5fs
         iksYyqnuUILvJTIzhZpyMyUPCAze7kTMK2/4tVzH8BbLHIrQU7IFfl4wks+ucfeoJKub
         n1lwe/FDSn/+E3C6YIsub+RdEPkTftG94oj865NM07fBo8naQc8gbVDzdGubODaNNc3N
         qfTDF8OJhYOJUWbggB8uEAgw1bQgA5lvRiARpGFUbbqscqQHXE0xZhtFZUPOZZOhoMpw
         GkHg==
X-Gm-Message-State: AOAM533QluQm+tYO8dYhlMP8dpuJ25liCv3fQXAaDtIHlemvPNdFLueP
	GuTGbFm5W8bZBt9Kj2p5xYU=
X-Google-Smtp-Source: ABdhPJxsQSxDLRgq6/VHQ0UZx7Vy5P0qCJKfQlfczvHGWxafBe7NtPa3Jhe6f1zfHUeNpoPv4xB2Iw==
X-Received: by 2002:adf:f151:: with SMTP id y17mr24397321wro.179.1596042844925;
        Wed, 29 Jul 2020 10:14:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls1893386wra.2.gmail; Wed, 29 Jul
 2020 10:14:04 -0700 (PDT)
X-Received: by 2002:adf:fe50:: with SMTP id m16mr13326704wrs.27.1596042844214;
        Wed, 29 Jul 2020 10:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596042844; cv=none;
        d=google.com; s=arc-20160816;
        b=IYDSbUl0/2/IZHKo7YTJjOI1NxHNTHcMJjqF47n2mhj8wM/Dk34hnb7gAIvAGLqUSM
         VvbPOjyOIugK4Vte1tMeccQKMkxP7+ik1kJVXiE2NK4UN82IDy+bbb3do6340H4d0nMk
         88QgcZCkk23R11a+ab4Y0M7dSLAjjiNJSnqnYUifKPN9GsPA88RzG3AFAxJ46xRFSDdM
         DFUO2H6OEcP4i6sIeToRPIuZJKBzfVZgkIAy3jSi04xrFkKcLLwbkfUekBJoodpzWPMN
         DpFFiVHaFzSkBGcv4yz1Qahgoc/iPP+luU9Wl6AEo1yP3xDXgbSq1zw6IE1QFpeQgAzv
         j0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=NJ2fs0wgntnz/QajgHZm72K4V2hwx4b+otWNOU31SdU=;
        b=daSOobcpPQ6ulPnyYRbdENW7adHFuUoMEWCWSSErQI5S2dcbwF5k4gVWqItRBKEtcE
         ws7pONlt2lGh1jCoHx/FkMww7UloKv4tufe7sZeF1FJTgEBiSamxdBRtAUvWhJlHWiJi
         BGOOpId/zV9FklNk3gZJ3WLUbO1/UHKeYo/lKYIHftD30+f3wlU003K6/rZSkmbsdV5s
         lEay9NilQMSzia4K68CPOz4unWswxbIzoIZqL3M7QErhj68NJwgT+q5UqGEXRFfd/UD/
         q6KdPxwGxkMedPIQg/lftXtb4W0HpQTRNuAMID5/OIc6GpFV2EIwCMquzYNIinwknGMM
         FW7w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b="U/jnUDBV";
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::544 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com. [2a00:1450:4864:20::544])
        by gmr-mx.google.com with ESMTPS id i11si161921wra.3.2020.07.29.10.14.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 10:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::544 as permitted sender) client-ip=2a00:1450:4864:20::544;
Received: by mail-ed1-x544.google.com with SMTP id m20so8483658eds.2
        for <jailhouse-dev@googlegroups.com>; Wed, 29 Jul 2020 10:14:04 -0700 (PDT)
X-Received: by 2002:a05:6402:325:: with SMTP id q5mr6649891edw.343.1596042843871;
        Wed, 29 Jul 2020 10:14:03 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id n2sm2291587edq.73.2020.07.29.10.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 10:14:02 -0700 (PDT)
Date: Wed, 29 Jul 2020 19:13:09 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200729171309.ds5lznjj6xqh37sc@carbon.xt3.it>
References: <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
 <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
 <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
 <ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c@siemens.com>
 <20200728110945.w4o52pgtq33ic2pv@carbon.xt3.it>
 <d8b12a27-69dd-e47e-a7e2-258192696bc6@siemens.com>
 <20200729153242.f6txtzeqbeqrtcyr@carbon.xt3.it>
 <5369cf35-5291-440d-642a-9f23cccc854a@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fz5itubxja6gikwj"
Content-Disposition: inline
In-Reply-To: <5369cf35-5291-440d-642a-9f23cccc854a@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b="U/jnUDBV";       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::544 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--fz5itubxja6gikwj
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2020 at 06:08:16PM +0200, Jan Kiszka wrote:
> On 29.07.20 17:32, Marco Solieri wrote:
> > On Tue, Jul 28, 2020 at 01:30:37PM +0200, Jan Kiszka wrote:
> > > On 28.07.20 13:09, Marco Solieri wrote:
> > > > Beside the "offset vs next_col" choice.  We would like to stress th=
at we
> > > > need it to be aligned with the concept of colored memory that we ar=
e
> > > > proposing in v2.  This notion is present: in the user configuration=
 and
> > > > documentation, and also in the hypervisor code.  Namely, given a co=
lor
> > > > assignment, a memory region, and a size, we want to map *only* the
> > > > needed pages that satisfy the size request.  I.e., not to assign *a=
ll*
> > > > the pages of the given colors within the given region, possibly
> > > > exceeding the size request.  In other words, the size parameter is =
meant
> > > > as the real size to be mapped, not the place where the find it.
> > >=20
> > > I didn't finish that part either: I also believe that "size" of a reg=
ion
> > > should reflect the physical size, not the virtually expanded one. Tha=
t
> > > virtual size makes it really hard to read configurations now. Yes, th=
ere can
> > > be tooling (config checker), but when you start to rearrange regions =
you
> > > will continuously run into those overlap issues because region do not=
 really
> > > end where phys_start+size suggests.
> >=20
> > I don't think we have very much choice, here.  We need to pick one
> > between:
> > - having a true region size parameter and favour misunderstandings abou=
t
> >    the end address, since phys_start + size !=3D phys_end (v2 proposal)=
;
> > - ease reasoning about the real end address while using 'size' as the
> >    'phys_spanning_size', since end-start !=3D size (v1 proposal and you=
r
> >    currently favourite).
> >=20
> > The situation is symmetrical, but about one point: v1 make the 'size'
> > semantics explicitly incoherent.  We would avoid that.
>=20
> So does v2, see below.

Not completely.  'Size' in v2 correctly means the size of memory
addressable in that region, both virtually and physically, although the
such memory spans a much larger memory area.

> > To mitigate the configuration difficulties without the help of the
> > tooling level, we can promote a good configuration habit and comments
> > like this:
> >=20
> >    size        =3D CELLSIZE;
> >    // phys_end =3D phys_start + size*(MAXCOLORS/CELLCOLORS)
> >=20
>=20
> ...which would be only true if you aligned phys_start on way-size.

Correct.

> Irrespective of the semantic of size, such an alignment should be a
> requirement to enforce in fact. Otherwise, things become even more
> confusing.

Enforcing the way-size alignment could surely help, but it could be
quite invasive and expensive -- it could waste several MiB in the case
of big cache (e.g. 8~16 MiB) and large number (e.g. 2 regions x 8 cells)
of alignments to do.  I am quite dubious.

> BTW, another - though massively invasive - option to help clarify the
> situation is to rename "size" to either "virt_size" or
> "phys_[spanning_]size" because that is what actually happens
> semantically in the presence of colors.

I thought the very same as I was writing my previous comment.
=20
> Coloring does not go well with manual configuration, I guess that is
> clear.

Indeed.  (That is why we previously leant so much towards configuration
checks and automation.  (Think about the rest of the work -- designing a
configuration for a specific application, where cache partitioning and
limiting have performance impacts on interdependent inmates!))

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
jailhouse-dev/20200729171309.ds5lznjj6xqh37sc%40carbon.xt3.it.

--fz5itubxja6gikwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8hriUACgkQCtn83XWC
Ln6AgBAAhI1I0HyrToTvzqQhrFFs60iuGsYrd2yCOlTXdxI8JRHbxWdhb4AMtuW1
swbWgY+O0vYvE7HF+sK9ckwYUVW/1LKu4EaFGJu5vYyMh19E+eilIItXmeSaKACu
9mmTfBDpB3FqOx8JGSQRc/oSGea/sBzNAEq9wczM6FSQphkXoNNoIDOYN0nzeDrw
B/txeKLzWF5mfcjeqWIODVwmcetSXIP1vNfz7sK4/p8r8bbfkOCgZnx9J/IG4XV2
dGuxECfslXLPEnM3xa2KoHhZboIk3WBUS1RWBLO9kzFNo0QysKoCHDpTP0WfY1ts
942RTKyMxDbS45BmQCr0EFgmMo/PLzIj1DNn0x2XRZyzzqJTH/n+3Ru1oFiVN6pD
nGTigWbtZ+jiN3D+hcF4nHfIl1m8m2YEEoXRb3erojGVeYwYufN4t9vhP+I5Tfh1
7wkDX3yfn6G86YFPIvU6M0mitNtSpPSlGwg4gGwBGQQbzk1Y5a3L1Lt0r0szL3Lz
nB8K9JpRgAkVUkG03SKik1p4sQRf3cxycLGjcdNGVjjAn7rscq3ePV4zU/+cAu82
1GmCFgh/e9CgauBnYf1CGB9a1iEzQE5irrTZtRvodJClQANGqma6SwTlJ8iPmici
oUg49Ek6rWrGxjho46rRa0eyG5iHm6zChyAh1a/SsWBgOjQLAuo=
=F5Zo
-----END PGP SIGNATURE-----

--fz5itubxja6gikwj--
