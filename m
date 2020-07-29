Return-Path: <jailhouse-dev+bncBCOKB247TIDBB6NTQ34QKGQE5NX6IRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id C15732321DA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 17:47:05 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id v8sf714028wma.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 08:47:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596037625; cv=pass;
        d=google.com; s=arc-20160816;
        b=AaxeltZaDkNLweSVjmmt3TVZu2zSVb0Yi3R5ztLJ7q4uIMxgoftfdb9x9WFPIez9Os
         reTaez+O4W9dsf0wi0dVc1eqlk/Bw4U4lz/X4MFFRzZqdQwNtvZxERE3Xx7IRtF9Rgd8
         5GlVnx0dlIVtF3XfG2MqmHSpmtv7KwERjC2cPdlcmtgmKPTATPe1TFBtClv+q27NireJ
         BzoVPmQPELTPqVjqQVGIYZL9AbxD/8Dhuh6ObUTXBGGFkW7ovTXHrtVbPUWRQHy4Ec5x
         ZUfZDZ96bnOx9dvcQRuDbhqXBcuuV2OAlvdArqIfpgDKZ+fBEF4E+Ya/56wbccpaGaYx
         pVwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=pKzVu72BYpvUMfJi1wnPkkrRQPCTcfzeOZIGlfIhJ2E=;
        b=c5nJYQy5SWRq5bN0NQjovfyfWwNo9itnbJ0vZOmDTurXvKIR6RjQ7334EwZwfafmve
         Mr1wHlLgWDvebH+bocFRjdr1DAtUGZR3Ea60HYn4RQSWbyPXds+vD6yp7CwcItDOsgue
         Mr6lVhzjvs6ava9w8jSfiPorIjPauIunpVBFGeMLYMkIfeKOLGoXXwTOaD3AWs6At6Oi
         DYgWtItfl7ytiEaoqi+tYW7RsymWd6Wq3brdmULEZGl5svXt3SlwiSwDHcaFxaWvdcBN
         cVqPm691l9U/Dk6cKDnRdVDX0mLWvR2ipvGtMI2MlWiDs3tQ9A46wqEp38BpkVVWLAyb
         KyfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=J9WoRDuw;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=pKzVu72BYpvUMfJi1wnPkkrRQPCTcfzeOZIGlfIhJ2E=;
        b=E+KRzJO8CF7LL2lUfuEJxIKtG/nBh8bXt20ESTck40i3CvZ4OODaJqiWUpLkCUNBF9
         SvJA6lxHi2es8f+H78lkWmfDpeJY24LfBloubQ0wRrwAKq1Qmlo77mqWrAZ2ackWa5x9
         ONG6Bpk9d13Q7o1T9wXvINwoWKX7JQT1x6GWNZPas/PfH8l6rlsSjgVVPc6eKgEqugnr
         926obCUofg1S7DZD0y0wxMup4R4agZ/cBgYNfcEmvXD9cthRZ22lOKsf+OfN2rdp0U7E
         gk6MoiIvWDpJNt+YkYf/8l1gYBapITmfv7St9Skpbp1zsAHV0eJesHgd8FLEQqRUR0e9
         IcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pKzVu72BYpvUMfJi1wnPkkrRQPCTcfzeOZIGlfIhJ2E=;
        b=ZqZFSnkEPWPHAv7+lPYlegm5jz6TNyVxc+H65SdmTlEpckTPYhjbTtO3AvkfDRll1L
         Hzwjz1kmoE9bJsCp7fsZdOpjo6XYCDg5zFmmE00RbZvV2KGb0ZUH1MBEHQi3UIEntZAg
         C87lkn456AX8BiGCuNVcbAxE6t5Z2A7MANPrQJQ1WOgjDd8nxgfTA4UBM/kDsSzxWWz6
         B6oI1NmwOTyLUTxl2tuYI0Vb9luDLy1AKKLSR6S9VhiNa+s/9N34nL5iI0oObCo98mbu
         0KYkU1GUdILmCq5D1v7yxn/5L+u0MWhbP90p+KSedWVROahT42lQEfpuQXs0uuQoA7hh
         z0mA==
X-Gm-Message-State: AOAM5331EWck4HUliEuJGOUTjkT9RDI/Q6FMvhk7lqhRRHywQPTTjWbL
	ycQ7WuBh/LedHpliuUjFNis=
X-Google-Smtp-Source: ABdhPJxlWxLBeYQOoul/oeXKqIb1IgM8kRDAjuCHsqeHaCoUX+G3mqWCMDvQqisaDsYaoBxzeHz2Xw==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr32437858wra.118.1596037625389;
        Wed, 29 Jul 2020 08:47:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls1642489wra.2.gmail; Wed, 29 Jul
 2020 08:47:04 -0700 (PDT)
