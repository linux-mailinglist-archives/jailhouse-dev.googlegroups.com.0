Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBCUBWKZAMGQE3AIYEAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F5F8CAD12
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2024 13:07:56 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id 38308e7fff4ca-2e3003fae2dsf77398301fa.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2024 04:07:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1716289675; cv=pass;
        d=google.com; s=arc-20160816;
        b=cJq5R65u5EeVyeMKMSqG5+xqnJaAXaEN+mhF768x45o1d4ij4Wl+Lv2JLpk5e7qO36
         bzYo69choXJRPxCQxty38PthEWtvXL3+CV9d5EXsCUREZU1CpFTGfI/GvyZ063kY0IFP
         kRIOn7W4M8FOMvbZLuOCmM2LIaCmpj4FLNDdic6g/ewJkblxf18ZVxQ+PAtePFH5Hels
         X1QU1yOcRIBNGp/zCwp4y01RbsuO77Ad76p789gYvnyiQYhhj9YUcDkGahTu/V9OHTMe
         e5j3HdX2OUnJjmt4+2no1OZtJNyfVkVMhBCfLRoChlksWyJjVURB117fzJXfsyaIzab6
         OV/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=2J7QiNFmKvE3BiYITfJJKpUtbOP/yZz3wBQZxCzTveg=;
        fh=FKpVrghB8M3vG45Qjt2LkD4HV3qVB+IIz1vzq9ZUorg=;
        b=wOHqexH7J0XsU4+B9iiYyvE869LK629FH+7VvAd9L7mSsdVnZvkcpfmKdIXgBNBHgF
         6MQo/4kY0AOB6YqJ0tImxw5EB5TRvku8iYz5EbRLMdzngIpVYJ338b11GbA9rsenP5F5
         qzvDC44F3SkYODPoPYWrVqlo4p9/BmsYGUDPYzS5yni2nbPoa+Jl09f3Ypb8JY6R/ZYT
         xf92cZ6pbq6XPZjNuszXKxsIAfsMzec8X8D4EOXGTffS3DqQgn/tLkrDzvanYyUJ8scC
         by1FGhcvgC4K17Jrv3Mj24aY9ntrRzzMOFv1yQLbcHfkXodnGG9HpaxSK69qqLQuGo2m
         yRHQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=sIK+eLog;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1716289675; x=1716894475; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2J7QiNFmKvE3BiYITfJJKpUtbOP/yZz3wBQZxCzTveg=;
        b=WoghT613a+usvQ3HGCU/k/tW3qJwTvydbYRmm1EkI5nrNxav+Fj98jUaBBSNtONugx
         scgBq9DUe6DpYUguSNbYPCqlpyHyGfO7Zp3coXTQmSAudS3zWyZ3+VmJlElcynU60O3X
         8gCpfucJhlRPM1Qqv+RrDiAnPnwUl6MCD/OHO6iMQ2u11Xv3zZpmatmNorlLNt9NKdIk
         nVTmO9q1wqHhap5/Ul+d7XxHDG/0ts1u3G6Oc8qgySaSNFf8fam7IaPqv65q6ZvTOl7B
         nMuVoObEfXg5DTbbunyjxEWrLN3Luqd7ZaODX9O/OgwoFBXzmHt6C5pmKZ/E02nng+fa
         OrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716289675; x=1716894475;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2J7QiNFmKvE3BiYITfJJKpUtbOP/yZz3wBQZxCzTveg=;
        b=R2RF3oU3DpuD5s/12IEirLCLSnTiAlKA6M1wcC6NSvlBlb2wTCcmvlH22WPyfOn/RI
         UoZ5uwQaAwfi+DdZ8JFGd2RXtrnl8Ti5W0R4CqpjBOlhtM7f0ztRVcpnGZ1zxOL3N5/C
         jd79+F+tmE4KSLD774so8FttM3qmdmzW5OZSs7AUn2yaJ+MHQ9haar9eqUhzYAJSD8zT
         BU7ilKmhj2TdhLxbk6ejPiwUOU1CIDE7q0L0J157mVcoTLJ19RtoMxH02m25cjH/Lz16
         zDxSCi23K9RHUvI6KGKfKWUg0zQnT3lpJXiOAa2XUtto4VVNetbkJ5LPE3AimJZlX3QR
         /0uw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCVimiHROQfhfJlqhoIzAINwDUfN8F8Alm/nyOU+iGmvg3EWVjxE8VYhHFzpwxtnZJWI2D3zix4awD/AznpntlrcwQfC/qNJL2FX9ak=
