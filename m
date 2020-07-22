Return-Path: <jailhouse-dev+bncBCOKB247TIDBBF6Z4H4AKGQE74YU7FQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E65C229D4F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 18:43:04 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id m7sf800939wrb.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 09:43:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595436184; cv=pass;
        d=google.com; s=arc-20160816;
        b=xjeGw96Woi3iDuz4CmCgIj4khUk76DCMzauYd/qFOh2yQoiKBPxonu7Jb012TPZ3zG
         LkQse2EA65/v/L9mXJfAzMvGlgW6kcxD/w3Yq1vxVbv0DTHVRKsC4cDBFXbPsoqUUcsZ
         IYut45K4lNAZosoguSy7kuFO/1adVD96VspPdOIvKzAW7FDkSqUfmk5L2Y7Cl95h7Fkt
         0giPDb3YDREGKWbEEo0an7Npu3bNsFxWbpEHTLyWNENBh7iD6a187LFAeeX1e7pgnprJ
         JpMCtZRdmSK5ED/da1TWfx1FLoWBInx169dXEs8R8jb92lGw9s+b5Z/lj92xtjT+NT+A
         EBXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=lFa4p1ckz+fapemuWfhGwpfdNPIbTUISY+1Tse9IT10=;
        b=wEcOXtvpy+ZtyLhmZb0SXbqLQChKe+q5SoHv3oMAYeBdh4t0Gn+KwxgIfWw6ssFOqT
         kkwb08s2zccjkFdD5ZJ2kPrxOF+cTK4hfuWsjzhCw7Mg6XxbPBKg8Ji9uK4mRVD0NNzm
         jCZz74iPkFLfxSyd0T6RnHudpDK/uWd0/Lje2vm+24Yki3ZQzKiY+N/5mN2r3fUMxiZb
         f8F70ZvWu+Ev3l/A+vdIGpy71wOX4utymg+7RcaJrg2vSUa7scmLKTt2gN2KAwlD1O1V
         M/dNrBj/fDdFfvtS9v8SVVZveUnwDeeuFpKKxpY2AwlLaqWNfp4XW65nx58lQBivBofl
         lY9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=jiNSpz8U;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::641 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=lFa4p1ckz+fapemuWfhGwpfdNPIbTUISY+1Tse9IT10=;
        b=ZJ6vl+Fws9uKC6ffw1RK43U+g/z33EtXWv8PKm/p4LE0udERzics9l7BhiUPdzgpTz
         SlNK9o7DkFGTXKqUPb/RFV+s5U7jdXU1BmZgZghCMmbYMg/eIdLicZLG01sEjdFs1lQX
         2hOdgrmTiKdGy0uw7i0R4cSa3xGz0BxkQSz7cS3iE/4pf11C5QOvq7cuGqEy1mpvkBoT
         QETDehP+Ng2Zp2erpdRqm2OlA09hF2llPwBh47Y4++rwXKQEo28jmGApH4h0FdUjEDjE
         n8wQuGHnHtY4o2TSE3ULZflFBUtjTFnttGToJMGfmRXc0Kb228BQZcswFYto6p7fJn3X
         h1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lFa4p1ckz+fapemuWfhGwpfdNPIbTUISY+1Tse9IT10=;
        b=P0KFToRaFoi5CzXhFVaytXfsFeuW2E2JXDYvAPjIN9uaVEXO0Vha78+RBidIeoOPCW
         TV3NwQeUFbK40/l457qU/kzYAr1Wj1Yp4/m3dgeRMmjrT7Cd5fb4fNpfYnimc0JiV9hN
         0qVQ4iiS+hvw1Dnu4NXkQINPpc8e5vmDaDSdNkbBvzE8w/OAa9w+oGEaFONmPIP1KAu6
         f2FZ+P05QLy9mDZ/lQPPqa60uuUPcA2yjTRGuRu9QoOnI9tNf/witL7jL+8k7qPpXxwb
         SJ7PwddhLP+ZO3F3fZrSSazMqGGRe2wL4jhvYPeK2QD0l0KP/eZRx1one1veWZfONr4N
         isJw==
X-Gm-Message-State: AOAM533RVF9J/L07hJIxGgYscmcHQKSc+cjp/Z7t+2X7GfOWfuCz5z5Z
	AC8Uf2nrcZvcvny4XKUUTsQ=
