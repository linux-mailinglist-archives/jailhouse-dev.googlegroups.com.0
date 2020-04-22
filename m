Return-Path: <jailhouse-dev+bncBCOKB247TIDBBV7B772AKGQE6VJPWTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 817A81B38D8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Apr 2020 09:23:04 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id m5sf612875wru.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Apr 2020 00:23:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587540184; cv=pass;
        d=google.com; s=arc-20160816;
        b=bZvHBrOaFHBGpV1Xp7qz1gvoe3vA0hbmuc8h5NBC+P6n291RFkt7KMLE3PThFHPVtc
         u/mvbvx597CY5CSk2C7T+CRaaYjXZPwDKo5obF3XvVN9W4L7SlmZRihRinQCXec8wfdK
         hSJ9TnMNkFCT7gJXApdLiDPIEs0nTZEiPghrN2CqTKAG63ogS28z8fIREAhQ7UbpyRYN
         oPf0L6CbgMkL640K3GuW37wrMdQzQFTMp8guhoEWLsy2Rt2EuodJIW3bhHXnSmgTCRUr
         7gOvFwFXrfiu2FGuGj/4UAdRfijvH2p+BhQxY2Cr0HzBbeJEhtSe7aX6e0I+zQuc+lDv
         BY4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=J9vDvQjmbhZDBXFxBzQKcuw3dwEJf24wwLz239XR0QE=;
        b=UMMjRpGrrKNrYLq+3BeyPUOMl8onzaKS5FpU7hMf7ijpiy51hKi3qxd7EG+84jixnL
         k+PTFpWsj6pq7drCR0E2XMEFrC1zB72p3BoOWp2SnCl4EYOfL/+qjeZVSGLEpBcwycQw
         gYX24v7ARowMF8NKOvXBf3zqG9ySgaOGny3nPRI+1oZGfBDUddnXGC73Z6LbmK3j0wvC
         LnT3+qkNTmjC9T4PAVZ/Nzv5A6hh+Rx5fmCxMncwSjKgVHLeI62byE441hG+k1PWV1Z4
         MMbqPEsHFQH8BF3FYBm7dlZMEoyZqZUDKSSmfFQtrSBidO1z+uF1Lv9HvneekbV/lKlB
         diXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=GWD+Pj9V;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=J9vDvQjmbhZDBXFxBzQKcuw3dwEJf24wwLz239XR0QE=;
        b=Fi5zdUGSvfmOCrB3sxfy+bgOmq2GY+r00mx/SaaigNTe0aLH6Qp/3zzAqoqgEeCz1w
         3gu97QKGZCS7JK0e6Su0Y5fL0wYNVlsiNP2kemBarAK4h6laCqSOWGzU2LN8lyDXpDC9
         JPufkfIgFliMfSzDn6VpWmBcJFEssOX6s5dAXzj3Y2dzM9VYJBWW0wJr5ox/IT5kMWsE
         xpHmYhktvPTFbJNT1EEcSiILRkVeDnRJAS6V7ogJT55kduYUWfQOOxgOIv1HIbnb1ghm
         MnDaHFSXydmc8nqG8lc6UIfr6fXbYhvFRIlWs86GCXy5WaenFJI1m8iItOlpqAzykPwo
         O+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J9vDvQjmbhZDBXFxBzQKcuw3dwEJf24wwLz239XR0QE=;
        b=I8EOpu78MHrhUcihpEuLFJ9g2rZxCea5mb/qBuBdxLXVdheS4PmwD7zJU6lofSAbsn
         FNjBldj/J2gryfH4z/CyGuKhBkoZAsulcSZdUd8CCCpokKPqluOJRwUxiEmAoFJ0Pe/1
         shinS8Fps9o3JWeKVR+Ik64O+4lLNCFoV6+bfHS+Foa5MICBc45MOhDA9zcjUq2PR9rj
         Sw/w/gsgLOtadbtCZ+pEpYWxNhss4zgGZcdYfv/e/4YgdlsQY3TWPX5ykRBBO2wqkw1v
         fUBbExh+TCt2AiGNEYLUQcr7g0q14NuPqvYXQOh5EmIK2B5lBlTylWK1yhx+btgZaDZO
         7UHQ==
