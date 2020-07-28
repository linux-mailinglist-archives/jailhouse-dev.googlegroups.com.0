Return-Path: <jailhouse-dev+bncBCOKB247TIDBBPOTQL4QKGQEMA4YLEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id F32722315AC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 00:42:05 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id x9sf6023894lfa.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 15:42:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595976125; cv=pass;
        d=google.com; s=arc-20160816;
        b=smB9vZeDM3SLYO3urSFWOiLKIsN1a+S3uZ1Zxl5Fg/y+4Bq646KCJEA0hcJubMpXG0
         0biAqwCpf6xXbXTov1292aRCLLgNAjONe0ky3h2A/19xyruLEmfk+1dzIKP7nIUrgWvC
         /pmWPWIgQzT4zzwkEyXssXnxWYiU80LBw9CcvHlTIn3GQzK0TbqN6F/9C8CQGqIRYByV
         Trz45c51HGhfceO9Ai+rO52OINvOjCxSPbhQRuDqdn0e2iqXdf5o9N1jkJt3uibHk+bF
         AR/G8sEmVF/LYg68hLdD9b5NtRgZGi2qEXB5M3NgaCgm92v9Rv8tk5n5ko0quSYqagR5
         B6Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=VQf6ubY4f6+N7aVVkor1JH1HAeDLmeDafEhQb8vRY9s=;
        b=VrItCS97tI4THwvOc1DyVwcMAxwDt1Uo1eYHmUM7w3A6IbG9oW37G/dkiRpq/La37U
         IqeTGQh9ltbIfVV9FY9hwSbOOZIdlU0W06BQzPlXJNIjqCMnKYGZx+5gYeqLlhU6RNIa
         wJDa35M0I7EU6D6ZeAgRYBJu2xPVJOQefJIYpW1BgCStlKyHeNezjOep6L3uQ30NYTiV
         TJZcDQBvR5e4pEquYGKwurV4pvB9OHB5T0bXMzCpMnbXG/RluWVudNm96sX61518QorB
         FVfYo1YEcXOTwEg25YWyokD9hknBqoHcjNXGbgJZh/3g30yeJN+NUke3P6R8J6WcGZDA
         l0zQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=lPwtqjgX;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=VQf6ubY4f6+N7aVVkor1JH1HAeDLmeDafEhQb8vRY9s=;
        b=cR5l5HnZJccBwIWpl7bhwhodp8+UmZ3wmj3L++60l0GLevIsOfbPPy2V+I/i5FgVkx
         jlCequoTCGQNNN1ZBSywje10mX1IrQWvK5rouWEP/WmZtepkyL7phnm/VxbQEaFWiazy
         u3AlV/1KUEq2slY91M6XXS9o1EB1PrX2J3caA8dFI9KQbPqkKdoqhGtWTm92BcaWLnDN
         U0h0FrVziranKR7kS+2iFfAXO1e5Mw+euKdst237zprJzwZLx7MvsJhwGGZqor2ZJ0d4
         3hEmuWAcIfAuflWIqrzpDPj09+c3YAwuDe1NxnlTSZmTjnGXzd88HMSWZhTaklocK83H
         WgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VQf6ubY4f6+N7aVVkor1JH1HAeDLmeDafEhQb8vRY9s=;
        b=Hq6QUgryvx/y9jpJ1s+zVCgNJPpZSjG67QWuK+5xeqmyj9dIaVPArcEXUcLzU7KyJX
         5bxbn//RkkwPhvwGHBpx6+zERl6gp4JdQ1S5QLduHgHKZMrUCXZLUUkJJ8V4elbs+R7M
         QGvF8jmIN91aD7q+TTlGxj5ZxLJJnRDDC/AG4ig//Jix1Zd20yEE2S5h8ScM8iKmxskx
         wFz8fNyykBgncdVnALrlQDR6ex14qtQRqf+ga7INuab40/SCoMcBHAb/bzxAaihoPFUo
         r1JqsBYzIFhYuzAz2SfIm/VmeOX5jAJpSS6iftT4CzCfXDnLpkOrJI5j7zJFRLILTjL+
         f00g==
