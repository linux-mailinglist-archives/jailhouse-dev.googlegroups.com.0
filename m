Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBYVEV2KAMGQEJAM5OYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id CD77053113C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 May 2022 15:55:47 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id c16-20020ae9e210000000b006a32c6a3830sf9441929qkc.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 May 2022 06:55:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653314146; cv=pass;
        d=google.com; s=arc-20160816;
        b=CmeXWtpcf224C9QqoMehNNgJdLrx0/pyYhx4L8hM6B7WOye1QbfvpDubLE0I006O+f
         neDbJx3+cAuR3MTCoJf+jbhGzgtGWB+t3+qwdgTLx9lBoziXMRjTT7uBwgH6QcNP1CJZ
         6z1iXUsla4mX4JXLErOVL8cy4zwcwXdp3qE9DW9IKvSUdPu0s/VnML1CrZG1dYe9wGQj
         GgrTgLm6zr+sA/Y/S3gjFvUyM+kfL2QTmbTKTlUj4KXFMdk1H2fmdTS0rV4hZla5AGJI
         cGBPQKSGegVDcCA2MO1IJpWy3U1CTgeUr3YGM+XoOzl01buaEp4Yj1n1cE+n72vGhp0/
         0HxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=OaoHHH7UULEn49ckQGOFBzzbpUlakIaV3HgMWYEZRY4=;
        b=iuUNX0b1L9lax0inyJrdTXWZUxZmeGJaBW3Y5kWnwoWXnsn9VTgtVuQBQY2bq/94Sq
         9ONoKn2CK1J5ub7ttmcRSMtfXyElEIrPUflPXaTDizefa2w47FZxEJPXtD+ZDp3HTnlw
         YNtJ7Yk4nfpFW0Iw5F2hxKc4rk8+2GlPqavqRsumBbloUkuIwRLH8xAl4MqAPKzY/YXa
         3+vn2RQnn8gN4bslFvzrITbe4ZV/iyGlJCjg0l1z25JfoWv5H8tCyfs6yF5i6b65aUsr
         EooLgjZt34oa+4p4YVuH3MW2qh1sh2OEBjEyXFoPLlUru7Nh8AIABwVY+BuQlfUp1Hou
         DKdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ohvatYEm;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b34 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OaoHHH7UULEn49ckQGOFBzzbpUlakIaV3HgMWYEZRY4=;
        b=ipYGle/oo45bX8YZ5EiIdou0YJYVFxxq1EysUvnj/WB64ZpjQkInonPEevsKxDKoFr
         AeCFFDESR89IJj0wkdy9VYA//6nKmsqlmIoVYUV0AVi3SLctdIimkXTAtSqLE3lAOWwU
         e3nnJ3eFkgUHDhIW+ozcUA++3QDj3t7VwLRbO1uH9TapCuWxUWhC2GyIi2rgMSHbChuI
         zGRQnwj7HX78NtJ98mfDTqIbYbcLW+G7WbfqJkw0zsc8f29LkAnz1MtCwNtbCNxASJdl
         +1rPKtXPKIYaogvwWqusD4syCI1gPAzcry3qp1nyqJ8UZXKxaMK7gcjbQL+hUebA5WAS
         4Ydg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OaoHHH7UULEn49ckQGOFBzzbpUlakIaV3HgMWYEZRY4=;
        b=Gt2mPcd37vuGolRDK+c9k8iLphk5+6caDdwWsb3DNaXJxW9wfJaEEfS8SA2z8xnM0m
         9d+Id3UV9nqzOedz0yc4K7mMiiePU2NNEH9meU5skF+tIqCumazBQDs0ws5nNK5vvqAO
         1qGcKl11Hlrj9oYkqI3svjpPGzBBQ9Kzw6SQ5l+bGKzFuzxc5OOGflmhp/kLgmiaSHHn
         FT6jjmebUSA35NP26h/uvSOr/QLAgGIR6jOlLy5Sh5X3qBlASyKzS0kAdLihtI+StCxZ
         xf+nt954pR8KDAB9PP5kDT40Z0kTinNd5Gwna6c7GKp+9sGGYU3mwM/0bvFDaYpJPMrz
         dLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OaoHHH7UULEn49ckQGOFBzzbpUlakIaV3HgMWYEZRY4=;
        b=c5I1VDYqtdsQflMSik1FIKP05UInuAU7jPvbm0f4E0oH8J+pww2EF6Ck7uIOaHpLdG
         f9zz4vZ6YDIBmV5UWcS+FQQy7g4TvMUjItnycpZSN+2aHL6tdZ3QhAYDyoA2dstv6/jl
         4SpCFD0Zp2aC5pdAVZ0tAlDqEFPTisBiIcpKeWjYpR8KwK9ZAGtnAau5NywytiZCsdXi
         JZ+yNS0S+oRsC3chnGcjbRfsZyaG2rIq4O92OTbye3+V4ATG+Lq/ehtEY06lPmpLtXls
         ZYpRYZTWV4w6XFB3s8DqrsP/ckdGS7vizOZ+tngezbml8E3ZSmri3AtxJMsS8y7wLgk7
         vlXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5313cRng3lrPVgCE2Qimlrp/JS74tdaStUvxtYV+s1oja2NJT8Xc
	NAXyuhKMNVnIp72GMRPmEFc=
