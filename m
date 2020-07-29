Return-Path: <jailhouse-dev+bncBCOKB247TIDBBMNNQ34QKGQE7L7BUMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D752321AA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 17:33:06 +0200 (CEST)
Received: by mail-ej1-x640.google.com with SMTP id i23sf4717905ejx.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 08:33:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596036786; cv=pass;
        d=google.com; s=arc-20160816;
        b=OLxmNAtH/fDNiWD5ma76y1gJ4CDq9IWOfSgSCqrde0a0csWOBDqxIFvJaL8BOyi/FX
         pEs4vHLR1672asuyK+Ou4caRlg7FOxUSNQwgkmT9lIZ1Y6AIMB7Q0h3xk6gohzFlUa/u
         oDV3ka2YkTgv+/4tLRNsq9281KZeZkIPYCOSutYce0bxHHTxoFQeSW2FCtCbfbJs29M8
         Pk0ltlf55zE0Gneb9zil0QKwIc3g2U/PDOmHv/BzmrdvhvvV/ZHYrgqhBpPIALZUgGKe
         eeGWXMeJQAOKPZFuoUAhtn7PMLLI6w+K9NsLNRLGk8AUVqHgMSLCXcgcbeZwzo3gF8Qn
         IOOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=BwcM/5MWzRxXVpgt3C1pQl1kzJ17alCr8rJgpbmn4KU=;
        b=sTh098NesN1/Vv8wSh6rMDuWuI+w1TCBCfcuaWptIzxhufF+xiuk8T2yXm/83N2fGz
         EcPjBGVy2c+sqH065VMUKNA+o+PPonuoGumuIdOfDhTHouPQoA9PBcXd5uYnsV4uaQdQ
         C+wObS8xuRSCl6rHbDw9zwsY52WcMBmNyiL/8+ucMzDyo3Z3ZqG1yd+rHrv8mgN59rFa
         nU38piYVU70VA+Xd8bAj3z+Oi18L4YS3D3IEEY38ZSOtjVOiqZTjXAuTImVdjnKZBCQ7
         xDvMUSA8Peb26dPj0fIvdjGHbxj3+CH+cOFOOHMDDWJdyurPnv7Rr/c3YoGaXIgosxhw
         T4CQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=FpW8dRDH;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::642 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=BwcM/5MWzRxXVpgt3C1pQl1kzJ17alCr8rJgpbmn4KU=;
        b=USuWjHPwNWJXOnvKGc1hnXVN7GH/HGms2J+dwKAO1c3qaIcYmrEVYFpWUvUZOfdsKJ
         chjrqdXswnYdwy3mSu5MNrLjkmkHdKEqJ2wBZGcugNOGJHKaqyo4ctIn7bD6bHBoNB6R
         fG6rbq5HOUVegeGJnUIaofVBYs5/ndzNay1FnL6PllzF9wBLPmBNkkRy1IXk0SXuBESh
         W39r3dvDkQLNeKuT9tpmvE+vYbxzqf0Xl4fr2ckTkWBNbhcch5vOu7mo7sWss1bXlc3c
         HV0wcp8B02cM9+9vTQcA8yahDWM66LuvEe+8zRDjikMnvl/yqcFiPX2oCMMTb58FvH0e
         UrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BwcM/5MWzRxXVpgt3C1pQl1kzJ17alCr8rJgpbmn4KU=;
        b=AaGuVRszycFGg8KdQeSJHr7p2JppE1DryXUcpUNw36mVncic/eLfuP+yqYR5IBNWed
         jAfxJiF/tHQFvunmaQ7mo/cXWcCRKYzc9xBlsZzO4+z8ecb5+F2KVmz1YGqEbRiW3mHd
         UqM+LZXMf3yBpg/0EosJIfODNBFOwQzvBqNG/UsbhYlJM3g3lQoxJyR+NZk97luaVdW9
         I+5Do6b8BpTbHK6bglg4kr2+v9pKbp1I0+d5ABTg8/uD51SSQX9qLDT6UsripM/gLFL/
         YVHiwEBsTvo6PEvoXEwjJjsb/6idVHm8qkohZ83GBPC5OiVrmDs6yOkKDs5TG+QaRNGk
         3x/w==
