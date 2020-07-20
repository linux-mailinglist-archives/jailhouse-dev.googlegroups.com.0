Return-Path: <jailhouse-dev+bncBCOKB247TIDBBWEL274AKGQEBMU6FBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFFD226922
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 18:27:05 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id 136sf749545lfa.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 09:27:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595262425; cv=pass;
        d=google.com; s=arc-20160816;
        b=qSav6gOv9D++w5vws3fw/4rBLidLjnTEBs9s0qq3CRS045HK3xIWA78QX9mmMpGG5g
         SBXTXQNh20XfSpdwcYQLi8EKPmgQrmbvS5k83hmpGasxU/sf+9RteQJiGGSf3pa8j+L2
         iI40YfY2VOmO7rxFiGHaqICl3yLuMDwCUG6oD6xH9h9+DEolWkmCyY3NR/VRyCiWPsSd
         Tb0n9g8ayYj3Dt8JxY4nzV0h6onN6iHT7qcEzL36hx/3EsaNvpIUrhzWF/0tdz4o9Dth
         IMUUSu7SRH1V+kGkxN3Pu4EGyeNSuSToi/kzJ44C3k7qzuVjJjes5xgDmYqGDCLXDB77
         y8SQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=DRD9DJBVURHtHKvvwtdvjTy9Lw4xX7KJ7xHQWnwSqcM=;
        b=BaQXMXc65xAon8zUpw2NFDPkexwh5LNYaSddWxtLRREqIi6GEytx3ubu4HrI6lJDen
         wMLoCylhhbouL4msKk+UnscRh9LxKARoB6ZhFABz/6KKH4k2iFbjLKDecQ0aXk1ZokuZ
         jwoi8syPXqoP/1xSj2oLxl4+S8a0xjG9BIZs3bwHYsrrjaP5oN/Dlw4dsd4C8FjW3XKe
         9GiOw8EuYGn2JZ/yf/QahV4fwYDunrI5Xr8107SWePh8aZFMfCW09crRA2sT7wsr9AZC
         woHU3UBocP9T/myo4cXhcshZkWAqRSpvejGScBtv0xj/XuPp/h0iC7pL6VUjtFV8Axwp
         oGJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=T31eT4yx;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=DRD9DJBVURHtHKvvwtdvjTy9Lw4xX7KJ7xHQWnwSqcM=;
        b=Cusrr/M3mxMGRU2CR7QOozphbBqXwo4HkKjvPsZbuRKgSp32L928k5sl44T22dRniH
         KRcOya1hY0XFauZoJO2pXGghBkNsZ/m0rfFpxhSzrKtXLsJC/6+9Kxg3KY7AYFNvhBVR
         qRed2j7dmDxnG09M1UDrO6f4rZYfEIYMny3P6TpgbjXFhrfnmyovB1WhBYlR3ZgNY7dr
         lIUvwkSrxxpSlEDWFmb6xj2LZRnOHNIzNm6c4n3bEq/TqHWC17HIUSxNmk0eNxf8J9BD
         WrenUxLDZhPfmipm6jVAi6gXD19RPRJEb1n9GIjHUIHCB6Z3ARGDL5qHyQTGD8a+GbSg
         OXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DRD9DJBVURHtHKvvwtdvjTy9Lw4xX7KJ7xHQWnwSqcM=;
        b=Jy3qPgpPIqw2ADtPdkJfXoZCYMml35eLvGtWTxuSA7fYvm9gBn2xg2GhGADJm0llka
         NFy9GEE6SQXWx5CLODZTUsJQZFku2Of0E/sdYVoevww9JJ8mMrJTzz7ozNcWREn7wRNK
         EIoqm/Qlj2598F4Zfa69GybCAnfbjA6k7Imlk9ms1W8R+LgShhCM3MV+V7ZlEq80FR4G
         ecT0El8GHvLc4Sg7B6Rc11p5iHP8jYaZrMyBrQUUcTxa/wM92vorcHqOE9s1BY0tMxIh
         rK/JrRoO0HtTstMWH3i+OkOl983rEQNuQn94WwJAj31zKhxaUQ6iNs3oHD8s2x6K2VIY
         E3tg==
X-Gm-Message-State: AOAM532mQeNXXM8jxVSdXcJLSrzojtYA7+ah7BK05eFGs+UFW1JgZtKb
	FPKrqqTrfScN1wLDCdhG2gk=
X-Google-Smtp-Source: ABdhPJwxI4C9AFPe/cVDccgkthfkVXDTbbar7w45FK1qx9oytxc3pLEFkOGVOK+AnN8ZEl1+scc9Gg==
X-Received: by 2002:a2e:9a17:: with SMTP id o23mr11789199lji.303.1595262425022;
        Mon, 20 Jul 2020 09:27:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b4e1:: with SMTP id s1ls2765972ljm.1.gmail; Mon, 20 Jul
 2020 09:27:04 -0700 (PDT)
