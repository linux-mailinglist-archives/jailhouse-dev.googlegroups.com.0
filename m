Return-Path: <jailhouse-dev+bncBCOKB247TIDBBHMH7X4AKGQENV3SNQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E422FB23
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 23:14:06 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id t3sf3355466wrr.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 14:14:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595884445; cv=pass;
        d=google.com; s=arc-20160816;
        b=wzdqGxQWo7qg7W178gF7lf66hrXvoiUZuklnbWp/jb8dWixkQNZaVFDZrnQGUbeKPx
         8t0PT5Vg7uxwbmvauCVC78cvIu44aHJPmLdrCcxhFWownAsGDU4CWOoOt/+WkGlW1GdX
         4kWitCfBGHSPy1W2/iXL+8bzhKHykc6hJ3tfwSHWhpCMXOw1DXRYuzP0/npmdTpHjm4h
         AN4fCVoLGOwqSQ9t7NnGX2+M2aBOJHt7BIgAYhhc4wqMji7Vnryb7CZgtrsXIDyI3NCS
         6WkhR1x6JdTsMzOJJG9wOXwUlCizN/Su1JJeFzE53yF9HeOjg2DWQZes1RY6XncDcEHj
         SoNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=OX25ZY0BimzMFyV3FHMI5M68lPQoQ6Rw5PHM8oafUxY=;
        b=kpMDTuoCqCVETkx/cbPxNOXt3dOMAK6y6aI7D2HeJMkxCgIJqMikomZKmC3hK8rO03
         J6y8J2kXAYUqdW2TC8UNGx1jx1BZ1N8U1nnhjO2Co58liGkpdBJTh0MCLlobIDsNj2cl
         +uHMKpeFARAaYqWtnby5nQDfqYB5hZGnYD6EA6KYjih02L0+3MhuduS8h7mFK04eW4HI
         ZI9aCaI6QFt9mXCcDcfnJI1owmDLxl7KemwvQgDkZDOMBNHCLXuwnvKjnk3K5NO4m/ad
         o/Crk9va9HqO4QLLWxdfvWJ6izXB8aHFO7kT3Uq/PjYe4Irqhx8rO47SczuI3gd60vwq
         oV1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=oQ3zLi8u;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=OX25ZY0BimzMFyV3FHMI5M68lPQoQ6Rw5PHM8oafUxY=;
        b=kiEfjfo+wVHGKcOFb5hTCKrlG35/2RDoor3/lRUiB5XdNTATxP/IYoOtEizZxLPxYH
         NArZlpJNSaKJhL1ey0tPlMJbwR1T39A2MgsjaiQeOGVtTx35KTkpntAPNcLMH21y97mI
         xnF3YR1/5Wip5sGBWh3V5U4mCuR0mZ+BMVB5iuSaJBnfAXXDQgADBJUMHI90jxkCJkCx
         NEnVoHbbUn5Sr+2gsaq0XYXpCZMgyugktRBaA+EVIM7ii8ZtiDdsmPZSSBegnI6eLkAw
         Ira3D7S3EWjTIatoX4+t/Yi/V13oaMzUffVCSwgGY2giWTtFQ29bwZ5Zqp2gSHSsxsii
         VmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OX25ZY0BimzMFyV3FHMI5M68lPQoQ6Rw5PHM8oafUxY=;
        b=mYsHA+ESp/wj8XtW3DNmfo2BJYPh+AIPiZ6wsrSv68wV2g06KQwaLfbbrkEPD5pA9+
         D7LZ/dKoH7+Ml5ndAvh6pqtiFVA33XZnc1IkwI99zP6zIK9229XbG8k49x/uhQW7udR+
         gzDdF29TGpg7rIWrEoc+3d4hlvwD9ABL9o4HqBAg6wPeY7Mz13if2PSmOe20eD095ykV
         0gxZU1ZntdF7r3Y+G7xZTwSdbr70s/N5IWmDLzeFNdVJjLO4eHq4pGH8zFXIldm/lo+f
         RWB7eZSLLEOFsJ2n/D/2Zn+lSe14NhmBGPIn+wIgU1s2kMDQkLsVa5TzNFaBRIZeCBPH
         HFVg==