X-Gm-Message-State: AOAM533d5kI3GoVZF7Z4OigVARS6WWcLHLxxeZUTU2z5lGmhq5bCflG6
	BxNppcRgG9L8SKwKjZH2s5s=
X-Google-Smtp-Source: ABdhPJzutNY5B9oCfcpWXObPa6xPFg5X4ooTvAiNZUUy48eVSJ6wg3l7smyQL4+NeKIpT18eiecebQ==
X-Received: by 2002:a17:906:b143:: with SMTP id bt3mr32659134ejb.134.1596036786042;
        Wed, 29 Jul 2020 08:33:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fb86:: with SMTP id e6ls2382829edq.3.gmail; Wed, 29 Jul
 2020 08:33:05 -0700 (PDT)
X-Received: by 2002:a05:6402:176e:: with SMTP id da14mr32154312edb.262.1596036785334;
        Wed, 29 Jul 2020 08:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596036785; cv=none;
        d=google.com; s=arc-20160816;
        b=0zrmem/kcN0werE1qXt3O1mNRwO9ar7j6LonMDzq22Aq1s10qKIN52I3G5olmcR/4S
         8hYtVQm2N1/aIAheLQSH1BFnpNebbgWTneT2Y3ictIkAr1bUCZY3zBkP7XZMwuWD6Gk4
         fWjS6iMIxMCid/y5H+shT3qFhMNolg4ycQ5Bo+EXDZF246i1Y0RQ3U02vMp5d4L3c+q8
         dYhnSR8v9UBHntUC0LBeeu5SPHhQkA3DN8iyRy0IxdlZia9PtLlsazflXtrBD+6bmF45
         ojBR7s5Kh/rgJ/cgS+cc6YWKXTxmAYZgrSPuWFfY6k9B0ei+wYw7zfh43pDfEmK6QyWN
         6aAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=8HyxBwvxS3uWaYop+9kx92LKUOUpDnaKKNxGMbZdDbM=;
        b=VqvNNqZkUEC8nA8ps2CeH2q0Rju1cmF0mZGTryJe+rUXil/sdzrusjF0WJ4SwNCrs/
         qwFKoxctqF8ZZE4aaKAEkB55URNkQcFIR8SDvR6zUCgcEFlA9mAyeLZ3DITcYAMKak1R
         zLStb0TLkLp++XGKO5uPtVcbc5KiGZhl+CX3QB0l09x/ZTYObFdIU8O3NrL1sF2Ofd2o
         OU3GA40ATE6hnlvzO2LhoSnH8TUMVx2YHKTvrYEYkXqSfy8COJvY/Cl72+qZBKKRwOBK
         WVyAvHHIHOV2X/UZtT6O3C9nJ+Nl35ljBNyxqT9LuL+9urE9vvJlmhNjKQ/r21wgEex0
         /HWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=FpW8dRDH;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::642 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com. [2a00:1450:4864:20::642])
        by gmr-mx.google.com with ESMTPS id x14si121866edq.2.2020.07.29.08.33.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 08:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::642 as permitted sender) client-ip=2a00:1450:4864:20::642;
Received: by mail-ej1-x642.google.com with SMTP id w9so24773818ejc.8
        for <jailhouse-dev@googlegroups.com>; Wed, 29 Jul 2020 08:33:05 -0700 (PDT)
X-Received: by 2002:a17:906:c04d:: with SMTP id bm13mr30363487ejb.321.1596036785032;
        Wed, 29 Jul 2020 08:33:05 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id h24sm1931126ejk.12.2020.07.29.08.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 08:33:03 -0700 (PDT)
Date: Wed, 29 Jul 2020 17:32:42 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200729153242.f6txtzeqbeqrtcyr@carbon.xt3.it>
References: <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
 <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
 <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
 <ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c@siemens.com>
 <20200728110945.w4o52pgtq33ic2pv@carbon.xt3.it>
 <d8b12a27-69dd-e47e-a7e2-258192696bc6@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k6mah3of4bl4u43x"