X-Gm-Message-State: AOAM530wUSrzP4etywsBTRadwzEj3djihaaTHXDd++2ZGXPjblz2KteY
	UsRU++HG4sRJ9jXLxv3rQOk=
X-Google-Smtp-Source: ABdhPJwYVVxmOk4MzEEZqiGDdPqAQhv8J3SpSTarhfB18wX2MsHErvD/J4khbuyo1ykEFo86xANBCg==
X-Received: by 2002:a2e:8157:: with SMTP id t23mr14089742ljg.417.1595976125413;
        Tue, 28 Jul 2020 15:42:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e33:: with SMTP id o19ls94170lfg.1.gmail; Tue, 28 Jul
 2020 15:42:04 -0700 (PDT)
X-Received: by 2002:a19:c68b:: with SMTP id w133mr15236757lff.189.1595976124615;
        Tue, 28 Jul 2020 15:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595976124; cv=none;
        d=google.com; s=arc-20160816;
        b=cJPS0xkDneS1FhhKotrQX7WjQN99MpJebLPezYNGN3rQVKJbFMVVKAq5zZ+Yu7jF6o
         S0Du7i57NA9jj+Dw2IlX2f/jctLHUVPRtFGtjpq/34hoH2EgqPTFry9cGMKkgZO6pqRs
         6KZY2azQ8rQKJLOJS5cvVpMBGiRnkrNqflGl6sQQIBkqOjEHto9uyLr9Zu5rIRXgLKh6
         7hHd3KSg471iddigtIzTSUU8+OgP5umd/77pg+Vxo7bsbubb8IRJLNMF2w+26LN6Jj43
         M5aIyMnl5ZxRjqac/2MIES3JBSg3LTU7XSwug2SHRguQTGBxfFjqLxl9+tGQUvzrEdjU
         4lJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Bwy6lsmEof8CvFpHa1RL0+d3yBLspmtKtek0sbM4uWs=;
        b=f8ji1nILNOnJzWZuiXWgCYdNkjnKLoUnQLiGUPz11vVdImGAr3UQaK/6mnYx85byVu
         L/vJj770eaIEhItWAn4rxZYhYsXfqmJuI6vH5OG8XB5uJO8AaZMhIHbRyT+ox+e/J6hk
         ZlFcgoKekYamCsVLm1A25CaBfezC8ditetOiC3aIVb0XPXjD/EFBU/x9vBXO2fVeqdL7
         WrqGig5mi5kM+fefPhokSGblyk20/sRyg7uoLUtWZrgCZSpto4sl0iHLoy51URImquAG
         lANVp+AbiC0Hq1x9lgjIBaYyPnXxBM+G+4azJNJtnvnaIg/5LbGlxdBYTtHL+vKUmJkZ
         8kSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=lPwtqjgX;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com. [2a00:1450:4864:20::542])
        by gmr-mx.google.com with ESMTPS id c27si14883ljn.3.2020.07.28.15.42.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 15:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::542 as permitted sender) client-ip=2a00:1450:4864:20::542;
Received: by mail-ed1-x542.google.com with SMTP id di22so8805204edb.12
        for <jailhouse-dev@googlegroups.com>; Tue, 28 Jul 2020 15:42:04 -0700 (PDT)
X-Received: by 2002:a05:6402:7d5:: with SMTP id u21mr11339631edy.235.1595976123874;
        Tue, 28 Jul 2020 15:42:03 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id u13sm302126eds.10.2020.07.28.15.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 15:42:02 -0700 (PDT)
Date: Wed, 29 Jul 2020 00:41:45 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200728224145.qj4ljq2zm76ueo32@carbon.xt3.it>
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
	protocol="application/pgp-signature"; boundary="7vejka5bsyvirvxe"
Content-Disposition: inline
In-Reply-To: <d8b12a27-69dd-e47e-a7e2-258192696bc6@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=lPwtqjgX;       spf=pass
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


