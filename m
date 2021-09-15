Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBJXOQ2FAMGQEVAMK3JQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4E40C255
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Sep 2021 11:04:39 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id f22-20020a631016000000b00269ef9aae08sf1316400pgl.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Sep 2021 02:04:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631696678; cv=pass;
        d=google.com; s=arc-20160816;
        b=o/Z/ibb2qXmDUSu4N4Ji7SENzmU4V5K8fHr0dqNzUXFJ1BOXBwCKEbRobcHGTaS4nj
         eQFNUTlcE+W4Md6ikqvlwJrKyeI1FT9mq3UDwdG+esq6oZLvFUomoTl8pbwpFWd3Bnji
         Wdr9T7is+HRUFKImZD8kbYwqq5QOlfdmmeccsv1ki9CJ7hY1DlTSKx/M/qyaFBe0NhIE
         Qfnkzw41jRvR3PBZ0mC9+P/cg1xyioQiyW9D934D3TAg57eaylDVGwzRVuyRoMsiqXL8
         fRIA3BBt34eIyPKl65rjXlIlWC89TNB0tVq3RU0Oy2d04vr/inrnKYcUUIBe5rUoyj0M
         umcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=7U/XnPEqQogVLd05cnTxUtey9V8QfryG5jJpIsN8wi0=;
        b=alePuZixYlmv0kZwQ+1SKMIY2g5GwaZGoqJqKpE+60FWrJo/jkR9cDWkDG9afwuCRq
         mdQrpI5xPtYJnA6hfYuN95rBLQaBRl3s0l6vtecK1Lvv7h+kaRw2xg3XpF4uWWIO1dRD
         eZ6pQKpXZtZmU3Iyh6G401ysyyBnwj/DUHivEYqoIY1eSE8u8Wqqz1o5DB6mHuOIJgyB
         T0QLrSusIylYrbKhxmQCu51d/J7TPPDbmSB88P+WtP0fkRY56YVdBPRYfUNoyhEZZaSt
         VR1SmsUx406VCp1Jb9oGCME3eCsgI1/D3S1ClwA51cRccBaCGHcB2WRPEylYzVcGCLjc
         jGbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JmnR82EN;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::f44 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7U/XnPEqQogVLd05cnTxUtey9V8QfryG5jJpIsN8wi0=;
        b=MfqOGrH10d6h5XCGALFmrWMSJIOrRHSjhusgxeeaqeBgG5e76GRywaQ7fQE5NKzcFp
         f1H8Vf6s6WCfcJPRPVo5gD4i1SY4LtxJN02SpkCoPFWEc8evyQXSsNMIAwfBR43SHb7F
         Sqyve/AKKXD+o8pp4BYMGxUMEZLoxLuTuGoEWPA68kBnZA3kSiLdPGXBwKgsjWyQG72A
         q97xIqDH1irETIvXNfW9AOtRiKkGmwwK+oxVQEGO+nAzu1CsrSWLUl+GvQG28xbGor8D
         JKuYFo+eDktqIqrINH1XZiFSTpdGyqH4GWDw9jMrm+nq/YWW/3/PO60JB0yNn5cdQW/y
         +zMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7U/XnPEqQogVLd05cnTxUtey9V8QfryG5jJpIsN8wi0=;
        b=hyQrQKwhawygTKdd5CA9QI5lpa7LWJqf4oR9OF1pPFeIrV+QnInMdsYxcaS5yznLUE
         grHaWZvkZWBBcwuwPsd7QwsrA1ktZRH3SZK3v0NlijRsHSI+6ou2FkvHydq2DkIz6E/r
         xMTyYMoDJGOIPrTRld+A6x5GdqjVT3MbhtHvPK/HqFj6wuWkRCd2N13FU+QceBjUaTnH
         hU55deRoVVCrNtNzFMa8nWPYnauKK3LcVVAzassZ3ZcEihuuPK12CUUiVJm6Hv7dbdMj
         HwyXi2DQEn65X8XWG+/v31g9Is7uaiQ5XIU1xbzrnClIJRNZFbF17dTgFuwV1+o0MoNs
         0nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7U/XnPEqQogVLd05cnTxUtey9V8QfryG5jJpIsN8wi0=;
        b=MbHTsSC9ekZ75C/qB686YSkL/GVDwvFfoL229MtY7OmAt75NdkMLGoRbOaplIPtDv9
         EwWsN+QOY2+1ucW+oG4Vs/p6kw5K+blFeOO01PaYCb6xmEaeYkD7Uzv0Kws9vazS0le1
         +DZemQ6qLGp0ON/r401ZZHfwwfZuyfkkyv3RGlYDTZesvHLo/QPBxp0eSSE0VdZvamKB
         Hysrt1R9qpJmZlj9WjhnFvFrKOXIu0DsYsVSZvq/Emz1PjeNe+qjSfL63aC4eVBbnOVL
         b+S8V5Nfrbg+06UdTyjssWuSzW0yTxJqN20mItE7d2APMIugzczEDJs+965hLVR2xEuT
         oGfg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rmQHfHo+ROmAzkvl8qYWsy2BlyGdFCEtk0eniVo50g4bjPgIn
	XZsj3NEtH0GKjYquXXfktwA=
X-Google-Smtp-Source: ABdhPJzjcq+QNScWLvKV06FmKMiu0nSsyw5/e8IBjlR8x7s1rHM5sueFva5vIeuh9O6te7s4p62SGg==
X-Received: by 2002:a17:90b:1804:: with SMTP id lw4mr7329496pjb.234.1631696678352;
        Wed, 15 Sep 2021 02:04:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:41c5:: with SMTP id b5ls817333pgq.11.gmail; Wed, 15 Sep
 2021 02:04:37 -0700 (PDT)
