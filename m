Return-Path: <jailhouse-dev+bncBCOKB247TIDBBDMPQD4QKGQEQRCG7FA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E844A230866
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 13:10:05 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id m13sf5457620lfr.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 04:10:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595934605; cv=pass;
        d=google.com; s=arc-20160816;
        b=oVD4JzhpuIxOJ34ok1KI8qmNZ2NcYJStwJJv2Ii7DkXfT8QIUS3Yk+ai8NwMqQHCxh
         m2w8m2PY1VOFGIDHMZalrc0pXYqERJRr/GcoiJafiPtdE6iEwmas8P1o+igNEM30aGoq
         f6baWIe/nAOlRAUZ1DVFXFqaHwJ2qB3t/JfEtfExGz1uoWCbhAa53Nkef1n/w79/F68f
         /9GWh1b8H8VBoM3UIbyoAD4e0be0TzoCpYpo8v2553zMCXDjAeJM9E4s7U8bFtODRXKn
         TDLs4NftQIMeYd8AtBBwNuUvCsGpNS1E8fn54UelVCPY5lVj1Fshxp17FYkQ2lusl8wL
         DJkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=Tl54j3MZTH3JRUqaskYOa2L2VmHz2r0E0+4oPq65DFw=;
        b=PGWi9WaXXtxyP98z7p91mjLBPyCmtbh7pWXihANNbSb53hS5uprVlwn+jHFqJwXTAN
         +7tqsacIGbHWHMU++2LFJ+ERndVbheEs7zhiVHMYFA2q7HT8IUSy38bnn4GU56z++LLS
         Z/ZTYS6PAKgS04zWAfH31APCaRD1xrACZOkB+JYHqrWrZbcL/4GMe4XCMqVYgwdzzpKL
         5kXlKyMZRJLxyOhuAX92ASy/Lh+5xTokXV4u1vB3MNKMv6T3vID6pbHZX0Tg8n1Y4cTW
         jWwUZw7F7Tlo0mSVvdkoK1vxw5vRyoMs9jr5X6N1TVrs0Zmm/bVijEwD+a2Vr/x/e8y6
         cuHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=gt2NVB50;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::544 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Tl54j3MZTH3JRUqaskYOa2L2VmHz2r0E0+4oPq65DFw=;
        b=n3diXx0X5FAYbndQYDGzsR/vNCGCqsSD82jMjILOh2ST/VX13uwhf6ssorzEgSb1qp
         5TnPY6B8FHr3Cyo7V9vfejtJYDDuRAz+HPw7Bdm739PAghTP2LygofLaZC06PSRxZsSn
         jomcA7z0j9G/xw+78/dlHTNclmjB11Skjguqjt/X2Ph9kbm99zmIePlM9tz5d+cEzM49
         ICBx9AQjahMKWVPV2ZV1qwXmXODG08XAv9l/4Qrtup9PL5Q/+uD2V5zknDNxJMtiz59S
         zi71CZdhNBNSqfgoPSVze627mMqK3rbqTm8KgMlnHYfTZ4DQOQ0XslzU36LrILupW6Qd
         YpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Tl54j3MZTH3JRUqaskYOa2L2VmHz2r0E0+4oPq65DFw=;
        b=MXjkl4LGPlP3l3TZd5bSl2ZPjUbIsIH1kWuM2ho0BLjhOZoAdGwpuuLeOt6TS/MvlO
         XEUoRoO8UzCGAA6YW2aWItun9IkDeHCX9JbHJrIMZOGQ7R/W+kO8R5bnYjDKqSxq6CAa
         FV+pPLT0YnKf7WVT5STDI9D8OmCjMbeeE+CI6yRE/4tC/VTCUkSc7T3SQBoCldWjDqqq
         ZSJZFxUdglNebtQGBht4jnezdqtfW0GmHwKNAUfJ7F9+BjH6w1RNVCxlRY6rpwQzifXR
         jFYo4j3dUW5S3iLK+DNmweHKGSFHT4oenFp5ThqT72vfYN/ueF0XrV0/J767vEGVWb9r
         jR5A==
X-Gm-Message-State: AOAM533iYpzrROQG1mnrNgSEwHrKHmdvLm2NL8MnNLhXX/6XkNX7kDdD
	3DmIlKmiUQb2kge4gY2BC0s=