X-Received: by 2002:a5d:4906:: with SMTP id x6mr31606077wrq.142.1596037624544;
        Wed, 29 Jul 2020 08:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596037624; cv=none;
        d=google.com; s=arc-20160816;
        b=NKav5FjgorQL23S+ylWwjCHQrD7maQacykz7UGtjT90GeIAsaa1NalP3KmInm848Gk
         lUdHVIXGppyX5B6QeGwDHi9+1wSeAugfrbkUWqGPKcoBE/l/Rx2s3QpQBi6CVnw70pEB
         O46YNsw2UTOivcToAuGweUCyWUnTqM7tfv4fuSqFBOFliikFK26xXT/svq7Jd8GkaTrC
         uwov7ADsRzqQ/3QXhaEvrRUPPpxukZZTkPif0ChufbLl6xgEb0Yvp/QpatxBwuFRY8jL
         8S5wXbY5hxLvTRO3llOpFgDMcIcMc5a8LQvqjCkEXaFbMI/3hrGb1uT+rzGu1cWu/CXD
         WxbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=dSVNJ+lM8/lWayIVMaB6Ggmn28K+tPCvpyxpQT0BBGY=;
        b=x8OOtmzNRh73gR1uPkgpnKLuI8q10/I9lRVOllhwI+sDl9xDYnYnToWD3P7O4o2GEg
         EcZUqExUnPLccTrOa6vufuaDhJC9BJdYKxUY3RQ6BLk6ZyQEPiLbVSKpZpPuJrVYdIib
         rRbJtrKIyObDcV2chvF8YHfamdVNpXOw9VEJX/FzAP0B14I80xkSOPkjXl44Ord7TWuY
         LvM7sNIcryA8XVLfnU8MaCL75wXYSw3PnYa/xVDMo0XWCCvDWKpJ/Puv5md0ajES1Z0P
         mQko56EtfZ/g7i88DFBTW8oDSNVc4TFEzDB7vyiwqj44YMy9s5ndMxPCiT5ebPCEn4gG
         sD3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=J9WoRDuw;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com. [2a00:1450:4864:20::542])
        by gmr-mx.google.com with ESMTPS id j83si483692wmj.0.2020.07.29.08.47.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 08:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::542 as permitted sender) client-ip=2a00:1450:4864:20::542;
Received: by mail-ed1-x542.google.com with SMTP id c2so11906455edx.8
        for <jailhouse-dev@googlegroups.com>; Wed, 29 Jul 2020 08:47:04 -0700 (PDT)
X-Received: by 2002:a50:9987:: with SMTP id m7mr29389064edb.176.1596037624124;
        Wed, 29 Jul 2020 08:47:04 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id js19sm1939167ejb.76.2020.07.29.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 08:47:03 -0700 (PDT)
Date: Wed, 29 Jul 2020 17:46:05 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Nicholas Mc Guire <der.herr@hofr.at>, jailhouse-dev@googlegroups.com,
	marko.bertogna@unimore.it, giulioc@xilinx.com,
	c.scordino@huawei.com, fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200729154605.3igcz5ni4ddukbze@carbon.xt3.it>
References: <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
 <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
 <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
 <ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c@siemens.com>
 <20200728110945.w4o52pgtq33ic2pv@carbon.xt3.it>
 <d8b12a27-69dd-e47e-a7e2-258192696bc6@siemens.com>
 <20200728224145.qj4ljq2zm76ueo32@carbon.xt3.it>
 <3ebac25b-6f04-79c1-f2c1-998fa7ecb308@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uv65z7pec5yidm7r"
Content-Disposition: inline
In-Reply-To: <3ebac25b-6f04-79c1-f2c1-998fa7ecb308@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=J9WoRDuw;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--uv65z7pec5yidm7r
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2020 at 09:53:27AM +0200, Jan Kiszka wrote:
> On 29.07.20 00:41, Marco Solieri wrote:
> > On Tue, Jul 28, 2020 at 01:30:37PM +0200, Jan Kiszka wrote:
> > > On 28.07.20 13:09, Marco Solieri wrote:
> > > > On Tue, Jul 28, 2020 at 11:26:45AM +0200, Jan Kiszka wrote:
> > > > > On 28.07.20 11:15, Marco Solieri wrote:
> > > > > > On Mon, Jul 27, 2020 at 11:39:48PM +0200, Jan Kiszka wrote:
> > > > > > > On 27.07.20 23:13, Marco Solieri wrote:
> > > > > > > > If we understand correctly your
> > > > > > > > implementation, you are mapping the entire memory region an=
d then
> > > > > > > > copying blocks of the binary image using what you called "c=
olored
> > > > > > > > offset" function.  That was very similar to our first (unpu=
blished)
> > > > > > > > attempt to implement "colored loading", and we soon discove=
red it is not
> > > > > > > > very efficient.  Loading time grows considerably and could =
impede
> > > > > > > > scaling up to larger images (e.g. an Ubuntu-like rootfs).  =
We think that
> > > > > > > > a better alternative is closer to what we proposed in the l=
ast patchset,
> > > > > > > > that is:
> > > > > > > > - create a colored mapping,
> > > > > > > > - perform a "virtually" contiguous copy of the image.
> > > > > > > >=20
> > > > > > > > We understand that this logic has to be moved outside the h=
ypervisor, so
> > > > > > > > we would like to move it to the driver, exploiting Linux vi=
rtual addres
> > > > > > > > space to create the colored mapping.  What do you think abo=
ut it?
> > > > > > >=20
> > > > > > > Did you examine what was causing this slowdown? It seems high=
ly
> > > > > > > counter-intuitive to me, given that we are only copying from =
memory to
> > > > > > > memory in 4K chunks, just using different virtual addresses -=
 that' all.