X-Google-Smtp-Source: ABdhPJz8sr9l/y7bd0e38J+/m6WPLF7zx0w17wIM2WxmvL1h0Tmn8+uc8Ge7yudM27WXnT9VZAVUWA==
X-Received: by 2002:a1c:964d:: with SMTP id y74mr500839wmd.80.1595436184101;
        Wed, 22 Jul 2020 09:43:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:48c1:: with SMTP id v184ls1377264wma.1.gmail; Wed, 22
 Jul 2020 09:43:03 -0700 (PDT)
X-Received: by 2002:a1c:14e:: with SMTP id 75mr453628wmb.151.1595436183479;
        Wed, 22 Jul 2020 09:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595436183; cv=none;
        d=google.com; s=arc-20160816;
        b=EUj/3hscvURl8URWVNWQUrswC++OzfeI1QvSbwZzdU5wym9Nm31r3JlMHUlCUYDrGA
         D8hnNuIoEAEoiBN6Uq+SnpuFIzm5y+cVhAt3wRmtitKeh6Jnyz6FafpXTLA6x4utfwGO
         PdRN8Kv1uO60TlMhIiFxLbJP5ayZ1uJmTi/swB8lEjhGM6PTC8FGuZRvvsiDQRbo/ba/
         wa+zXVfjKUIQVxQ4Ym92A9QUvNVzDv/S3NeOWeLR8TbpExNyQckGGtTaUgratlFc4OgJ
         6fft7PXA074SeneW4ms/Yg3dsVQ2zACBmkbDcDy5lgprdRKxS+dTh2DLV6HkEt//jb0T
         L0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mJX1iIgfDPolFq/cgklmas+/PkXCOo+0WFKmznLYqik=;
        b=nfFMtStN/4IicltP/UZPLPGztsl0r6vuiUz77Dflh8qOYq+9eDyvDqNFv4Yx9mmkwy
         KMQO050nfz1Nl6N/NBTiUeDGzkGM+VxIRgDYNbECq3tFOg1aqGhTvA+iDHQafW3xwLBp
         xfzcnDxQWzuaiFzYXxCYesk0XGKZOvT+6goQwmkMAxgj/dfB6qWS9iQxsmojiRylLVDN
         MY72X9JAK2eiEtNTcx3kf7o6aHuKWnSNZw6M7geRI6mZzukKYQw0OnVI8EzK5eN3CDZO
         dw/wZYDMY26V3YSiWIEFgbwBQPuL5Uc6d4HmQKSyEq8nEZyBWsK+c00Jq+hmO8WFmMw4
         vYIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=jiNSpz8U;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::641 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com. [2a00:1450:4864:20::641])
        by gmr-mx.google.com with ESMTPS id l4si12925wrm.3.2020.07.22.09.43.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 09:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::641 as permitted sender) client-ip=2a00:1450:4864:20::641;
Received: by mail-ej1-x641.google.com with SMTP id a1so2895272ejg.12
        for <jailhouse-dev@googlegroups.com>; Wed, 22 Jul 2020 09:43:03 -0700 (PDT)
X-Received: by 2002:a17:906:a1c7:: with SMTP id bx7mr412352ejb.388.1595436183099;
        Wed, 22 Jul 2020 09:43:03 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id q7sm136063ejo.22.2020.07.22.09.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 09:43:02 -0700 (PDT)
Date: Wed, 22 Jul 2020 18:42:56 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200722164256.n4c43mf7rrt6lzp2@carbon.xt3.it>
References: <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <20200722142016.zokufzzm63ly2oo5@carbon.xt3.it>
 <5a66e10a-6215-9c1e-241b-7cab268731c1@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bbhcsf6nsfse3uac"