X-Gm-Message-State: AOAM530rtZWuenrKmLyVxi+x42dnyM/gxmhJ+wBi1tnC2NSx/Hq7tN2k
	5+KQXo8AsOGGDadOfX91Hf4=
X-Google-Smtp-Source: ABdhPJxDypyBJ/wC61f8yXOyzH8b7z13xEVfKZ3OoRYrBqHx/5vQQccIFBQ4+f15zLsVNIYXyx4sMQ==
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr23606368wrp.198.1595884445326;
        Mon, 27 Jul 2020 14:14:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls9745719wra.3.gmail; Mon, 27 Jul
 2020 14:14:04 -0700 (PDT)
X-Received: by 2002:a5d:46ce:: with SMTP id g14mr23231267wrs.188.1595884444730;
        Mon, 27 Jul 2020 14:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595884444; cv=none;
        d=google.com; s=arc-20160816;
        b=dsFlZ5OMgDNrpc5xSingOEJAORJO9p3JoVBJHOVtKTV+nzHDxgpSVfkT9HUthKXYfm
         Tw5cEszylsIpv+16Gpi8OVMsLo6UyRp/uTm7JdoN0FFaMtUJZC/I6pa846EhOLjk06a+
         iLoEeMRTPQk7c4jieUKVsQ2Uw9AODBECe1EgS/aJcGvran8mRz9pXV8cl2mLkWK0ze9i
         X87utluRNk0LIzVOBAfCFor1ak/OBd0UK4QL1VYNIPZ5T24qxjQXxXh/BWYtXj4Q+uEF
         rmMGGcxcUJwF448ef9XRCkyLi6RylYA/JN8LqVr/L3eeizau/2XvXIRpYQQWh+R0tpc4
         7c+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=W9BEoG2EPHwxyzbslRqBj9Tc1+gFOExTgiuDWeIdED0=;
        b=M8FakwkWi3CtQwEEr956PE8sC1enkf9Lg8g6eFd9sPUS2nuwRP53Xe7evM4RsOAfuO
         JxmmZ24xPOzGDcJzxxboYGaE/CPVksZ3MJlDRm6a2/vBIh08yt7vTVLs3R3BprcwYBsN
         IXfS2m1r1xZGJXPPnfrdxcbBBESav1ltOBdQOYjO08O45TUbAUNuF06rCN4bFwvoZ+KG
         rpVKlbUbBt4OznCnfqODNbnujqWydK+RLUwYdPol+40JYjpImlRiXASSp6Fgy6oKSL2B
         oCtf73ErlfjApA/oGw8l9PDxUii9F+fWsM88kvRE64BaPw3TIlCrsmZBGwcWocZJ1CEV
         To4A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=oQ3zLi8u;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com. [2a00:1450:4864:20::541])
        by gmr-mx.google.com with ESMTPS id 92si402746wre.0.2020.07.27.14.14.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 14:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::541 as permitted sender) client-ip=2a00:1450:4864:20::541;
Received: by mail-ed1-x541.google.com with SMTP id v22so2414870edy.0
        for <jailhouse-dev@googlegroups.com>; Mon, 27 Jul 2020 14:14:04 -0700 (PDT)
X-Received: by 2002:a05:6402:1ac4:: with SMTP id ba4mr22283049edb.60.1595884444371;
        Mon, 27 Jul 2020 14:14:04 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id p20sm7845366ejy.107.2020.07.27.14.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 14:14:03 -0700 (PDT)
Date: Mon, 27 Jul 2020 23:13:08 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
References: <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cpuogjlmheqkswdx"
Content-Disposition: inline
In-Reply-To: <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=oQ3zLi8u;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--cpuogjlmheqkswdx
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2020 at 10:15:57PM +0200, Jan Kiszka wrote:
> I've pushed wip/cache-coloring, consisting of your rebased patches plus a
> hack commit that does not work as-is (maybe just the qemu configs, maybe
> more) but hopefully gives an idea where I'd like to go for Jailhouse:
> minimal runtime, most offline or in the driver.

