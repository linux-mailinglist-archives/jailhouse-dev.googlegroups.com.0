Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBB2VG6WBQMGQE2QDSOFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8632E363F36
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 11:54:51 +0200 (CEST)
Received: by mail-pj1-x103a.google.com with SMTP id b17-20020a17090a5511b029014e3da15071sf15758120pji.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 02:54:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618826090; cv=pass;
        d=google.com; s=arc-20160816;
        b=l0Qk6lLPiDVmOsoH3RcKW8O4yMQknIdafCqaWZGrFIHtF6Fay10gaIF3qSkolmi0hX
         CVztbk0VqnE4os0XoPx1D/ftrexm01BVf5T2/pz5hw2QG9tyxtQ0OfMcdkQ3uxDriiHf
         CdRVQ/yC8ddwWHq54aCbHxnyqlrRPzh3nZ/s3Yr2wiJ31gzDX+KQkBO64rQJvGodtRpJ
         dw4knWPGDdXmo6YMQn/TEkbjYJuju80lKyxNTuJs0e3p/Zp9O9nMU4m+k9AHCdNe/HZb
         20/4LmNHQgmTesCL5s6AL0igK08olxrzGSQjp3/Mo8MOHol53zQH3kvwdvgMOp9enM+A
         QIBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=cafV5qbpTw2AXjkDkgSuovXCRiVwSztj3U/B98Yg75o=;
        b=RdfFdvDVB56zkdoEP65s6S11ixW1/Fc/aCDVeNXto3aMF2biNC/BDq/lNk3cfmayRG
         FG/jIgTGTGNR6iBUl9Q70aPulmuKP+3nte2nYYKhyt9CNTDwdvpjMpvw69jAGivHZqqn
         diwXu9lx8TOYW6KDLXN3PQDzAwbeO9b3jPHafRO3FcmBGeEfkFyeQhMXQdMUqsDDzO90
         mO5lUg4E3PHdOixlP0K9tSjtAcRshCNPbYbHtI5tu25EBzZn8RdmMvH3fHkzsVNe8Rfa
         Be2Jye8/lhqSz1ltz2QNNHc5iw9C0tYXJZGyFfqMMCbuC9PC1PrWHsNWRA14sbbkUAlK
         7nbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WFZiBnto;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::334 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cafV5qbpTw2AXjkDkgSuovXCRiVwSztj3U/B98Yg75o=;
        b=HmqmbrOpmKIfDAO7QVhkycmVLQSC4b6jwGAZQay9FBf3Wj+3jnAXsDjlhWwzQP7TAX
         cmKTba5CFPnly5mO3T2tOhJhrNaNq3uu1MU1qzYxoeUa17CLyqPNIE22lN4w5SitUSuz
         F7BJVol+maTr7nIQZwwiSp3Uf+XsNPISiM5g6rW5sqAQHH5oqS/RQgbb62lKGh2ea+9y
         nOYoB2YdwoXQEwAYynfY7FFj/AoiZsPEBtmHlqX4rEhrjjoUpWIRuDCg8K9smOjL/Igc
         LBqjoUxUqiEdwDxs0RvH6lhHL9IE0rcz4Oph9aF+socXlwtX4xLmU+1PH/9bhl+hDT4B
         Hh6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cafV5qbpTw2AXjkDkgSuovXCRiVwSztj3U/B98Yg75o=;
        b=BXphXDa0u6YMRmDW/nHFhDWQOFTy9vDAebrKvhIxWn8aSoGCKFmblKfyh/btL/QNyP
         I+ENqzLK4VUMndKEgUYs9inD8qOa530plpCBOXc35Oe9VnUgiQvFLYHNKxvaUSlX3iNA
         LksuNyiydlvNv9ExkCBlehJ5rRxHwAiQWuVujiE6K26Q0gKStUCD34b3PVT5hF6ar+70
         Zv3bj0YnZHKzm1FB1+6PdUKxw4/fbtwEKSvr4mSTw/fa3a0kdDmfQkyL/9mDxbSY3MNx
         iPvo4bgsoiBDqBUQVn/Pd3AJECRZaDfoHghtGcSp8IaXdwoYdoIJhGjWfwK2BpJkOuIC
         0NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cafV5qbpTw2AXjkDkgSuovXCRiVwSztj3U/B98Yg75o=;
        b=lAPU08yatRMi565ubABykJU3zg1lwufYp0dW7OOLZmDBjdSpd2xwDksddDOnM/qe86
         UmeZTSHHYYlSG+u/7TJhUjBURRIeamIH5rUtkmUzb8ElU0eYj5SHdiR712l9KGB8ALBh
         wMXZInH6BbmxxjRNl7m/6BJN4QQTDsSwEsZMfLZUmh8cd9kSw2hpLYn5cHlmdwB7xQgr
         yfIqqfQmEb7Zhq6F2N5KUz2/7PoyrNyKFlLrm8fbWwnkpbfZaJPK3JllvQPCc8iJeK3M
         duEbaZr0QsGA+mWtxu+MYsHT5BH30PzkSY8buE2iuH5pljCXJxaHSdjEo+4QbC/Mrx8L
         7cgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Dno494cEap1lB/UX52cxB4y/7aVZjpBC94luyO7WcZuaNivd2
	Y6r5H0d3Bc8nyUkCnHshrh0=