X-Google-Smtp-Source: ABdhPJw1qpYr8KiqeIqKGqyRbXlt9+Z+5Xz5Ne9dsYHKEA7C+bbQy+fsYNH1Y0283ANOAY2zWNDrcQ==
X-Received: by 2002:ac2:46d4:: with SMTP id p20mr8545344lfo.109.1595934605439;
        Tue, 28 Jul 2020 04:10:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1182:: with SMTP id w2ls1685785ljo.2.gmail; Tue, 28
 Jul 2020 04:10:04 -0700 (PDT)
X-Received: by 2002:a2e:a17a:: with SMTP id u26mr12697107ljl.322.1595934604628;
        Tue, 28 Jul 2020 04:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595934604; cv=none;
        d=google.com; s=arc-20160816;
        b=tnpmN7+6L+jzVHRJm4DBtVHrsPFehsNM7KXKSMj5+854E4kL77pexVVwyDNkLUZB2n
         SysvM3Ys4fbwbeAK6HVvYfSONKW6HqN5Hdv+4xWVsVIRHG6t1c55CcWWOgsNFyCcGE8l
         85hghVy5IVt5AceT8K63QwYROyXSeOvrMbVZ4P3XxxCAw+TfSesQ90F3i3dZmPEV+ynr
         Q1Rc0KJtOGM1s00xCuaMwLoLfMyIElW6zlCKaBjzrVbw5YAM7Lt0422t1bqKwTexFlOU
         MhtmnpgOYarpUKcq6breH+4eYTepV3fPPYcdDem1jfzUMT2kZE1HB7fR0gECn40UoQ0C
         Ux5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=13qqk3FnQ+kvVEGxtKsONUfIhLcHLtHuQ+oEuhRC1JE=;
        b=LACVceSUsBQjOXqZYVoV2TmM9tmccHBStQoalx13DkV8kDfONPL+PpFhLuamZgzIOm
         erQMqXaZKeEgu6R9XRoXBbkzriGkWFu+OkPOKnsL/UptifW8o45BUI6Ur7Y3+bfKoVUj
         H2Nu2r6oSSfjv1ArRqscwVDRnYBUiPWGUDgMGYLVkb7g2pEhP9YY2ZBWmnJes4/DWbUp
         P2sBw26t8CT7MZl3d2JKbaVrMqL3j4YSBinnat0Jq6gpnV6KCqT/5OaSNpG82/GexE0n
         GfcnIDFV60volw9tAk2uSoEf9eMzZJUtXwvixzNWCfTIToDK0JAS2QMT7BxBktdOp87S
         oWcQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=gt2NVB50;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::544 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com. [2a00:1450:4864:20::544])
        by gmr-mx.google.com with ESMTPS id z26si802098lfe.5.2020.07.28.04.10.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 04:10:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::544 as permitted sender) client-ip=2a00:1450:4864:20::544;
Received: by mail-ed1-x544.google.com with SMTP id c2so8640417edx.8
        for <jailhouse-dev@googlegroups.com>; Tue, 28 Jul 2020 04:10:04 -0700 (PDT)
X-Received: by 2002:a05:6402:13d0:: with SMTP id a16mr25398288edx.269.1595934604068;
        Tue, 28 Jul 2020 04:10:04 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id be2sm9553993edb.92.2020.07.28.04.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 04:10:02 -0700 (PDT)
Date: Tue, 28 Jul 2020 13:09:45 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200728110945.w4o52pgtq33ic2pv@carbon.xt3.it>
References: <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
 <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
 <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
 <ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fuyw76svepzzzlt6"
Content-Disposition: inline
In-Reply-To: <ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=gt2NVB50;       spf=pass
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


--fuyw76svepzzzlt6
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:26:45AM +0200, Jan Kiszka wrote:
> On 28.07.20 11:15, Marco Solieri wrote:
> > On Mon, Jul 27, 2020 at 11:39:48PM +0200, Jan Kiszka wrote:
> > > On 27.07.20 23:13, Marco Solieri wrote:
> > > > If we understand correctly your
> > > > implementation, you are mapping the entire memory region and then
> > > > copying blocks of the binary image using what you called "colored
> > > > offset" function.  That was very similar to our first (unpublished)
> > > > attempt to implement "colored loading", and we soon discovered it i=
s not
> > > > very efficient.  Loading time grows considerably and could impede
> > > > scaling up to larger images (e.g. an Ubuntu-like rootfs).  We think=
 that