X-Received: by 2002:a62:dd83:0:b029:30f:d69:895f with SMTP id w125-20020a62dd830000b029030f0d69895fmr9479873pff.17.1631696677809;
        Wed, 15 Sep 2021 02:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631696677; cv=none;
        d=google.com; s=arc-20160816;
        b=eW4mEYIp0AwzE8IeLotdjPyLsYaq1VOXUn9mZStGosmpVBg1GllSVXm3YopmmYuPu9
         DaY1zDlA5kvAXp//LI65y6eEeQmJHsYRipflLu0RMsRTFNX/sGwf21sW+3hPkbPGl7c+
         RJDF9rMNsdux1qOXSnm8cp5kZnF53Hc+XM8pzIC44X3U1VMfM1Ane2fzo3pI7+Ul+ebS
         XRxVI/Aguj+BVx+Ux1RH6gCPU0FbtbONtCniYStR3Z4mm9h9cjaHt9jr2dPa3lEqAGeI
         jeEEbyZwxWqghCLqo+/MHrNgLEzdGCqWzUYvd5kdfBi7jKO0zMMWyWwgJaul3PO2rhWv
         55mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E50icc8qJcNZC5JOzM9tqszYwGAS5gLbHbWdBlWayN0=;
        b=dFDEmYyVJ2hlirN0SBmWEv7b0zGVnHQ0OZgOkH2TcJq1bpzz8cSmzJxGOTXhlqx24i
         xodgcUNufAVr8IlsJ9wzcf0cA69/6qTsz0U80tGnV1L62Csmq+LWHgnqpn9mXxkbNwQv
         nCnsUKTTcot7dpQixm5SqutjMHp8ET3Es3Cby/XQLmslRiXC3NMl9o6GA/kEWYLIfxOO
         2yjG9thdNkcXUkT5tnah3ymQI76JHg5pyM+cmIIGjSRLPQdHSK26655wzxXEtmJQ1Gfd
         wCKiD1TH2uFY8QyVwoQTVEWdvzc+2diorR4s0wuD5Os98vGT8jIklj28t4Rx0JIGg1mC
         bfiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JmnR82EN;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::f44 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com. [2607:f8b0:4864:20::f44])
        by gmr-mx.google.com with ESMTPS id t7si121365pjf.1.2021.09.15.02.04.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 02:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::f44 as permitted sender) client-ip=2607:f8b0:4864:20::f44;
Received: by mail-qv1-xf44.google.com with SMTP id jo30so1455454qvb.3
        for <jailhouse-dev@googlegroups.com>; Wed, 15 Sep 2021 02:04:37 -0700 (PDT)
X-Received: by 2002:a0c:d989:: with SMTP id y9mr9678835qvj.67.1631696677095;
 Wed, 15 Sep 2021 02:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <CABSBigSdOnywGHkoVUkN599HZOu8g7XYiRLo=_QVRbr1XsqL_g@mail.gmail.com>
 <184b52e1-2ebe-6b4d-39e4-d7861f3001cc@siemens.com>
In-Reply-To: <184b52e1-2ebe-6b4d-39e4-d7861f3001cc@siemens.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Wed, 15 Sep 2021 17:04:26 +0800
Message-ID: <CABSBigTG0Z5daX_gsGmUUYorpaFB8Q3x-rVuTOpaEhOSv-JryA@mail.gmail.com>
Subject: Re: why not unmap the address after paging_create()
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=JmnR82EN;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::f44
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
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

Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2021=E5=B9=B49=E6=9C=8810=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On 07.09.21 15:39, Dongjiu Geng wrote:
> > Hi,
> >        sorry to disturb you,  I have a question to consult  with you,
> > why does Jailhouse not call paging_destroy() to unmap the address when
> > it finishes accessing the physical address?  as shown in [1] that
> > handing mmio subpage access.
> > I think it is better to unmap the address after finishing MMIO access.
> >
> > [1]:
> > static enum mmio_result mmio_handle_subpage(void *arg, struct mmio_acce=
ss *mmio)
> > {
> >        ........
> >         err =3D paging_create(&this_cpu_data()->pg_structs, page_phys, =
PAGE_SIZE,
> >                             TEMPORARY_MAPPING_BASE,
> >                             PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
> >                             PAGING_NON_COHERENT | PAGING_NO_HUGE);
> >         if (err)
> >                 goto invalid_access;
> >         ....................
> >         return MMIO_HANDLED;
> >
> > invalid_access:
> >         panic_printk("FATAL: Invalid MMIO %s, address: %lx, size: %x\n"=
,
> >                      mmio->is_write ? "write" : "read",
> >                      (unsigned long)mem->phys_start + mmio->address,
> >                      mmio->size);
> >         return MMIO_ERROR;
> > }
> >
>
> We never unmap those CPU-local temporary mappings, we only overwrite
> them as needed. Theoretically, we could invalidate the mapping after
> use, but that would also require related TLB invalidation and would add
> to the overhead. Without a significant gain on robustness, this step is
> not really desirable. It's always a trade-off...

Understand it now, thanks very much for your explaination and reply.

>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigTG0Z5daX_gsGmUUYorpaFB8Q3x-rVuTOpaEhOSv-JryA%40mail.gm=
ail.com.