X-Gm-Message-State: AOJu0YxHfAm3ZeZqT7+9hK3Tes3ToqMlJ2SMuOaIuPtdFOyMRVBWG8iy
	qizpxCgmuVevoauQ7lMVyscZT/BCYDTtMGATA8hjoY8kTYMunK5S
X-Google-Smtp-Source: AGHT+IFgsRqrFrZF80hDiyp5f2u/Bj1QhxkmMg9iO9kDWkj4HHFMse+RgkTQkDpU7Q60h2st0SPn7w==
X-Received: by 2002:a2e:960f:0:b0:2df:b7cf:9607 with SMTP id 38308e7fff4ca-2e51ff4d030mr221892841fa.22.1716289675142;
        Tue, 21 May 2024 04:07:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9093:0:b0:2e0:563e:54f7 with SMTP id 38308e7fff4ca-2e4b6e44bbbls4999381fa.1.-pod-prod-07-eu;
 Tue, 21 May 2024 04:07:52 -0700 (PDT)
X-Received: by 2002:a2e:9496:0:b0:2e6:dd18:ac29 with SMTP id 38308e7fff4ca-2e6dd18addamr138736091fa.20.1716289671647;
        Tue, 21 May 2024 04:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716289671; cv=none;
        d=google.com; s=arc-20160816;
        b=Ysw6grksNC7a/2zzp68CGfI9+02fgg066Os/Spnq67fJhlNi77aIgHKhRqWQfiPzUo
         v1k5eb6jET7sH1UufERQ/uYqigOv8rpVNt5CiIn9qwgX9xcCAcL04UtH8GEmc7FiMJio
         O7GyNXemtadIw9axvR0ezuoI9RAjs+fD0sE3eLv6OzPutfBeJhRtoU3Lra7rKCJSt2AF
         7SFZQQzkdpy70CnwRNUdwwrk/eXjBd4UUe1tZuPU8DEngE9llQ5jJD+WM/Y1zEMGoQxi
         EYgQifJgoxvQbuP8U/srJQUz84vNQJR06T0K0WFxLlBP+IMskimBYQfSOJfBATs3mfvd
         oKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=el/qNDHQ6csyIdBXnBk8E0+IoL1eg0a9EZFDZucEY9g=;
        fh=ojbGzYkUnsKSceBWiJLicxP+3aT9fm+GqlTR/JKzW0E=;
        b=A0snmhoTES1F/xxni6HudcYb3MirkiUZnWDPUU0g5hgzWdLbrL3Vt6sFYNgSUrSfRr
         ZBuegXSJbjuHT+kNOFb0I043uBMbP3kxxSkgU/vm5YYUzl3fzSFvQJS+lSmgsMTDMdm5
         fwnpazu48FO3mW4wVWLQsNJoTK+t0mllxyS6cLmV0GrcJCAczXBVKAdVXLky3m/y9/Mw
         6iuYtzRh2ASjN+ROA7xQpjB/JhowElqqFQd+dn8uL44CnQL/UCWseBRJMluVctGRazl7
         QizUBy/tTVhASBRAOFfvwww+Lk+erzS26mhamLl0FQPdPSsPgwIjn5sB2Od6+5b5e5pJ
         Zopg==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=sIK+eLog;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [194.95.233.60])
        by gmr-mx.google.com with ESMTPS id ffacd0b85a97d-3502b8a393csi775426f8f.2.2024.05.21.04.07.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) client-ip=194.95.233.60;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [IPv6:2001:638:a01:1096::13])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id A8AD82E01A2;
	Tue, 21 May 2024 13:07:50 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4VkBVZ2pfnzyJV;
	Tue, 21 May 2024 13:07:50 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 May
 2024 13:07:50 +0200