Thank you for the patch -- it really helped us to understand your point
of view w.r.t what needs to be put in the hypervisor and what not (and
maybe moved to the driver).

As previously stated, our next proposal will surely follow most of your
approach: minimal coloring logic in the hypervisor, mainly for the
mapping management (creation, load and destroy).

Regarding the hypervisor, we would move most of the initialization logic
to the driver.
- Cache probe function.  We already tested it and it works as expected.
- Initialization routines.  Performed by the driver, during enable we
  send to the hypervisor all the information it needs to use the
  coloring function.  Moreover, all the coloring logic for
  "root_cell_management" would be dropped out (just as you did in the
  patch).

Besides the initialization part, the driver would also handle the
colored images' loading.  If we understand correctly your
implementation, you are mapping the entire memory region and then
copying blocks of the binary image using what you called "colored
offset" function.  That was very similar to our first (unpublished)
attempt to implement "colored loading", and we soon discovered it is not
very efficient.  Loading time grows considerably and could impede
scaling up to larger images (e.g. an Ubuntu-like rootfs).  We think that
a better alternative is closer to what we proposed in the last patchset,
that is:
- create a colored mapping,
- perform a "virtually" contiguous copy of the image.

We understand that this logic has to be moved outside the hypervisor, so
we would like to move it to the driver, exploiting Linux virtual addres
space to create the colored mapping.  What do you think about it?

The coloring function would be the only piece of the puzzle that needs
to be shared between the driver (so that it can create the colored
mapping) and the hypervisor.


> On the hypervisor side, the challenge would now be to enhance existing
> paging_create/destroy functions with optional coloring, using
> jailhouse_get_colored_offs() if possible. Furthermore, all the arm64
> bits should go - none of them is needed if the abstraction is right.

Both of these should be possible, be we have not thought about it
thoroughly.


> A convenience feature "automatic max_cache_colors detection" could go
> into the driver.

Agreed.  We already moved it.

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
jailhouse-dev/20200727211308.5mxhkffz5aj27ocb%40carbon.xt3.it.

--cpuogjlmheqkswdx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8fQ2QACgkQCtn83XWC
Ln6guxAAnJaP7vxv1D/CLGXswyWsxwqSpQ9/B4F3FO/cb7eYVR8IRyko1+GbYpOs
eIwb3MWgrZ+RbIFIZEagRp4y14JWX1eyKhgR5i0XC2RmIYjRkynuo0jXcANi/1TC
ND8nlD19J2DwIMP0WBDOUbSDd+UCkQGIUm4IqG1ZILLuefdYlbtSUsPu2+4fKDGI
Zj1rhsazgFe4qM/FAJvEvQZcGNWoe71li6A4F3oozZqOZ4U5AbGmoHljhfvQmODL
k/pPssUuiczFjFzTJVOnVzKWapyxE0Uold6tuwycsHXbJb1lMI3G9HUjuhQHeZql
6/QIC1tfoUB+w7NRASiFquK9aJTb7+iEo2Sp43OH6lyAUC4DK/Jafe4bQGExtwDk
NtWTO/f9y+JhYiiMp1m7qZlo95psQonzqy95OM4FvE5BwyP+Hs2iK2H/RI5iYcIh
cU7CJLAzVJGlYUeTVNw9GdhorRH+pFp2kN2h4+odhzO8IKzUPGuXRq37QNcWcvRr
4BSAV6f1hlkuZvsOAtzq82vVr8boxYD4Uz6/UsDHSoIBZ7etRVTsz23HDFu+CGji
BqIMWkRcHfNGxY6VtbaV4ilsrNtP208uS8rhfXmVGTdeohw4ea2UtDBm8U6DkzTg
HnwvA1GeRb/lZg7zVasJP71QDhvfdrk8Z2YKx2AT332mrxNdYpk=
=RHuq
-----END PGP SIGNATURE-----

--cpuogjlmheqkswdx--
