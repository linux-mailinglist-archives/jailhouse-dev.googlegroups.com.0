Return-Path: <jailhouse-dev+bncBCOKB247TIDBBVG2TT3QKGQELQ3XI4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5CB1F9114
	for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Jun 2020 10:12:05 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id r10sf2997084lfc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Jun 2020 01:12:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1592208725; cv=pass;
        d=google.com; s=arc-20160816;
        b=SufCpB0vx6DJTj9H/P6y4AOg/+h4ndiUcVIfSDhfNQmoocbjm3Cwud38L+p5JiLpTR
         0ZhCu4hr8qHD/Lu62WmzyaE1NUlqr9l0YvH5020V9pZlQjhyl8GkAQqjz/vzOjxz7Y/T
         caNOMmomYDwvqf+5W852ur5Ptc/dC9j43d9v4qc72cb6h4JR6h/ryNlnzy1MDPp8BDd0
         BchfOz/h7uCQ0kzGOeIt2VGI7OconL12flzP5ezcsW6/a2DJOogzkn081VVCS0vd2QQV
         loJ8xays7ZUYuB+hIU2cXKhOpeaINHFlmBtt6X0jr75fokc4+kLS/klvtH26YU1GePqu
         +V1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=DIEnDbqmcLlyJXetnDMkhQtczyRiDUY6jneQ1SNon9E=;
        b=oQ6z6ecOTMDapP181Z1NWp81Jb3zunzJcMahBDrFRHthFnDaSoXTJfSoqf3vBHsC2u
         mzFa/QdD+iOb8rYCRf8X0KzPmY1d0Ea9xwHrYVIhfuhIQNSNTIQMGQ9vaLBcfhBuVpSK
         1TWD7jGhuVd+30sEosqg4x4szJUXCtp1tZkyZMWXjdB7l1S0Mzd7/OWtl9reZwqpW/cY
         TakO1lXvs68wc4v2KTGbOu0O11zxb6Ddaiw4OjF4axScTbCgfFQ04PKAorSwXnLY3X2c
         DEQATCSXO9f/Q8xijmXIRpVSRs6d4OVeA2jG3zn9UV7quiheVPMFaDnUdod/tvCBr2f8
         o06g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=VrWzvQty;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=DIEnDbqmcLlyJXetnDMkhQtczyRiDUY6jneQ1SNon9E=;
        b=OwPCCccLS3C2Ao7UFGwFN4vN7ZEzULUPDR2+JIt2DgSk+ll3QccOZ6E3/o9cE3zCJk
         K3e5axgSWQZxwT1LI1oWIGXY8vCquAGv2gd/QNoFsv0V0JS9dfHNnAxQt0HUR43v4YLT
         ODiK5zKc/IkJuebqw+jf6UV/dczkhc3k9HPTenPg/FzyHewsWOPDcfp2ppRdv5kIJVtf
         xi2QLz+OVzOoqHdgzq2XZjE8e9sr2GWP565t/kLlSclaSt6Adiw53av91vTQtUL/giTT
         6eXoeXyP2kkwfSKUiUbmnY1+t9rGXOiCrd1tTnvlohP4a2+f3CSvWp5KNpjRvrBGbqnF
         4rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DIEnDbqmcLlyJXetnDMkhQtczyRiDUY6jneQ1SNon9E=;
        b=gRgzQJM2tyvRqzIx7+pflwbU37TuEZcA9glx5kNSgGAfPGJxmeuGuyiHoEt1WSJiGY
         3YUJiDRlUaY2JT3dBXL2ufLEmiia0pfV1XU0YKZAA/lHH3GJJC+UrVWVojUAQX6Ycbyj
         RuTbAW5vHVg1FjfvJzKwLRzSboeyHWSf7lULbb3tygpDGqXYkIhqLduQhpGBB+o14XXF
         JZOwhzvpMCQx4qDinoPZiCKTL4Qczw1QsKrJcWfLLusc3+q2/uBpUeoeju0v0dyyk3a/
         MWLS8K3MPU8SzilkgO8GWNxeByGWWv+l1usokC2N9KSlNAiGSG5v/jerF4KNfatqaKAF
         t4aQ==
X-Gm-Message-State: AOAM533dhXDKVP2AWcw2ZgHv8NViMVCPkCHpQgWDz/wzgf9qxyLABFiP
	ZhGG9Cqvkiz5PjwB0Wd5EYs=