> > > > a better alternative is closer to what we proposed in the last patc=
hset,
> > > > that is:
> > > > - create a colored mapping,
> > > > - perform a "virtually" contiguous copy of the image.
> > > >=20
> > > > We understand that this logic has to be moved outside the hyperviso=
r, so
> > > > we would like to move it to the driver, exploiting Linux virtual ad=
dres
> > > > space to create the colored mapping.  What do you think about it?
> > >=20
> > > Did you examine what was causing this slowdown? It seems highly
> > > counter-intuitive to me, given that we are only copying from memory t=
o
> > > memory in 4K chunks, just using different virtual addresses - that' a=
ll.
> >=20
> > I think you are right, indeed.  Doublechecking our old (and slow)
> > prototype, we discovered we were actually not just copying at each
> > iteration step, but we were also been ioremapping.  That was most
> > probably the cause of the slowdown.
> >=20
> > That leaves only a design point in favour of the contiguous virtual
> > mapping.  It makes the implementation more robust and elegant, since it
> > enables the copy operation to be independent from coloring and thus
> > reusable.  This is enough for us to favour this approach.
> >=20
>=20
> To my understanding, the choice is between:
>=20
> for_each_colored_chunk
>     copy_chunk
>=20
> and
>=20
> for_each_colored_chunk
>     remap_chunk
> copy_whole image
> drop_mapping
>=20
> As the first option can be reused for uncolored images as well, I do not
> really see the value of option 2. Prove me wrong by code ;).

I see.  I would easily agree with you if we assume to use the
`jailhouse_get_colored_offs` (or something similar), but we rather not
do so.

Instead, the `next_colored` function should be favored as the
fundamental coloring algorithm implementation, because it is closer to
the hardware meaning of coloring, in the sense that it preserves the
notion of bits in the address, instead of abstracting it away behind the
notion of offsets in the memory space.

As a by-product, the implementation is also more flexible and generic,
since it could be applied also to different kind of coloring, e.g. to
bank coloring.  In these cases, nasty placement of useful bits could
make an "offset-oriented" implementation hard to read (and also very
difficult to write :-P).  E.g., consider a case where only 12 and 14
need to be used for a 4-colors platform configuration.



Beside the "offset vs next_col" choice.  We would like to stress that we
need it to be aligned with the concept of colored memory that we are
proposing in v2.  This notion is present: in the user configuration and
documentation, and also in the hypervisor code.  Namely, given a color
assignment, a memory region, and a size, we want to map *only* the
needed pages that satisfy the size request.  I.e., not to assign *all*
the pages of the given colors within the given region, possibly
exceeding the size request.  In other words, the size parameter is meant
as the real size to be mapped, not the place where the find it.


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
jailhouse-dev/20200728110945.w4o52pgtq33ic2pv%40carbon.xt3.it.

--fuyw76svepzzzlt6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8gB3kACgkQCtn83XWC
Ln6f7Q/+OYhGWr1S/RpopYURCM4Aywtgq1Iw367I5fjTfTj8rbO6113UjBYbA4t9
W1ZtplCkCptVGg+hUOW84rTC+Y0d1h5ts5cDpculB/xK8lfPzT79+VIjQJ1PD4CW
QsmsBDkT2PuhMdGCXbcxx8vVtAlzwptpx2kMLfsNm3anp07+V5hN1lvP3r4gGpQm
GsD4YT2oXUlfZfkTIsDOrwKUzNFXL9utEV82UBJ+ZKJBb7yMDfNmIUVu6y/Vh2ia
5//goMU/jFGXkJcwNRpE6h/lxsMYUje+QORN5+rSW8kSsU+sxfbcIz0eK3OLUL7x
8cgd+F1G/rDtaS0O7BxJoqCJjn+NIShOEXXZylyDFhaiAqRbT2NrwVsG5ez/n//J
zYbtXTcCNskb2dTPMrlhhMqqdRraMVdDaXLkOLBNsU5W72XcMHiQWKxSDRJ/6a6t
hbxoms5G9+Dh6ecTJoUOp0sfegm2KMhnJ4FMaC1TJNjSoq63OCd4W4/yksDcggtm
jlPGzmIh/IeuLiG9An8yfs1s2D28bagVF1IzAPT3dOIijb/TJs8LOWe94ZXyuDRH
PnzhYRrg4FPtlysMH8s7ziL67ruKJGSWkVvlE6warx5FD1ptF/i8TVYnSOZVda7B
BRrrwXo6V5tAi5VAB36hzR0Q0/M7QEp0HdknQhwx4Afs+ADNGpw=
=PFl/
-----END PGP SIGNATURE-----

--fuyw76svepzzzlt6--