> > > > > >=20
> > > > > > I think you are right, indeed.  Doublechecking our old (and slo=
w)
> > > > > > prototype, we discovered we were actually not just copying at e=
ach
> > > > > > iteration step, but we were also been ioremapping.  That was mo=
st
> > > > > > probably the cause of the slowdown.
> > > > > >=20
> > > > > > That leaves only a design point in favour of the contiguous vir=
tual
> > > > > > mapping.  It makes the implementation more robust and elegant, =
since it
> > > > > > enables the copy operation to be independent from coloring and =
thus
> > > > > > reusable.  This is enough for us to favour this approach.
> > > > > >=20
> > > > >=20
> > > > > To my understanding, the choice is between:
> > > > >=20
> > > > > for_each_colored_chunk
> > > > >       copy_chunk
> > > > >=20
> > > > > and
> > > > >=20
> > > > > for_each_colored_chunk
> > > > >       remap_chunk
> > > > > copy_whole image
> > > > > drop_mapping
> > > > >=20
> > > > > As the first option can be reused for uncolored images as well, I=
 do not
> > > > > really see the value of option 2. Prove me wrong by code ;).
> > > >=20
> > > > I see.  I would easily agree with you if we assume to use the
> > > > `jailhouse_get_colored_offs` (or something similar), but we rather =
not
> > > > do so.
> > > >=20
> > > > Instead, the `next_colored` function should be favored as the
> > > > fundamental coloring algorithm implementation, because it is closer=
 to
> > > > the hardware meaning of coloring, in the sense that it preserves th=
e
> > > > notion of bits in the address, instead of abstracting it away behin=
d the
> > > > notion of offsets in the memory space.
> > >=20
> > > I disagree here. First, because this abstraction is a benefit - provi=
ded I
> > > didn't miss a case.
> >=20
> > Abstraction is good only until something meaningful for you is hidden.
> > Then, it becomes obfuscation.  Coloring is a concept that cannot be
> > separated from its bitwise nature just because of some additional
> > hypothesis (contiguous color assignment or contiguous color bits) that
> > restricts the generality without bringing value.
> >=20
> >=20
> > > And second, because the algorithm avoids the loop for the calculation
> > > and simplifies the loop for the virtual memory copying or mapping (th=
e
> > > latter is not implemented yet, so just a claim of me so far).
> >=20
> > The loop for calculation is useful when you have to deal with non
> > contiguous color assignments, but it can be removed, of course.  I gues=
s
> > that also the other kinds can be removed, but this looks orthogonal to
> > the chosen approach (next_colored or offset).

We explored some optimisation in this sense.  They all boil down to
either memoise the sequence of possibly discontinuous colour
assignments, or reduce the loop iteration length by iterating over the
colour bitmasks, instead of their content.  In all cases the
implementation is heavier and less readable/maintainable.


> > > > As a by-product, the implementation is also more flexible and gener=
ic,
> > > > since it could be applied also to different kind of coloring, e.g. =
to
> > > > bank coloring.  In these cases, nasty placement of useful bits coul=
d
> > > > make an "offset-oriented" implementation hard to read (and also ver=
y
> > > > difficult to write :-P).  E.g., consider a case where only 12 and 1=
4
> > > > need to be used for a 4-colors platform configuration.
> > >=20
> > > If you can point out concrete platforms/SoCs with such properties, it=
 would
> > > help finding the best solution. I dislike design decisions that are b=
ased on
> > > speculation what could come. Usually, they take costs for "extensibil=
ity",
> > > and the outcome will still have to be adjusted when the real use case=
 comes