--7vejka5bsyvirvxe
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 01:30:37PM +0200, Jan Kiszka wrote:
> On 28.07.20 13:09, Marco Solieri wrote:
> > On Tue, Jul 28, 2020 at 11:26:45AM +0200, Jan Kiszka wrote:
> > > On 28.07.20 11:15, Marco Solieri wrote:
> > > > On Mon, Jul 27, 2020 at 11:39:48PM +0200, Jan Kiszka wrote:
> > > > > On 27.07.20 23:13, Marco Solieri wrote:
> > > > > > If we understand correctly your
> > > > > > implementation, you are mapping the entire memory region and th=
en
> > > > > > copying blocks of the binary image using what you called "color=
ed
> > > > > > offset" function.  That was very similar to our first (unpublis=
hed)
> > > > > > attempt to implement "colored loading", and we soon discovered =
it is not
> > > > > > very efficient.  Loading time grows considerably and could impe=
de
> > > > > > scaling up to larger images (e.g. an Ubuntu-like rootfs).  We t=
hink that
> > > > > > a better alternative is closer to what we proposed in the last =
patchset,
> > > > > > that is:
> > > > > > - create a colored mapping,
> > > > > > - perform a "virtually" contiguous copy of the image.
> > > > > >=20
> > > > > > We understand that this logic has to be moved outside the hyper=
visor, so
> > > > > > we would like to move it to the driver, exploiting Linux virtua=
l addres
> > > > > > space to create the colored mapping.  What do you think about i=
t?
> > > > >=20
> > > > > Did you examine what was causing this slowdown? It seems highly
> > > > > counter-intuitive to me, given that we are only copying from memo=
ry to
> > > > > memory in 4K chunks, just using different virtual addresses - tha=
t' all.
> > > >=20
> > > > I think you are right, indeed.  Doublechecking our old (and slow)
> > > > prototype, we discovered we were actually not just copying at each
> > > > iteration step, but we were also been ioremapping.  That was most
> > > > probably the cause of the slowdown.
> > > >=20
> > > > That leaves only a design point in favour of the contiguous virtual
> > > > mapping.  It makes the implementation more robust and elegant, sinc=
e it
> > > > enables the copy operation to be independent from coloring and thus
> > > > reusable.  This is enough for us to favour this approach.
> > > >=20
> > >=20
> > > To my understanding, the choice is between:
> > >=20
> > > for_each_colored_chunk
> > >      copy_chunk
> > >=20
> > > and
> > >=20
> > > for_each_colored_chunk
> > >      remap_chunk
> > > copy_whole image
> > > drop_mapping
> > >=20
> > > As the first option can be reused for uncolored images as well, I do =
not
> > > really see the value of option 2. Prove me wrong by code ;).
> >=20
> > I see.  I would easily agree with you if we assume to use the
> > `jailhouse_get_colored_offs` (or something similar), but we rather not
> > do so.
> >=20
> > Instead, the `next_colored` function should be favored as the
> > fundamental coloring algorithm implementation, because it is closer to
> > the hardware meaning of coloring, in the sense that it preserves the
> > notion of bits in the address, instead of abstracting it away behind th=
e
> > notion of offsets in the memory space.
>=20
> I disagree here. First, because this abstraction is a benefit - provided =
I
> didn't miss a case.

Abstraction is good only until something meaningful for you is hidden.
Then, it becomes obfuscation.  Coloring is a concept that cannot be
separated from its bitwise nature just because of some additional
hypothesis (contiguous color assignment or contiguous color bits) that
restricts the generality without bringing value.


> And second, because the algorithm avoids the loop for the calculation
> and simplifies the loop for the virtual memory copying or mapping (the
> latter is not implemented yet, so just a claim of me so far).

The loop for calculation is useful when you have to deal with non
contiguous color assignments, but it can be removed, of course.  I guess
that also the other kinds can be removed, but this looks orthogonal to
the chosen approach (next_colored or offset).