Message-ID: <81cdbced-ce98-4479-99b0-9774d9bf5f38@oth-regensburg.de>
Date: Tue, 21 May 2024 13:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: Direct Interrupt Injection for x86
To: Syed Aftab Rashid <saftab.rashid@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <1e39fb3a-f017-480d-aef7-2522a4735df0n@googlegroups.com>
 <3c397a1f-0ad9-46c9-a59a-021691b2b77c@oth-regensburg.de>
 <CAJtpjXjtf3vv-AAyXPQgt7P67r304skMUsmL+cusvkPNVS_LiA@mail.gmail.com>
 <72441d4a-85fa-4fb2-9fcb-7495852ff564@oth-regensburg.de>
 <CAJtpjXj7=La=WUJJ9BgY6K7OYVCoBEBwkxq9hDtA5+6De2mYEg@mail.gmail.com>
 <02e40eed-4a63-40c6-b103-2433964ca130@oth-regensburg.de>
 <CAJtpjXggv_tL59_Uh3oS0bAiJPGMoreUdozU6qkWtAqdg5j8VA@mail.gmail.com>
 <dc8df30b-6a23-4954-a0de-fb2077074e23@oth-regensburg.de>
 <CAJtpjXjN3MfvfJhGf8k=Dx08XoVx--bAkKqgOVDN2Jqz_OBR9w@mail.gmail.com>
 <d30a9764-585f-4189-9f0c-033ddc2e1e55@oth-regensburg.de>
 <CAJtpjXj2vfPc8RP1QzgHHato+y_qW4-k8xrSDjur2KJkcx_BGw@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Language: en-US
In-Reply-To: <CAJtpjXj2vfPc8RP1QzgHHato+y_qW4-k8xrSDjur2KJkcx_BGw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=sIK+eLog;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Syed,

On 14/05/2024 15:37, Syed Aftab Rashid wrote:
> Thanks for the response Ralf,
>=20
> I came across a paper that compares the performance of a few static=20
> partitioning hypervisors including Jailhouse. Probably, you are already=
=20
> aware of it, the paper is available here.=20
> https://arxiv.org/pdf/2303.11186 <https://arxiv.org/pdf/2303.11186>.

Yes, the paper from the Portuguese colleagues.

>=20
> One interesting thing I noticed is that for ARM with direct interrupt=20
> injection enabled, the interrupt latency for Jailhouse is around ~200ns=
=20
> (please see the attached image). However, on my x86 system I am getting=
=20

Yes, and in the above case, jailhouse and bao performs exactly the same,=20
as they use the same hardware mechanisms.

> an average latency of ~800ns (from the APIC demo example). I think the=20
> APIC example is also doing the same thing as was done for the experiment=
=20
> in the figure. Do you have any idea why there is such a difference=20
> between the values for both cases? is it architecture specific?

As we see no XApic traps in your case: Yes, it must have to do something=20
with /the rest/ of the hardware resp. architecture.

At least we can say, it's not the interrupt delivery system.

What remains? Lots of other architectural specifics, such as:
   - Cache configuration(s)
   - CPU Frequency scaling
   - Power saving mechanisms

If you see lower latencies on your bare-metal configuration, I'd suggest=20
do investigate how the bare-metal application tunes and sets up the system.

   Ralf

>=20
> On Fri, May 3, 2024 at 5:31=E2=80=AFPM Ralf Ramsauer=20
> <ralf.ramsauer@oth-regensburg.de=20
> <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>=20
>     Hi,
>=20
>     On 02/05/2024 15:45, Syed Aftab Rashid wrote:
>=20
>     [snip]
>=20
>      >=C2=A0 =C2=A0 =C2=A0 > I just wanted to understand what is the best=
 possible
>     jitter that
>      >=C2=A0 =C2=A0 =C2=A0I can
>      >=C2=A0 =C2=A0 =C2=A0 > get with Jailhouse. We are working on a proj=
ect that needs
>     cycle
>      >=C2=A0 =C2=A0 =C2=A0times
>      >=C2=A0 =C2=A0 =C2=A0 > between 1-2=C2=A0 microseconds. The bare met=
al implementation of a
>      >=C2=A0 =C2=A0 =C2=A0similar
>      >=C2=A0 =C2=A0 =C2=A0 > application results in a much lower jitter ~=
50ns.
>      >
>      >=C2=A0 =C2=A0 =C2=A0So the application does structurally the same l=
ike apic-demo?
>      >=C2=A0 =C2=A0 =C2=A0(i.e., full IRQ arrival and dispatching, "compu=
tational task"
>     (i.e.,
>      >=C2=A0 =C2=A0 =C2=A0calculating jitter), return). 50ns are ~100 TSC=
 cycles =E2=80=93