X-Google-Smtp-Source: ABdhPJxtQH1p0U+aaUoTSEeOhCB5+OQg68LK58VWOJQSXPjrcIa7WVVWWY75Fr+JRLUtbj4Jejfb2A==
X-Received: by 2002:a19:ed17:: with SMTP id y23mr13076623lfy.162.1592208725115;
        Mon, 15 Jun 2020 01:12:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a02:: with SMTP id h2ls2410289lja.6.gmail; Mon, 15 Jun
 2020 01:12:04 -0700 (PDT)
X-Received: by 2002:a2e:a548:: with SMTP id e8mr12859046ljn.76.1592208724454;
        Mon, 15 Jun 2020 01:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592208724; cv=none;
        d=google.com; s=arc-20160816;
        b=C8xjc2xCqj7wZXtDtbpWHi/+RCOc7ygRn32x42JRU4nyN5ir9G4S+d17LeB/yWCf5C
         Jlcua2eu6XxegyQw2KaapZrIRLztaVXGSOAO0aKqWqCt4NKWj/b65wU0+Fea2U0hYh6Z
         2em4IpH0bYgXta6O2dlpBmrQ9NOAP4fcpBCqjVWiFcUlHl2qCtVcvaHRHcJNsFJeSdsw
         RgRoDfyPcB5u9CRLQVpaZMDDixwAVrOfUq53zl60GkMBAuKfA2eJ5s6bljQGrvrxue++
         To+DqDf7mXbo0sEWRWo54p+hh8AcAnpqS0gY4IjwC4zn5RUJnfByWuf5A5ekj4zBd6LY
         MTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=I3OWJgSz3VJVxcS/lMjGWmhC1c19olBIwgVt/+Mg+3k=;
        b=ECVVyC84UE627O8ULTa219utfjgwNjQVt+X51LbGZmO2Op9fdFwR+2wZBlGOphlVy4
         OI4riNlErqDee5Hrs4o6eCgFx/L36gF3aI/PjwqBwX+2zbJtrss1NxcRQUb77vxlN7Rv
         56NRdXr1f9OWqFKX/8Kp2qk0crCITlJXA8Pq1JELR1tbpA6nr0QbxQTQV8z1YCmFS0p9
         vu30htTyxNV822rer5y9c79BYqPIBPd7KfJ+1lnvs7Phqz+LhCipPyrsEI4FSG6Jk3LY
         3XGrxpeWELlfG0GK+HtUyaOeFQmxwWxadaVsmg8HU9aP7ZQj+nmJxPS6tqSot0VzNlPM
         Iz1Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=VrWzvQty;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com. [2a00:1450:4864:20::443])
        by gmr-mx.google.com with ESMTPS id a15si145849lfb.3.2020.06.15.01.12.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 01:12:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::443 as permitted sender) client-ip=2a00:1450:4864:20::443;
Received: by mail-wr1-x443.google.com with SMTP id p5so16047019wrw.9
        for <jailhouse-dev@googlegroups.com>; Mon, 15 Jun 2020 01:12:04 -0700 (PDT)
X-Received: by 2002:adf:97d3:: with SMTP id t19mr29377301wrb.116.1592208723873;
        Mon, 15 Jun 2020 01:12:03 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id u12sm23366510wrq.90.2020.06.15.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 01:12:02 -0700 (PDT)
Date: Mon, 15 Jun 2020 10:11:39 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35obsxxvisd5a57s"
Content-Disposition: inline
In-Reply-To: <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=VrWzvQty;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
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