> > As a by-product, the implementation is also more flexible and generic,
> > since it could be applied also to different kind of coloring, e.g. to
> > bank coloring.  In these cases, nasty placement of useful bits could
> > make an "offset-oriented" implementation hard to read (and also very
> > difficult to write :-P).  E.g., consider a case where only 12 and 14
> > need to be used for a 4-colors platform configuration.
>=20
> If you can point out concrete platforms/SoCs with such properties, it wou=
ld
> help finding the best solution. I dislike design decisions that are based=
 on
> speculation what could come. Usually, they take costs for "extensibility"=
,
> and the outcome will still have to be adjusted when the real use case com=
es
> along.

I agree with your position against unfounded extensibility arguments,
but it does not apply here.

- I am not speculating about unreal possibilities, I was referring to
  real hardware. The first result I found is Intel i7-860, where:
  - cache coloring is possible on address bits: 12-18;
  - bank coloring on: 13-15,21-22.
  A discussion about bank/cache coloring on such platform is in

    Lei Liu, Z. Cui, Mingjie Xing, Y. Bao, M. Chen and Chengyong Wu, "A
    software memory partition approach for eliminating bank-level
    interference in multicore systems," 2012 21st International
    Conference on Parallel Architectures and Compilation Techniques
    (PACT), Minneapolis, MN, 2012, pp. 367-375.

- Nor the next_colored proposal brings additional costs, since compared
  to the offset implementation
  - it is simpler and more elementary;
  - it has close or equal performance;
  - a tested implementation is ready in v2.


> How did FreeBSB - or what BSD was it? - model coloring?

FreeBSD supports only a simple form of cache coloring -- I would not
consider it as a reference, especially about extensibility beyond cache
coloring.


> Any other reference that may have worked on more that one board?

We tested the proposed solution on Xilinx ZU9 and ZU7, Nvidia TX2, and
NXP i.MX8 QM.  We have tested a very similar implementation logic also
in Xen on Arm v8 (Xilinx ZU9) and x86-64 (Intel i5-5xxx).


Do you have any point in favour of the offset-based alternative
implementation?


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

Good.

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
jailhouse-dev/20200728224145.qj4ljq2zm76ueo32%40carbon.xt3.it.

--7vejka5bsyvirvxe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8gqakACgkQCtn83XWC
Ln6LiQ/9FBGKyfsPSQU8vyabNHbbJL9+7X/hyTlqfbLfuzMzz/fEhuHArgV9qCIk
KT1lhSolnrnG994598shsFmnoSU5N94wfW0l08f1cb6IEA2JiqsEXTdCzK5Y2imM
sbp52PwUMuqo8cCSk9XomaviCsmXD2V/eJ9V8hgd5LPBxEvT+MHtCtgwH953f9X5
23cva82vsOSaE5kufPBrOOHJlZ1HaI4q8iawRB7eTiGFpgXem98S+szngVJXrC+I
lCBOkmdMYod6lu/9QIEZPP8Fz9d/39D6EY3mY9UeMmB3hL3aAUOc/iKqtmf9UYnT
oTaYkuSwdk4+X9aXA8d+T77YKHhg8wdkAIyJvYpYNTp/n8gqZsQD1LDvUyoIbbqA
34OdxG7C+gR9w6z/v8oKo3QAdDHXB32pINzdjvIUctNJOj2yA2v1Zirj85n/yWwu
KNSUAchXa/dd0r5qLGl4iXB5z7tct5TdJT26qE7133/RDTl9b+PpxowRUkKVv1VV
Qb0FdTmz1QWKnRpb0n16AVIzb+IOqpL0ic/HUBflmnbKRl0FGfRf5QyUEoNjTKy4
uqSvGyBUf/lLaauuG6+vGhf71yG+lXxoa6lVCSLJhQhliQddV5grLFbeBEFp5Pb1
NilpW/UlelR5qXeoHXRLwWTfy9skI4m2Xf1YAGICgCpSDfuA2jk=
=EBcS
-----END PGP SIGNATURE-----

--7vejka5bsyvirvxe--