> > > along.
> >=20
> > I agree with your position against unfounded extensibility arguments,
> > but it does not apply here.
> >=20
> > - I am not speculating about unreal possibilities, I was referring to
> >    real hardware. The first result I found is Intel i7-860, where:
> >    - cache coloring is possible on address bits: 12-18;
> >    - bank coloring on: 13-15,21-22.
> >    A discussion about bank/cache coloring on such platform is in
> >=20
> >      Lei Liu, Z. Cui, Mingjie Xing, Y. Bao, M. Chen and Chengyong Wu, "=
A
> >      software memory partition approach for eliminating bank-level
> >      interference in multicore systems," 2012 21st International
> >      Conference on Parallel Architectures and Compilation Techniques
> >      (PACT), Minneapolis, MN, 2012, pp. 367-375.
> >=20
>=20
> Bank coloring has also been explored in PALLOC in the past
> (https://github.com/heechul/palloc).

Yeah, I know it very well.  There is also another and more recent
discussion about multi-dimensional colouring in ''Coordinated Bank and
Cache Coloring for Temporal Protection of Memory Accesses'
https://ieeexplore.ieee.org/document/6755286 .

> I think Nicholas (CC'ed) and his fellows did a prototype with
> Jailhouse as well.

Interesting.  Nicholas, is the prototype available somewhere online?

> Would be good to collect the requirements from today's CPUs for that
> (i7-860 is probably predating the needs of Jailhouse).

I said it was the first counterexample I found, not the best :-)


> > - Nor the next_colored proposal brings additional costs, since compared
> >    to the offset implementation
> >    - it is simpler and more elementary;
> >    - it has close or equal performance;
> >    - a tested implementation is ready in v2.
>=20
> I agree that, if we still face non-contiguous bit ranges, straightforward
> calculations have to be replaced with a bitmap search algorithm like you
> did. Maybe then using ffsl.

We weren't aware of the builtin availability of these functions. Nice!
(I hope it is portable enough.)


> > > How did FreeBSB - or what BSD was it? - model coloring?
> >=20
> > FreeBSD supports only a simple form of cache coloring -- I would not
> > consider it as a reference, especially about extensibility beyond cache
> > coloring.
>=20
> Good to know.
>=20
> > > Any other reference that may have worked on more that one board?
> >=20
> > We tested the proposed solution on Xilinx ZU9 and ZU7, Nvidia TX2, and
> > NXP i.MX8 QM.  We have tested a very similar implementation logic also
> > in Xen on Arm v8 (Xilinx ZU9) and x86-64 (Intel i5-5xxx).
> >=20
> > Do you have any point in favour of the offset-based alternative
> > implementation?
>=20
> As said above: If we need to handle non-contiguous bitmaps, ie. multiple
> jailhouse_cache regions per cell, your approach is needed. Then we should
> improve the implementation (make it arch-agnostic, move to
> jailhouse/coloring.h, use [__builtin_]ffsl).

We are close to finishing a v3 revision, where we have followed this
lead and improved the next_colored code.  Beside the contiguous virtual
mapping, and the revision of the region size semantics, all other
comments have been/are being addressed.  It should be ready in the next
days.

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
jailhouse-dev/20200729154605.3igcz5ni4ddukbze%40carbon.xt3.it.

--uv65z7pec5yidm7r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8hmboACgkQCtn83XWC
Ln4dkg//WThfRKoY4+OudDAonX3AagI7tGs2C3vMvJTmSVW7L/FkOIUy3lCRxbzf
v8WdPItF0aK/GEbuC7U7RAU/TqKswchHV89IhJrCN7omFr1c1LJv4I3z+tmxV8MD
8uYuQOuHMhQoXC00ad2Iuyo3c9QTKMTo6XxvXQRY2s3HIz6Y+k4fnkymyXLVUC9B
MYtlvr1dpb0IdnOLPwBwclzdicM5Apt8irwExl4RMmr3zPl860dZJT3cPOLomQj2
uKo/mSNfJdgJy+96JJV63j2hwg8mxGLxdCQyujnCvi1apo606uMiSI9J+DKjeDfc
lfTG/xVwVmWWkH1b5m8XZM28ihjqxZZnF7/f6l86OwvD1yw7nCxOSfgFdzhCX/mc
EVNEYYg8G/5KH+tftsa+E/MTtxDDLC4IaxkW67AK0iQV91E+SJqaM68pl78WgD/4
aS8Mticm2NQInLCdChvDQ69iTpHZw7xyIzAal2W99D+ZR2U8SIGfXgqgUy27mRg6
hlL/Sn488OKikufsFDHsFfiNMcOER+xzah7kH/FGLVuKfuet6bsBA+e0jcBTrtL8
7ksOvl6HM5E7A9lYLXwZ5KNL8IxukPQb20CY2vPcfsAN6jRvUO3Dr+VGlpm483oI
2vs3z1YPHsV+UvG0Z5wHDJQDKIOAXH2Nbk3AnXWT30HfCUyQP7k=
=+/lT
-----END PGP SIGNATURE-----

--uv65z7pec5yidm7r--