X-Google-Smtp-Source: ABdhPJxmsMBkO1E66WCBzMhItNpnwnV3KjP5V9TPKJx1MYiRYnE5YL+pf2/ZGqqMSadxRwVJbmSV6A==
X-Received: by 2002:a17:902:e886:b029:e7:386b:1b30 with SMTP id w6-20020a170902e886b02900e7386b1b30mr22241490plg.42.1618826090215;
        Mon, 19 Apr 2021 02:54:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:903:22ca:: with SMTP id y10ls1453928plg.8.gmail; Mon, 19
 Apr 2021 02:54:49 -0700 (PDT)
X-Received: by 2002:a17:902:a585:b029:e7:3d46:660d with SMTP id az5-20020a170902a585b02900e73d46660dmr21699596plb.12.1618826089622;
        Mon, 19 Apr 2021 02:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618826089; cv=none;
        d=google.com; s=arc-20160816;
        b=d3dyXWn69jP5dyQdtz0vH/F7mp56XnJHJ0Tm56qCTQX5J16eDL98AQUHJhPJAKp+Dw
         J9RJCYvNp/hJshr1CgaxEAOJgcastzKOnBCZ8Z2aGMEKF1IQK6WOeI419ZEB6sSyKP4A
         Bjksxhi69o7Xiw7RWWZDLEijPHm/FOlj8MZ0wrYEJBTpg4ZOZUtPbgAckS3L8rCTN+/L
         lmt2xoW+fjkylafJr+rd5R5FQi9X3+/74sJdcmOGB8bXCL+G1/uyYDA/1KvaDPWtjwak
         8UqGvh6ALnTmThKGJ/ubaR/LY73rp+Lx3mcRtwmTyn7wmqDSdDJ59dncSTdvVq8wKRqR
         RSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MzPor8Jk8gZ8DgVqVXqX6x+oeftvRtwwwYqGfEKt5/g=;
        b=zlIX2GmCoPrnT12/jFIfZAs3jlmPr9GftBahysCscHZvHeSH4UndYH0hoiCfe4+gJ/
         SX8I+5w8NsTvTy5dEUnvQbn4S7kIyyMtdfiPTQCNCdXyydFBK4oj4XI4D3uayhaU2Erl
         Hlk/Z9xeufTbrKNdOAHt/ehOQZndUmRd+Bke4u+LFbisxqBWH0jyf0p48DJ2oKVHnfFv
         zHQwz8UiEWSqrTDWP9WYWWrya741YM8x8D7fh4Sz1mbav0v8DIDCpnlkR63xXpv/BcqZ
         CQC211L9CWh73dLqk5UyD5DcAw+lFtsiJJ9xsbWavVHxA6Fj4gUZiarY1Oo1ORJHGSnf
         vO+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WFZiBnto;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::334 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com. [2607:f8b0:4864:20::334])
        by gmr-mx.google.com with ESMTPS id i10si386197pjv.1.2021.04.19.02.54.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 02:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::334 as permitted sender) client-ip=2607:f8b0:4864:20::334;
Received: by mail-ot1-x334.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso17949382otm.4
        for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 02:54:49 -0700 (PDT)
X-Received: by 2002:a9d:694a:: with SMTP id p10mr2706228oto.141.1618826088994;
 Mon, 19 Apr 2021 02:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <7b5cf1d5-aef0-41bb-bedc-4350046e53c1n@googlegroups.com>
In-Reply-To: <7b5cf1d5-aef0-41bb-bedc-4350046e53c1n@googlegroups.com>
From: Peng Fan <van.freenix@gmail.com>
Date: Mon, 19 Apr 2021 17:54:36 +0800
Message-ID: <CAEfxd-9smW4cjT3HfX=Cuogd7GDNQjN2aixoMqP5ZNSkJaeAvQ@mail.gmail.com>
Subject: Re: high latency in inmate linux on imx8mm evk
To: liandao <liandao@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000fcdc5d05c050516d"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=WFZiBnto;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::334
 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000fcdc5d05c050516d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

liandao <liandao@gmail.com> =E4=BA=8E2021=E5=B9=B44=E6=9C=8819=E6=97=A5=E5=
=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=884:07=E5=86=99=E9=81=93=EF=BC=9A