>     athletic.
>      >
>      >=C2=A0 =C2=A0 =C2=A0I really doubt those latencies are achievable w=
ith IRQs. With
>     active
>      >=C2=A0 =C2=A0 =C2=A0waiting for events (i.e., active polling for in=
terruption) -
>     maybe.
>      >
>      >
>      > Yes, it is a similar application implemented in bare metal code
>     directly
>      > on the hardware. The jitter is even smaller with the max being 30n=
s.
>=20
>     Interesting. W/o having the possibility to have a close look at this
>     issue, I'd say that this comes from the additional need of hardware
>     lookups through IRQ rerouting tables. I cannot say.
>=20
>     [snip]
>=20
>      >=C2=A0 =C2=A0 =C2=A0 > apic-demo doesn't seem to have much impact o=
n the jitter.
>     How is
>      >=C2=A0 =C2=A0 =C2=A0cache
>      >=C2=A0 =C2=A0 =C2=A0 > allocated under Jailhouse house? What does a=
 cache
>     allocation of
>      >=C2=A0 =C2=A0 =C2=A0size 2
>      >=C2=A0 =C2=A0 =C2=A0 > employ?
>      >
>      >=C2=A0 =C2=A0 =C2=A0Cache allocation is only supported on Intel X86=
, where we
>     have CAT,
>      >=C2=A0 =C2=A0 =C2=A0cache allocation technology.
>      >
>      >=C2=A0 =C2=A0 =C2=A0I don't know precise details of cat (would have=
 to look them up),
>      >=C2=A0 =C2=A0 =C2=A0but as
>      >=C2=A0 =C2=A0 =C2=A0far as I remember, assigning a size of 2 to a n=
on-root-cell
>     means that
>      >=C2=A0 =C2=A0 =C2=A02MiB of L3$ are exclusively assigned to the non=
-root cell.
>     (Look at the
>      >=C2=A0 =C2=A0 =C2=A0code, I'm not 100% sure).
>      >
>      >=C2=A0 =C2=A0 =C2=A0Why do we do that? Neighbouring noise from othe=
r cells.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Just like the non-root cell might "disturb" its=
elf, it's also
>     possible
>      >=C2=A0 =C2=A0 =C2=A0that Linux, running aside of the non-root cell =
disturbes it:
>     Imagine
>      >=C2=A0 =C2=A0 =C2=A0Linux those heavy number crunching while the no=
n-root cell
>     waits for an
>      >=C2=A0 =C2=A0 =C2=A0IRQ. In that case, Linux will mess up caches of=
 the non-root
>     cell.
>      >
>      >=C2=A0 =C2=A0 =C2=A0CAT prevents full cache pollution by ensuring t=
hat there is
>     always a
>      >=C2=A0 =C2=A0 =C2=A0dedicated, but limited, amount of L3$ for the n=
on-root cell.
>      >
>      >
>      > Thanks for the explanation, I understand the idea of cache
>     pollution. It
>      > is just that I don't see much impact with or without cache
>     pollution on
>      > the values I get for the jitter. Ideally, the jitter should be
>     higher if
>      > I enable cache pollution and lower when I disable it. But, so far
>     I am
>      > not able to see that.
>      >
>      > Also, another question regarding direct interrupt injection, as
>     we saw
>      > that it is enabled by default. Can you tell me how can I disable i=
t?
>      > Again, this is just to see how it will impact the jitter if we hav=
e
>      > direct interrupt injection disabled.
>=20
>     There's no actual support for disabling this, it's used when being
>     available. When Jailhouse tries to query the capability of IRQ
>     remapping
>     support during startup, you will have to mask out the bits that show
>     support for it. I guess that should work.
>=20
>      =C2=A0 =C2=A0Ralf
>=20
>=20
>=20
> --=20
> Best Regards,
> Syed Aftab Rashid

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/81cdbced-ce98-4479-99b0-9774d9bf5f38%40oth-regensburg.de.