Content-Disposition: inline
In-Reply-To: <5a66e10a-6215-9c1e-241b-7cab268731c1@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=jiNSpz8U;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::641 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--bbhcsf6nsfse3uac
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 04:39:59PM +0200, Jan Kiszka wrote:
> On 22.07.20 16:20, Marco Solieri wrote:
> > On Mon, Jul 20, 2020 at 11:29:21PM +0200, Jan Kiszka wrote:
> > > Regarding dynamic coloring, I can only repeat what I stated before,
> > > multiple times: I'm extremely pessimistic that you can turn on or
> > > reconfigure an IOMMU while you may have transactions in flight that a=
re
> > > affected by that change. How to collect the pieces when you do not kn=
ow
> > > if a transaction finished and which address it hit, the one before or
> > > after the change? That is exactly the scenario when trying to move a
> > > root cell from uncolored to colored memory. IOW: You may implement th=
is
> > > but you cannot make it robust.
> > >=20
> > > A more promising path is pre-linux Jailhouse boot, maybe even without
> > > root cells after that at all (needed anyway for shrinking the runtime
> > > code further).
> >=20
> > This time, let me try to dig a little further on this point.
> >=20
> >  From a purely technical standpoint, having coloring implemented in the
> > pre-Linux root-cell loader is of course a more proper way to implement
> > the feature, by far.
> >=20
> > On the other hand, I see two major drawbacks: one on the
> > software engineering level, and one in the product management one.
> >=20
> > - AFAIK, pre-Linux Jailhouse boot is not only highly-experimental and
> >    immature, but also an inherently optional.  This means that it could
> >    be dropped anytime, or that boot support could be missing for any of
> >    the supported hw combinations (with ordinary Linux boot).  This woul=
d
> >    therefore place coloring in a very weak spot, its solidity depending
> >    on another optional feature.
> >=20
> > - Maintaining boot support for all the hw combination one needs to have
> >    cache coloring support available is costly.  (I bet you know very
> >    well, Jan, given that you placed the Jailhouse project on the
> >    Linux-boot design cornestone.)  It is hard to imagine board/chip
> >    makers widely embracing, contributing and maintaining pre-Linux boot
> >    feature for their products.  This means such a cost will fall on the
> >    Jailhouse integrators who wants to use coloring.
> >=20
>=20
> I don't disagree that we are close to having pre-linux boot ready.
> However, neither do we have a sound concept for post-boot Linux
> coloring. Morever, pre-Linux boot has the potential to further reduce
> the critical runtime code size of Jailhouse, and if that turns out to
> be true, it will become a first-class feature of Jailhouse, you can be
> sure.

What you say is true and also very important, I believe. But is waiting
for a proper solution worth? Or is it better to bring forward the
availability of a complete coloring solution?

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
jailhouse-dev/20200722164256.n4c43mf7rrt6lzp2%40carbon.xt3.it.

--bbhcsf6nsfse3uac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8YbJAACgkQCtn83XWC
Ln6hoQ//RbbILLiXfCN1+mnNrj3ZNbocc/VKBpxRv4TnIzG18qY9yFsuWVSQsVdb
KmTsNLx84pJZoGDZd86x8VPJB3hPW5eb2BJpnUVknmBcY88M6aZgj9iHrP+RE2/l
4v0aIWO+cwkAy4krHzUbNhRbh7dNF9VHO9DfLfPT4vHeHUHFsJ9qoQosGMlu1hE4
KcaIn+39yn8YNQdwoRkU4HW2yoHRSKga/CnqfIZHfl8FZ7Zz8qI3BU54zCT6VMJn
MFiFCxUKvVbYc6DnfsE2KEMDEssPoScPun6HB7sPL2jOnfoPatJIs+ujBNRENPCM
kYc3Ad6Cc92bqCcshXUz5AannkwPZYGf7WdQrTfJiAU5ki/oEuM5Px6tNU0LX3xb
DowhlEzXuO3tdiMefdzZv8jvIm91z9coDmeNByHLKNnFNU/x7iTn0QRqPNYSk2pF
YSaafDdcASG888TqNDgquqWqFtU67YIioBeoAZUvtZxd66qAWgNUUdOT9gH3sgKF
VhEYSRAHPLJcTGxwxPZKRPOsFyKAzqzwT70lxfoJCpeWwjtcp4yQdW2jaNs47It6
LPDAE9tFz1kgRtiRMS907VPEr+wqGiUd+P8Z2azyH4JYocni1cP0BHoMBegvmrul
2/HsAtjpDU2zLAAa9x1OQQNqV+EAdY0beSw576WOern2swQjUUE=
=+PoX
-----END PGP SIGNATURE-----

--bbhcsf6nsfse3uac--