X-Google-Smtp-Source: ABdhPJyHQ9l0g7XCISUoSjWSMAWB4cs313iNwSnArozWaqoRKij0zFBBxrluvxi+y8Sk4Pszhyjzog==
X-Received: by 2002:a05:620a:1428:b0:6a3:97d9:92cb with SMTP id k8-20020a05620a142800b006a397d992cbmr2707279qkj.543.1653314146754;
        Mon, 23 May 2022 06:55:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1713:b0:2f9:3c48:4fb3 with SMTP id
 h19-20020a05622a171300b002f93c484fb3ls631681qtk.5.gmail; Mon, 23 May 2022
 06:55:45 -0700 (PDT)
X-Received: by 2002:ac8:5d8c:0:b0:2f3:e1cb:5e71 with SMTP id d12-20020ac85d8c000000b002f3e1cb5e71mr16259561qtx.219.1653314145904;
        Mon, 23 May 2022 06:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653314145; cv=none;
        d=google.com; s=arc-20160816;
        b=kokxR4V+gqKPCmhbrnxj1i2w2hE0n6ukZfN2OEHN0uBOY0qrv34rKttsQO1mF1VSs6
         lhCNK8FjknpzSZSKai6clOFKQ0Reuwm7xsKHdQxdkfnKtiNtuVFKRRYlDiocyhedLaEj
         kGtI6BIqenjtWO0+4vfGLm0h6irB1NYWy52+2WeivyY7nZEpeffKOJmyUKOaoPArF8Wk
         zfz1kP5HAxCoA/zUFsYCrGK5sDnzvwu+LovYycKHOHZChDiFeYH0Eh7RcuB/1+xgNRil
         0Gk8FNRiudJ+O6li7DgzrceUWwMo4WZhlAURkQtNUbxrD+GHBz41FR9MUVnkfEF0Clo8
         I06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bC0k/CtVzcJLwSrAEjtp1QmLDVtyVvwNtQKg6tcX8cE=;
        b=X0LTceG63AMxwLouiydx0r6wthT2Nt/vW37ik9kqmASQFv/+W+U18JsqSRq0YXSU3r
         PKfVPp8B6sRMeJqdXa73Ac0wYRnVDYplES+Jf/34XjlibvPrEQzuhZtNNCMDabNUmx3J
         x5z/PdWbBtMbTK+nI7WQPpQb1A+8Gkqj1eKjGawYdV/CeUz1lbdE3HuougOY/e43Kqjj
         YTjy/Kfg8G53u6Y8YOSlF2CAar1Iw1ag8LR8pm98NBbjk2USA3YbZbuaofnE5upyuRbE
         McGRgWm6lFUOLjRt67FWjTtDNLA8S7CUL6FlLAy4zlAdYpI9K23mxnttBaYDSNwlsg4k
         2seQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ohvatYEm;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b34 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com. [2607:f8b0:4864:20::b34])
        by gmr-mx.google.com with ESMTPS id cc17-20020a05622a411100b002f3f4131086si315068qtb.0.2022.05.23.06.55.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 06:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b34 as permitted sender) client-ip=2607:f8b0:4864:20::b34;