X-Received: by 2002:a2e:868b:: with SMTP id l11mr10914669lji.171.1595262424239;
        Mon, 20 Jul 2020 09:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595262424; cv=none;
        d=google.com; s=arc-20160816;
        b=ScGozSquuDH3NnS9EJTIZxy5RNE5NpYtGfO6yOG5n+0qs7lZuaQOQBNWM99YN9lwtv
         ZA7wfEheKLTG3eZGw16NRjOckp9S/SBcYrvdMxlcvONggWuUGcool8x0R2EF8bpgw65o
         q70GDF5mTde6RqTKIos8nHhE11zfJGXUKRJaOp4ARmPapk7i571s98E9AOqxSiRItyex
         CzQh4bKFIOEturgrY8ifaiFBqB1mNbPyxzj2O9WrqMplsTcNCJrj+uQx23G8ttT0GXyW
         O2xcmEYRil7i9jJx5w9amkT+xlyRq4/xRn4k1A54qWdMXxNQqm3Ua7ySm7okd3yuGTof
         1uhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=uM2ldSFImQwuF6a3HNIUMGyeuKUSG/GuVwqIA2+uq6E=;
        b=VTSXhSGgYwA6Ai6UbvU4FAhn6HUg7m20kci82qxM9Rx19djAW84/vFeumrWC6j5vts
         Zg4ci/xMl2s0zC+pgxmHR/j3KhHxopkPKGAjp8ZM5ANvPIP21IeQbmuSDCVj9Ca/D8uv
         Xxa2SFmDXX/aAGxT6MgUfE/pGTRmAuUuyGRLZOtRmd9915Qy5QOmhl0JF/tDEaFhl1wa
         qvkkiLKIIzoX7X7iIIbnyl2KtctbSU8Fz4Xy3R5CrOxn9jauFRBY0q+/p95NhASb84v3
         r4BU9yqHpVG7/lzZemCcWJMRdqpbJSPWB3WoC70cqvliyDSlySRCw/q25cw0JI6aCuEy
         hamw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=T31eT4yx;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com. [2a00:1450:4864:20::341])
        by gmr-mx.google.com with ESMTPS id z26si566676lfe.5.2020.07.20.09.27.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2020 09:27:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::341 as permitted sender) client-ip=2a00:1450:4864:20::341;
Received: by mail-wm1-x341.google.com with SMTP id f139so114624wmf.5
        for <jailhouse-dev@googlegroups.com>; Mon, 20 Jul 2020 09:27:04 -0700 (PDT)
X-Received: by 2002:a05:600c:2050:: with SMTP id p16mr165993wmg.44.1595262423612;
        Mon, 20 Jul 2020 09:27:03 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id j145sm30142wmj.7.2020.07.20.09.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 09:27:02 -0700 (PDT)
Date: Mon, 20 Jul 2020 18:26:39 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
	tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
	fabio.federici@utrc.utc.com,
	Luca Miccio <206497@studenti.unimore.it>,
	Angelo Ruocco <220530@studenti.unimore.it>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xbmxibdwegyds3p"
Content-Disposition: inline
In-Reply-To: <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=T31eT4yx;       spf=pass
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