X-Gm-Message-State: AGi0PuaGyI7mheso6dEQFJj1VHIc1H2hiV73+CHMkD4geJHaz8MRwHDl
	qb9D4Za94z2+sZgA8Hgc1Tc=
X-Google-Smtp-Source: APiQypLEaPoOWh/aA5Z40+YguUjBEz7NaXDd2GoFFH3lQPE5ryq+cD/q7vDD1A9tYSgHd8QfJyGnoQ==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr30106674wrw.73.1587540184128;
        Wed, 22 Apr 2020 00:23:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5644:: with SMTP id k65ls1292253wmb.1.gmail; Wed, 22 Apr
 2020 00:23:03 -0700 (PDT)
X-Received: by 2002:a1c:5403:: with SMTP id i3mr9491948wmb.10.1587540183424;
        Wed, 22 Apr 2020 00:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587540183; cv=none;
        d=google.com; s=arc-20160816;
        b=rT5WtcXZVitVj1hMLAWn5Sy2ugKHG1YrMtRMTcTjonROK5uTmxKgWDKw4J2vE/v56l
         RfsOWBxUHl1hviW19jn0cEalHpJM6eRTvWqpZDrGiftXwYHkSoe+gKsk2IFItTC44GvW
         Dbri9jDWA5GpEMbFs9Hu4M7FuqD0RI783JpbCHXgmf77iUOfBcOohjOTT50FIkOBqM0S
         G6UYENdttdQ+b48DtegbIC1/9HeH56e2aYydxaRZxnHDFsSE3svk7r+qf1BQrp3wtv/B
         JDvBCvYuJ0Wj8cSJhAhsdxnh7aT7ISJGVCM3Y7F7N2To3F8vpIglXGHeDg8E6uuji21X
         uByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=3WSMbDvlhFtPHCFK20Cmn35LYtEiNPZwVFChkap98m8=;
        b=FI8+jxhaKSh3hFeVLksu+2Gaiq115u9ZbHeIXIoN/z04VOMou9cABNF3V+eWJhrszd
         WHNl2jE8VyAXymk2NSrpwDoHYjJFLgd4o7c+IiSMbubwizo8mkgUgAwFqQm7eMiYIRly
         XIcn+AUmn5LT2XcfcuqncUEPGr4tIcDtOO1M0D5hAXnB3T8oirOr26SiOhaj4+2O6TSI
         Hailbz8oWj6B1/X0Lpl/m2M4AqLqopI4rKOk0d/l7w+X9KLd8MJbElCDpI8pPVbxKIfy
         MnAV5wyVgBThpknTIijzXDS2w/YiBpqdh0JgRhQJ7x/9hV4/PW+Im1ZlrJfMXULcNWn4
         icdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=GWD+Pj9V;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com. [2a00:1450:4864:20::341])
        by gmr-mx.google.com with ESMTPS id q187si305135wme.2.2020.04.22.00.23.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 00:23:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::341 as permitted sender) client-ip=2a00:1450:4864:20::341;
Received: by mail-wm1-x341.google.com with SMTP id 188so1058423wmc.2
        for <jailhouse-dev@googlegroups.com>; Wed, 22 Apr 2020 00:23:03 -0700 (PDT)
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr8947749wma.150.1587540183150;
        Wed, 22 Apr 2020 00:23:03 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id p190sm6449464wmp.38.2020.04.22.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 00:23:02 -0700 (PDT)
Date: Wed, 22 Apr 2020 09:22:59 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	tomasz.kloda@unimore.it, giulioc@xilinx.com,
	claudio@evidence.eu.com, fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