--35obsxxvisd5a57s
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 05:20:05PM +0200, Jan Kiszka wrote:
> On 26.05.20 15:24, Marco Solieri wrote:
> > On Mon, May 04, 2020 at 08:54:32PM +0200, Jan Kiszka wrote:
> >> On 22.04.20 10:51, Jan Kiszka wrote:
> >>> On 22.04.20 09:22, Marco Solieri wrote:
> >>>> On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
> >>>>> On 27.03.19 13:18, Marco Solieri wrote:
> >>>>>> Predictability of memory access latency is severely menaced by the
> >>>>>> multi-core architectures where the last level of cache (LLC) is
> >>>>>> shared, jeopardizing applicability of many Arm platform in real-ti=
me
> >>>>>> critical and mixed-criticality scenarios. Support for cache colori=
ng
> >>>>>> is introduced, a transparent software technique allowing
> >>>>>> partitioning the LLC to avoid mutual interference between inmates.
> >>>>>> [...]
> >>>>>
> >>>>> Thanks for updating this! I will refresh my caches on the topic and
> >>>>> provide feedback soon (I already have some questions and remarks bu=
t
> >>>>> I'd like to double-check them).
> >>>>
> >>>> Looking forward to hear from you.
> >>>>
> >>
> >> Done with the deeper review. Overall, the series looks fairly good. I =
see
> >> just two bigger open issues:
> >>
> >>  - inmate loading interface
> >>  - more architectural independence
> >>
> >> But I think those should be solvable.
> >=20
> > The major point you raise is that the impact on the hypervisor code siz=
e
> > should be minimised -- the inmate loading interface.  We took a while t=
o
> > consider and weigh the various alternative designs.
> >=20
> > First of all, let us consider the optimal solution in this sense.  That
> > would be placing the whole colouring logic outside the hypervisor, in
> > the Linux driver, or in the userspace tools.  No matter how implemented=
,
> > this solution would require, sooner or later, to pass to the hypervisor
> > a list of memory regions, one per each memory segment to be mapped.
> > Now, such list would grow unacceptably quickly, wasting a lot of memory
> > to store it.  Take for instance a Linux inmate, and suppose 128 MiB to
> > be its memory reservation requirement.  Now, assume that each
> > consecutive fragment is the shortest possible, i.e. page of 4 KiB.  Thi=
s
> > means we need 32 Ki elements, each sizing 16 B, which is 512 KiB in
> > total.
> >=20
> > This brings us to a design conclusion.  The mere colouring logic -- i.e=
.
> > the algorithm which conceptually expands the colour selection within a
> > memory area into the lengthy list of contiguously-mapped segment
> > (next_col) -- must be placed together with the mapping function
> > (paging_create).
> >=20
> > We believe we can leave everything else outside the hypervisor without
> > much effort.  We can move in the driver:
> > - the cache probe function (get_llc_waysize)
> > - the initialisation routines (coloring_paging_init and
> >   coloring_cell_init).
> >=20
> > We believe this is the best compromise.
> >=20
> > In this case, a minor issue is also worth to be discussed.  The cell
> > load function requires an IPA-contiguous mapping for the memcpy to be
> > efficient.  This in turn requires such mapping to be performed by the
> > driver (we don't want to add an hypercall, right? ;-)), thus including =
a
> > second copy of the colouring logic (next_col).  It would be nice,
> > perhaps, to have a 'common' section where to place code shared between
> > hypervisor and the driver.
>=20
> Thanks for the explanations. My current feeling is that I need to look
> closer into the implementation so that I can argue here on eye level.
> Will try to schedule that soon and come back to you!

Any news about it?  We have time available to follow up for the next
month or so.

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
jailhouse-dev/20200615081139.agyjjsccbwnsux43%40carbon.xt3.it.

--35obsxxvisd5a57s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl7nLToACgkQCtn83XWC
Ln6Ujg/+KHMwBS8/B9IbZOOkW+uD8PcwvnRuk6Jxazzf/9cC+EyT5rUMi+8y7WFx
kVtq/Wdt53v/bm1LeFo5O2T3UjQm3ZU9/7UHi1TR6xamryL0ok4lndXsL45t1yuk
Gx03yJWk5u5df/Mf2VsD7Panxlc4GaE3/lz+ngde8BtjnW/UAzrdPEz+Wt55oPWi
Qi+Sldi6VkMkQci6Ov8sDlk0Qi52a1jGHptkKPPz48IjjtGkCpBmerlxrSDzoObi
u7WJpAsiY/xBkaw4SVDsh5j2x4jJaViXryPSKgjn5LDadD36v0phuyBpZU41Z3r+
enf45IvNUHs4flEijLhr/2Y8OUqGyBcXxRCgezLzhI5u/lE3skEB7gEpYk+2QD+r
wm/t3bUN/gzB55pjRKplVpGrn/AyFVSlIxl5jjMhmXyOKTgyH8z5V0UplCZhBpzm
LGNpnJIyqI6cY8xmL9x/6j/2pPiR5cT8ki/bzi2AJqfEhKBa8u+3zpCpEAnoJ9dL
xY+kQB/x+5ql7qhymKJV27b7bOlwAJY3MJLr7XTqh9dPZovIn3oIty9xJrCl6zrx
VhQHLPgURnBn8o28+ybSERlN12u/Y+rx0TQQ3wWRrOOthqT4YtKQ/7c8x4UQUZcD
/X+hxfKnAQCQ9iRvUOniarJwVsBQIDnepy8czszJa1Jv7NZLiJk=
=/9Mt
-----END PGP SIGNATURE-----

--35obsxxvisd5a57s--