Content-Disposition: inline
In-Reply-To: <d8b12a27-69dd-e47e-a7e2-258192696bc6@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=FpW8dRDH;       spf=pass
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


--k6mah3of4bl4u43x
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 01:30:37PM +0200, Jan Kiszka wrote:
> On 28.07.20 13:09, Marco Solieri wrote:
> > Beside the "offset vs next_col" choice.  We would like to stress that w=
e
> > need it to be aligned with the concept of colored memory that we are
> > proposing in v2.  This notion is present: in the user configuration and
> > documentation, and also in the hypervisor code.  Namely, given a color
> > assignment, a memory region, and a size, we want to map *only* the
> > needed pages that satisfy the size request.  I.e., not to assign *all*
> > the pages of the given colors within the given region, possibly
> > exceeding the size request.  In other words, the size parameter is mean=
t
> > as the real size to be mapped, not the place where the find it.
>=20
> I didn't finish that part either: I also believe that "size" of a region
> should reflect the physical size, not the virtually expanded one. That
> virtual size makes it really hard to read configurations now. Yes, there =
can
> be tooling (config checker), but when you start to rearrange regions you
> will continuously run into those overlap issues because region do not rea=
lly
> end where phys_start+size suggests.

I don't think we have very much choice, here.  We need to pick one
between:
- having a true region size parameter and favour misunderstandings about
  the end address, since phys_start + size !=3D phys_end (v2 proposal);
- ease reasoning about the real end address while using 'size' as the
  'phys_spanning_size', since end-start !=3D size (v1 proposal and your
  currently favourite).

The situation is symmetrical, but about one point: v1 make the 'size'
semantics explicitly incoherent.  We would avoid that.

To mitigate the configuration difficulties without the help of the
tooling level, we can promote a good configuration habit and comments
like this:

  size        =3D CELLSIZE;
  // phys_end =3D phys_start + size*(MAXCOLORS/CELLCOLORS)

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
jailhouse-dev/20200729153242.f6txtzeqbeqrtcyr%40carbon.xt3.it.

--k6mah3of4bl4u43x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8hlpoACgkQCtn83XWC
Ln6XiQ/+M7Aew7Ca4v+imM5wAdBsavZyp2ruqU/Cq27MllBF70kmFBoBQ/1S9Aqx
bF+cxCocy/zMNqrB0W9dQhaVb3Qs166AsNtJr/6JI2ujW9lt5SaevAmspiEi6uZG
2PI9ai5eCnvogYI7XsbciCA5m2+a7kqiZbGP7yhI5smw6st5MSpLvINKQxNhILbd
dXWTI4LuGW35iW4OV4Q0+eOGOkQ0hkR8Nvxr1MApy4vQ4ddsKBlTso3ntFT8IGSt
eygnhkFVtoJO2ugu7Oj9GrQKbloatZcSbza2BTSKFtPzfWlW9LzF682MviDzLZjm
xzl51BVKRie6lbiePQz7bzXsUHasXz+WF7OaVPavI0o3ERZPB31ji0GStDx7Apoe
CFYnXUSCxFiKAedcTQ6Yo6murPUxPcADuL0Cs4KYupvOU8Rmubf4Lx+egTy2DnD8
w68f1XWFQJTItGbA6c+zk+Vc0Gc0oopN8ToMdTYbrV80bx8N6oxiMKHnTsE64IJM
4lHOBEzMXLRBpAjVAJq641dyXFDC2FN+t30nkZVdNcN2FC7IYbbfD7FOgjDr+PTX
dC6I70+IuNR9HU2Evsp+R0ex8rqA9TwzHdC+58KqSbQaoum4SzGB2XEgVF76O/4O
mX+drWaqgZBl1rUw0Wu3fmaOOgBqyrd4qk03g/9ynYL9hxZZgQg=
=vRcj
-----END PGP SIGNATURE-----

--k6mah3of4bl4u43x--