--6xbmxibdwegyds3p
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 10:49:55AM +0200, Jan Kiszka wrote:
> On 15.06.20 10:11, Marco Solieri wrote:
> > On Wed, May 27, 2020 at 05:20:05PM +0200, Jan Kiszka wrote:
> >> On 26.05.20 15:24, Marco Solieri wrote:
> >>> On Mon, May 04, 2020 at 08:54:32PM +0200, Jan Kiszka wrote:
> >>>> On 22.04.20 10:51, Jan Kiszka wrote:
> >>>>> On 22.04.20 09:22, Marco Solieri wrote:
> >>>>>> On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
> >>>>>>> On 27.03.19 13:18, Marco Solieri wrote:
> >>>>>>>> Predictability of memory access latency is severely menaced by t=
he
> >>>>>>>> multi-core architectures where the last level of cache (LLC) is
> >>>>>>>> shared, jeopardizing applicability of many Arm platform in real-=
time
> >>>>>>>> critical and mixed-criticality scenarios. Support for cache colo=
ring
> >>>>>>>> is introduced, a transparent software technique allowing
> >>>>>>>> partitioning the LLC to avoid mutual interference between inmate=
s.
> >>>>>>>> [...]
> >>>>>>>
> >>>>>>> Thanks for updating this! I will refresh my caches on the topic a=
nd
> >>>>>>> provide feedback soon (I already have some questions and remarks =
but
> >>>>>>> I'd like to double-check them).
> >>>>>>
> >>>>>> Looking forward to hear from you.
> >>>>>>
> >>>>
> >>>> Done with the deeper review. Overall, the series looks fairly good. =
I see
> >>>> just two bigger open issues:
> >>>>
> >>>>  - inmate loading interface
> >>>>  - more architectural independence
> >>>>
> >>>> But I think those should be solvable.
> >>>
> >>> The major point you raise is that the impact on the hypervisor code s=
ize
> >>> should be minimised -- the inmate loading interface.  We took a while=
 to
> >>> consider and weigh the various alternative designs.
> >>>
> >>> First of all, let us consider the optimal solution in this sense.  Th=
at
> >>> would be placing the whole colouring logic outside the hypervisor, in
> >>> the Linux driver, or in the userspace tools.  No matter how implement=
ed,
> >>> this solution would require, sooner or later, to pass to the hypervis=
or
> >>> a list of memory regions, one per each memory segment to be mapped.
> >>> Now, such list would grow unacceptably quickly, wasting a lot of memo=
ry
> >>> to store it.  Take for instance a Linux inmate, and suppose 128 MiB t=
o
> >>> be its memory reservation requirement.  Now, assume that each
> >>> consecutive fragment is the shortest possible, i.e. page of 4 KiB.  T=
his
> >>> means we need 32 Ki elements, each sizing 16 B, which is 512 KiB in
> >>> total.
> >>>
> >>> This brings us to a design conclusion.  The mere colouring logic -- i=
.e.
> >>> the algorithm which conceptually expands the colour selection within =
a
> >>> memory area into the lengthy list of contiguously-mapped segment
> >>> (next_col) -- must be placed together with the mapping function
> >>> (paging_create).
> >>>
> >>> We believe we can leave everything else outside the hypervisor withou=
t
> >>> much effort.  We can move in the driver:
> >>> - the cache probe function (get_llc_waysize)
> >>> - the initialisation routines (coloring_paging_init and
> >>>   coloring_cell_init).
> >>>
> >>> We believe this is the best compromise.
> >>>
> >>> In this case, a minor issue is also worth to be discussed.  The cell
> >>> load function requires an IPA-contiguous mapping for the memcpy to be
> >>> efficient.  This in turn requires such mapping to be performed by the
> >>> driver (we don't want to add an hypercall, right? ;-)), thus includin=
g a
> >>> second copy of the colouring logic (next_col).  It would be nice,
> >>> perhaps, to have a 'common' section where to place code shared betwee=
n
> >>> hypervisor and the driver.
> >>
> >> Thanks for the explanations. My current feeling is that I need to look
> >> closer into the implementation so that I can argue here on eye level.
> >> Will try to schedule that soon and come back to you!
> >=20
> > Any news about it?  We have time available to follow up for the next
> > month or so.
>=20
> Not yet. Started to look into it but got distracted again. As it is more
> complex than I thought, I need to find some hours of continuous work on
> that. Should be doable before July, though.

We are designing some extensions to the cache colouring feature, namely
the root-cell dynamic coloring and SMMU support.  Willing to implement
it in the next months, it would be quite valuable for us to have some
feedback and agreements about this initial series.


> One feedback I can already provide: Any kind of runtime validation of
> the colored config like color_root_cell_management has to be moved into
> jailhouse-config-check.

Good idea.  We will look into the script soon (hasn't it been merged,
yet, is it?).


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
jailhouse-dev/20200720162639.jsc4o5a7nzinaxwn%40carbon.xt3.it.

--6xbmxibdwegyds3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl8Vxb4ACgkQCtn83XWC
Ln4zvA/9GCa67nb66spA9wDucyFQ5oHJtGFXgcEQULVekvHhAgW02LHQD+2qrtE7
r6Y9XH4EG/WvIrDJgMgse3vcW9BgBUrCTpba/aEuMd+shsF09uT/Sy8FXEFpqACd
KBVkLRX9HOCfAh+QiFkYnOY4s8fwgfD5gmxD1OJQk3PbzdWcFv8aemaumGPDJohu
4sIbn3mhXmVqQ2fQZCWgPVGbDbn9KIGktSUYd3aQkx+pCipOCYm4EuZ5falyR1vg
bhzwfuHDnENf0BHt/eFakV4OQPFHQ3Fo4EVHy560xG1+OUoFXCUK4oiWQ2cDfOO0
z81MLxTxqZnW3mnT0BB86pn7cJR8c04RPfjRtCDSK4gxaxYgnbSFWp9zCO0b9aeJ
3bUzGbs0ewEOG4QB1krhkmrJKhjnldOacJMzndGGfdU9lXYufKzvI50af4CeaTs8
MycklUnBU6dgMTCYD8snb4itPVCYLLDFAp6PomucSXfb18syvoFHd29c0jJCqns7
IiuQbm4vF6rE8nUGdNZ3k+ZC7S6Xa0xdRsg2bs4/Wqm2+03LJGgJD/zwGBw0hb2K
k6IZU/H6W/awHaVE4LryGvBFutWQvnV/gOF7mviyx3R9c6fSHhbwSxravakYawKM
JUO3aM6jfZlLZj9WFu6COx3xq3VYHcWEiyNz6xt2go8HOxUaL7I=
=o0VF
-----END PGP SIGNATURE-----

--6xbmxibdwegyds3p--