Message-ID: <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2indzphhs4pgd2wz"
Content-Disposition: inline
In-Reply-To: <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=GWD+Pj9V;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--2indzphhs4pgd2wz
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
> On 27.03.19 13:18, Marco Solieri wrote:
> > Predictability of memory access latency is severely menaced by the
> > multi-core architectures where the last level of cache (LLC) is
> > shared, jeopardizing applicability of many Arm platform in real-time
> > critical and mixed-criticality scenarios. Support for cache coloring
> > is introduced, a transparent software technique allowing
> > partitioning the LLC to avoid mutual interference between inmates.
> > [...]
>=20
> Thanks for updating this! I will refresh my caches on the topic and
> provide feedback soon (I already have some questions and remarks but
> I'd like to double-check them).

Looking forward to hear from you.
=20

> As you likely read, there are better chances in sight to also address
> the root cell issue by booting Jailhouse from a loader.

I share the same view.

On the other hand, it ties the cache colouring with the
Linux-independent boot.  This is not ideal from an quality perspective,
because it introduces a dependency between otherwise unrelated features,
including one definitely optional (as long as Jailhouse will stay a
"Linux-based hypervisor").  Also, from a process perspective, it forces
the colouring-related activities and deliveries to be postponed after
reaching a somewhat stable architecture for the independent loader
(colouring pages is a loader matter).

The other option is the hot-remapping of the root-cell memory, which we
already wrote and tested on an older version of Jailhouse extended with
a SMMU support.  From a quality perspective, it looks comparable, and it
does not introduces constraints on the development process.


> That would then leave us only with the question how to handle the
> hypervisor itself /wrt coloring.

Correct.


> Provided that can buy us worthwhile improvements.

We already have experimentally proven on two other hypervisors (Xen and
Bao) that the interrupt response time hugely depends on the cache
performances of the hypervisor's routines for guest injection.  Cache
partitioning is therefore mandatory for predictability.

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
jailhouse-dev/20200422072259.sc2au24ksnt6j7jy%40carbon.xt3.it.

--2indzphhs4pgd2wz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl6f8NMACgkQCtn83XWC
Ln4VOA//fri90oaTaC4aeXoj3LSZquG2qYBE0ovknOnGg4VIpcReIJ5oyc2uh8eU
GWPnSXs56ITtTSxRAJG6PEXb06BbW58GKV/cPB9iR02I45xYUZYmv2bYuR2D/XPn
v7jKP2zDevyGjjFPFv7hk/Z3V3QbxMQvUKfrxJbxmB3FLiTYfp7IaWlJhU+i/gML
2KBeq2V884SH87kxJ0PHl6E8GjMrYy3jLwAFfzK9jXxfMYMBUzmPGcyXKhXcSxT3
9sTqHXaj+EmROVA9+Un8TG8gRW3eAwErhiVfGmxczyS+QVLF9npfIZMX33xOg6lM
Q3rDKpOKVF7Gm01liDb/jFr8V4G9U8Nfge4AUyQpPRBO2o78YfcohI/JFQgp3YSu
BNidCkF8h4u8mmcsWk2oqjYw5tHZdhEKnC8QUTaA6C2Q0ipEn77v2B8kGDFoOVj1
xxhC4LGR62j25U9zFE4m6er1Uqk1Pp5kS8H7/PpFBiEyxW+EVstdJOQP9Y1oJbyU
EaKJu0zdkVca+2RAxDXqviHiMs0AlXg9rNsKM11OkaslzDErJlkxNjb6D4IMEK/X
7UFT7Pi8xWN4EkO2LGqcG676xfgvnGEFsoiUCSMVflBaZPtSYtZg/IZ+ae2jh/Oa
WUbA11EY7ymlgaDBl/N166XMwnNsWinsPtXNKtnWy4mnf0myqqA=
=GHo5
-----END PGP SIGNATURE-----

--2indzphhs4pgd2wz--