> i try jailhouse on NXP IMX8MM LPDDR4 EVK, and i test latency on root and
> inmate.
> most instructions are according i.MX_Linux_Users_Guide.pdf
> (ver:L5.4.70_2.3.0) from NXP.
> i build 3 type linux kernels:
> 1)normal kernel
> 2)kernel with PREEMPT-RT
> 3)kernel with xenomai
> we get the PREEMPT-RT patch and xenomai'Ipipe patch form an blog on i.MX
> Forums/i.MX Processors Knowledge Base.
> these linux config has turn off: CONFIG_CPU_FREQ/CONFIG_CPU_IDLE.
>
> a)when the root is an normal kernel or kernel with PREEMPT-RT, inmate is
> gic-demo.bin,
> do "stress-ng --cpu 4 --io 8 --vm 8 --vm-bytes 8M --fork 4 --udp 4
> --timeout 1h" in root linux
> and within an hourse gic-demo can hit max 14us jitter.
>
> a)when the root is kernel with PREEMPT-RT, inmate is the kernel with
> PREEMPT-RT,
> run "cyclictest -l100000  -p99" in inmate linux,then max latency is about
> 80us
>
> a)when the root is kernel with PREEMPT-RT, inmate is the kernel with
> xenomai,
> run "/usr/xenomai/bin/latency -t 0 -h -g ./202100419_01.log" in inmate
> linux,
> then max latency is about 50us-100us,
> if root linux do nothing, the latency in inmate is better,
> if do "stress-ng --cpu 4 --io 8 --vm 8 --vm-bytes 8M --fork 4 --udp 4
> --timeout 100s" in root linux,
> the latency in inmate can hit 89us.
>
> my question is: while the latency in inmate linux is still so high?what
> impact the inmate linux? how to get better latency in inmate?
> run RTOS(not linux) in inmate?
>

Well. I think it is cache contention and DRAM bandwidth. Mostly it should
be cache contention. Cache color should be a possible solution, but hard to
support DMA.

Regards,
Peng.


> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/7b5cf1d5-aef0-41bb-bedc-4=
350046e53c1n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/7b5cf1d5-aef0-41bb-bedc-=
4350046e53c1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>


--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd-9smW4cjT3HfX%3DCuogd7GDNQjN2aixoMqP5ZNSkJaeAvQ%40mail.=
gmail.com.

--000000000000fcdc5d05c050516d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">liandao &lt;<a href=3D"mailto:liandao=
@gmail.com">liandao@gmail.com</a>&gt; =E4=BA=8E2021=E5=B9=B44=E6=9C=8819=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=884:07=E5=86=99=E9=81=93=EF=BC=9A<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>i try jailh=
ouse on NXP IMX8MM LPDDR4 EVK, and i test latency on root and inmate.</div>=
<div>most instructions are according i.MX_Linux_Users_Guide.pdf (ver:L5.4.7=
0_2.3.0) from NXP.</div><div>i build 3 type linux kernels:</div><div>1)norm=
al kernel</div><div>2)kernel with PREEMPT-RT</div><div>3)kernel with xenoma=
i</div><div>we get the PREEMPT-RT patch and xenomai&#39;Ipipe patch form an=
 blog on i.MX Forums/i.MX Processors Knowledge Base.</div><div>these linux =
config has turn off: CONFIG_CPU_FREQ/CONFIG_CPU_IDLE.</div><div><br></div><=
div>a)when the root is an normal kernel or kernel with PREEMPT-RT, inmate i=
s gic-demo.bin,=C2=A0</div><div>do &quot;stress-ng --cpu 4 --io 8 --vm 8 --=
vm-bytes 8M --fork 4 --udp 4 --timeout 1h&quot; in root linux</div><div>and=
 within an hourse gic-demo can hit max 14us jitter.</div><div><br></div><di=
v>a)when the root is kernel with PREEMPT-RT, inmate is the kernel with PREE=
MPT-RT,=C2=A0</div><div>run &quot;cyclictest -l100000=C2=A0 -p99&quot; in i=
nmate linux,then max latency is about 80us</div><div><br></div><div>a)when =
the root is kernel with PREEMPT-RT, inmate is the kernel with xenomai,=C2=
=A0</div><div>run &quot;/usr/xenomai/bin/latency -t 0 -h -g ./202100419_01.=
log&quot; in inmate linux,</div><div>then max latency is about 50us-100us,<=
/div><div>if root linux do nothing, the latency in inmate is better,</div><=
div>if do &quot;stress-ng --cpu 4 --io 8 --vm 8 --vm-bytes 8M --fork 4 --ud=
p 4 --timeout 100s&quot; in root linux,</div><div>the latency in inmate can=
 hit 89us.</div><div><br></div><div>my question is: while the latency in in=
mate linux is still so high?what impact the inmate linux? how to get better=
 latency in inmate?</div><div>run RTOS(not linux) in inmate?</div></blockqu=
ote><div><br></div><div>Well. I think it is cache contention and DRAM bandw=
idth. Mostly it should be cache contention. Cache color should be a possibl=
e solution, but hard to support DMA.</div><div><br></div><div>Regards,</div=
><div>Peng.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7b5cf1d5-aef0-41bb-bedc-4350046e53c1n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/7b5cf1d5-aef0-41bb-bedc-4350046e5=
3c1n%40googlegroups.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd-9smW4cjT3HfX%3DCuogd7GDNQjN2aixoMqP5ZNSkJae=
AvQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAEfxd-9smW4cjT3HfX%3DCuogd7GDNQjN2aixoMq=
P5ZNSkJaeAvQ%40mail.gmail.com</a>.<br />

--000000000000fcdc5d05c050516d--