Received: by mail-yb1-xb34.google.com with SMTP id z7so4260277ybf.7
        for <jailhouse-dev@googlegroups.com>; Mon, 23 May 2022 06:55:45 -0700 (PDT)
X-Received: by 2002:a25:2cd4:0:b0:64d:6f24:fe6c with SMTP id
 s203-20020a252cd4000000b0064d6f24fe6cmr21699519ybs.182.1653314145560; Mon, 23
 May 2022 06:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com> <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com> <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com> <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com> <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com> <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com> <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com> <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com>
In-Reply-To: <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 23 May 2022 14:55:19 +0100
Message-ID: <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=ohvatYEm;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b34 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi Jan,

On Fri, May 20, 2022 at 7:08 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 19.05.22 15:23, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Thu, May 19, 2022 at 12:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 19.05.22 11:44, Lad, Prabhakar wrote:
> >>> On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
> >>>> lr, thus the second ret will only return to where the first ret jumped
> >>>> to - endless loop. You would have to restore lr (x30) from x17 in
> >>>> arch_entry first:
> >>>>
> >>>> mov x30, x17
> >>>> ret
> >>>>
> >>> That did the trick thanks!
> >>>
> >>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> >>> index a9cabf7f..7b340bd1 100644
> >>> --- a/hypervisor/arch/arm64/entry.S
> >>> +++ b/hypervisor/arch/arm64/entry.S
> >>> @@ -109,6 +109,8 @@ arch_entry:
> >>>         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
> >>>  1:
> >>>         hvc     #0
> >>> +       mov x30, x17
> >>> +       ret
> >>>
> >>>         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
> >>>         b       .       /* we don't expect to return here */
> >>>
> >>>
> >>> With the above diff I do get the below:
> >>>
> >>> [   42.980805] jailhouse: loading out-of-tree module taints kernel.
> >>> Reading configuration set:
> >>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> >>> Overlapping memory regions inside cell: None
> >>> Overlapping memory regions with hypervisor: None
> >>> Missing resource interceptions for architecture arm64: None
> >>> [   46.582588] obcode @arm_dcaches_flush: d53b0024
> >>> [   46.582616] obcode @arm_dcaches_flush: d53b0024
> >>> [   46.611311] The Jailhouse is opening.
> >>>
> >>> So it looks like something to do with the debug console. This has to
> >>> be poked in the dark or any easy way to debug?
> >>
> >> Well, we do not yet know what goes wrong. We do know that we can call
> >> into the hyp take-over stub and register Jailhouse with it. We do not
> >> know if we will then end up in Jailhouse in hyp mode and just lack
> >> console output or if we crash on entry already.
> >>
> > Right agreed.
> >
> >> To move the uart console out of the picture: Did you already check if
> >> the driver you select in the Jailhouse config is actually one that
> >> should support the UART on your board? Next is to double check if poking
> > The UART on this platform is almost identical to
> > JAILHOUSE_CON_TYPE_SCIFA type, but with some differences which I have
> > patched to work on this platform.
> >
> >> registers in the way the Jailhouse driver will do at the addresses you
> >> configured will work: Pull the code into the kernel module or even into
> >> a userspace application with /dev/mem raw register access and try out if
> >> that works in a "safe" environment (without hypervisor mode).
> >>
> > Sure will give that a shot, any pointers on doing this from userspace?
> >
>
> Something like this may help if you do that the first time:
> https://bakhi.github.io/devmem/
>
Thanks for the pointer.
I have tried reading/writing from the hypervisor location and that
goes all OK. To avoid any issue related to debug UART is there any way
I could test this prior to enabling?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vshtRo3Kot2xCVV%3DL%2BkySoP1XkOrc3U8tWXxLeCCb4Ow%40mail.gmail.com.
