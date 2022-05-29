Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBUE7Z2KAMGQEV7KVWEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103b.google.com (mail-pj1-x103b.google.com [IPv6:2607:f8b0:4864:20::103b])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A8537183
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 17:22:58 +0200 (CEST)
Received: by mail-pj1-x103b.google.com with SMTP id e1-20020a17090a118100b001df53dfd969sf4841570pja.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 08:22:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653837777; cv=pass;
        d=google.com; s=arc-20160816;
        b=UFCPxx/iqrdZfx287P5/kA8UrOW8OlHHEI2xsA15XOISsIDq+8CYJTO1ccZg7LRFlb
         T7zlsMnibKeiW+uASwJ2A931+tJpdlJ1ZAa3N63f/yp+qNgA+Sx1CqlvfGjpw5vis7hS
         mIFJKLSleUsfzs6cj661RXWa/tUoYoA/kUnzjX8nBA4+mJI2Qjwd2odaSoqrEmw5rqJ9
         KsesMtjvk1mg/S6jG5yPXq/K7+QIAjuXGUZXOHXB9NSEL1S6YxgXszPrzUldt0tc4Ozp
         6swc8gF/YGuKctdZsY7z5p2BMM+tS908kzE7gdo2AgfFr1Cu5mLHvWE1dcqpf0mGSukc
         3nKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=NA9bBZDoUU+iz2CudDzOs3AT7hU8qxTN5/twmNgCDS4=;
        b=HmRp9jCC6n36LF8tjrVV0W84NFw3Yc9g2KAjYB9kCdjyFSUYAkkzcJG/dOxTrAsNTG
         yImm2Lpmdw9xaOd302rrVih4Mt+Z5QkEwKQ4so4eOAefC0/L5sepLDg8BNyi4Ie0Dtgs
         egO8OUJnAPICo5kHDYHELQIcD8NsepFKYmFJGiMgdjStAkktZbJdTL16t1FflMDTsDuZ
         /79kBt+qz8R91VgZ2eBWojECkBUFwjXNj9+hoO1fxGG501/8iEr/qXp+10XDalHIMDG7
         OEP/ujPipsZjtmy4M+L3mP7WrMAUNxovIsZ7OK+WlaAjU+WC1bFoVmvhsFYsRDbPdvqM
         KysA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=h7ixrFbD;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2f as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NA9bBZDoUU+iz2CudDzOs3AT7hU8qxTN5/twmNgCDS4=;
        b=mxvn5TwheaI6HnivhYZICc+NZFdR2DXcbAKs6NC/78t4e1xWVVDW1ewa/+b9GdsJOY
         EQ3EbwahPVwEoggFQ9nUJjxoFb55E7mc4UFG/3cC1hOqlMjSWmrYIR+t71NgyYVADQ5U
         M5/XHF+yn/AVhgoQzhT2MrSN9U824hlXILaA5aW0tTctuPfsLbPR/af41yy/5qjKtc2M
         nhH8JKd7RtRbjCp2LhZg/9dACZ3Almjp8+4ktt55ZimBcFFFdrJ5l1xGKocADJnmiTyn
         WYn2hoop8r63YE+jXyigx5uAyRqvEsfgBOAYIZgeNV383AA4iS6xMbqv+T3QswVlr31e
         /srw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NA9bBZDoUU+iz2CudDzOs3AT7hU8qxTN5/twmNgCDS4=;
        b=gr7vEHobVN6QxLa4VGwmboRQWg02hzxnR9fASrAO+9Bd2mQOUaB8QzZbgqj9N1qXpb
         8CodUg2jtnEOL4SSX+6Hx+PefdMpAJ3w5XN7QzbStuc6zZXmBNZIPi2j5GO+YRKOu3EX
         wXl5bYoWGRWnMxX+WCdj1yPIhC7vTw39HfA+kTreg8Jl8XE5nI2E7D/GpwFRzy/E5541
         vUkSnQmPlxONTD8VFwm10xQsTsxJVOadyDEZfUihMWZqTOxtgOQNNBZ8x297rYAcMlTk
         gG4Rkx65lJ9NHncp3cZrx0cDbGhF8LlWvoz63SED6PJPgzBzMJeuZOqurrlh2X1KgC2d
         W39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NA9bBZDoUU+iz2CudDzOs3AT7hU8qxTN5/twmNgCDS4=;
        b=XRSvcFqZenbKXbTipcmJAAk3fAwqF2BWxGSNPLT8j8cz0xBnb93ddpYX/Xv3/dA2+e
         E5F3DBZsFSOL95T6AYzEQx1wJ/1q3ikwmDRRrSgJY0sSGTSSalciX/QiO0ZNZ2N3q3Or
         U+657CjMYRYhlhxzy+nOL3FQV9pus9xgwHsGdWaw3yG0DPwAn/Kuv4qkFtjuuKwzljk8
         2mbHdwvKNslyjj9IBJvz95UOLRP7Ek2+ipGix4zguBBrO+pqChccxEU59XclFl57nJGX
         DSTQxCjR87HCRuy2p70IK/wD5KED9+KUmjxbIdx6YcFRkvONaWtkQi31XzjPa9dOubjU
         9maw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nnAHOWMuXAviJCyOJpzMS0xZiRU1ACYBacetLU+mugqso0Ifx
	NRFDwNEFOCvMEb+RrmPuM9g=
X-Google-Smtp-Source: ABdhPJyM1Ih9Dr90wPbi2wDZ8mC0GjP4qMNHVq3Jh9A9tQ/f4KWUfseu3+Q7CNa8zwtGl2rZeEFuLw==
X-Received: by 2002:aa7:9412:0:b0:51b:42f4:b40a with SMTP id x18-20020aa79412000000b0051b42f4b40amr3619714pfo.21.1653837776796;
        Sun, 29 May 2022 08:22:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:aa95:b0:15e:9fdb:4846 with SMTP id
 d21-20020a170902aa9500b0015e9fdb4846ls20778570plr.1.gmail; Sun, 29 May 2022
 08:22:55 -0700 (PDT)
X-Received: by 2002:a17:902:f605:b0:14d:bd53:e2cd with SMTP id n5-20020a170902f60500b0014dbd53e2cdmr51492129plg.164.1653837775596;
        Sun, 29 May 2022 08:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653837775; cv=none;
        d=google.com; s=arc-20160816;
        b=rPi5ge+7kJmPC/QZqdg63oFgaTrppaQ6sW9LZ6BtvuFnFuU9v+lVcNtTKls+ShulHF
         Rtxm8YbswyOoPcgOTTUVrkjnzvfR5Zh0/1XW92SxO5D/StNx2NSlcAwYDYed8ZdA1g05
         C6OWsYqccdcvwRFbnzN3rkjLP6fjid1wGSL91gd0uuxdQmQxsHwUWRkys5DEY58bOdjG
         QeN3vEirRs6FZ1fS6W/NYXlX2COD11+TE3QusD+CVQ5Z7lW6xAJ+f4oGLqdvmRxC/ijw
         7jP6gCXWT8fx3Lys+fSIIAHZQyMONoLicxE6DqzNDMyg7H3RqJLkdhguaoLGeaCZWpWe
         RCxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CCD4tK+jSWCa0Ao9aDZWqo4BrVQeDuxbxrWiV0+NN2I=;
        b=NaPVlqmAkaQ9IQBH2Htf70glyV6UkBMuVdd9eKNwCO54A3XZKlKLxjpBziUi9z1yqn
         MHRjm22DOj/BxpARg0Jy2gSr7clfjDvFxe7rdCDkhWUrCPBDdxZVslcwHwwKuWYCNAxI
         voOPQbellXKnnV92VM4zddZIR0FDVOWL8w0TEFBz9gnfQvOIKk/5FcOmq13uJmXBcs+R
         Nf1wUxyRrjw8qc6/NCNBdplglKgHBGHH6W4YKcYs+BpbStgBBe0NwjcBh6pT/cx9nQRZ
         fu4mRDPuTKSVYzdJVFtfITGjTyUlWaJOODYjmNHpIiPKGKf8yspOJGRER/Xhlg4JwDeP
         OEww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=h7ixrFbD;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2f as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com. [2607:f8b0:4864:20::b2f])
        by gmr-mx.google.com with ESMTPS id x23-20020a056a000bd700b0050d44c10b11si371566pfu.3.2022.05.29.08.22.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 08:22:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2f as permitted sender) client-ip=2607:f8b0:4864:20::b2f;
Received: by mail-yb1-xb2f.google.com with SMTP id e184so5920560ybf.8
        for <jailhouse-dev@googlegroups.com>; Sun, 29 May 2022 08:22:55 -0700 (PDT)
X-Received: by 2002:a5b:246:0:b0:619:5651:3907 with SMTP id
 g6-20020a5b0246000000b0061956513907mr50218629ybp.190.1653837774945; Sun, 29
 May 2022 08:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com> <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com> <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com> <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
 <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com>
 <5172e723-49ce-a870-2066-d22f44115da3@siemens.com> <CA+V-a8vxVLxV8iog0-JUH-Bd4nnCj5ELYkd_SkDDmPuKOAiJKg@mail.gmail.com>
 <dd337a1c-d678-7c7b-d371-f8bd2b019c28@web.de> <CA+V-a8uMOW2PopUbMhaOmCs-RZWqzOJcC3zXOToF2pWSs_=O5w@mail.gmail.com>
 <1a407933-180e-48fa-760c-1c90e159eb2f@web.de> <CA+V-a8sFJc+uFp+n6G+fUFNX1u6oDwbG4Ge=+2yrhoh8FQ-UfQ@mail.gmail.com>
 <69a0ae1d-1ee9-e99b-f190-d534ce86c227@web.de> <CA+V-a8vhKb7ic998w275ajCjXSC0QmsnutAkDK-csJmP9DYzrg@mail.gmail.com>
 <3ed840dd-2aa5-b578-617b-cad9e8fd6667@web.de>
In-Reply-To: <3ed840dd-2aa5-b578-617b-cad9e8fd6667@web.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 29 May 2022 16:22:28 +0100
Message-ID: <CA+V-a8vQjdVghdJkcz_O9dOtqKFkndDxk5tY-5Z-ZaxQH-YD8g@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=h7ixrFbD;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b2f as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Sun, May 29, 2022 at 4:01 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>
> On 29.05.22 16:44, Lad, Prabhakar wrote:
> > Thanks, after updating gicv_base to 0xf106f000 I get an "forbidden
> > access" error, looking at the address it belongs to ethernet
> > "e6800304" and this is configured in the memory regions
> >
> >         /* AVB */ {
> >             .phys_start = 0xe6800000,
> >             .virt_start = 0xe6800000,
> >             .size = 0x800,
>
> This turns the region into a so-called sub-page (see
> JAILHOUSE_MEMORY_IS_SUBPAGE), and then...
>
> >             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >                 JAILHOUSE_MEM_IO,
>
> ...you also need to specify the permitted access width for registers in
> that sub-page (JAILHOUSE_MEM_IO_{8,16,32,64}). If unaligned accesses are
> ok (unlikely), also set JAILHOUSE_MEM_IO_UNALIGNED.
>
Thanks for the pointer and indeed that did the trick!

And finally we have the root cell working, thanks for your continuous support.

root@hihope-rzg2m:~#
root@hihope-rzg2m:~# jailhouse enable renesas-r8a774a1.cell
[   20.170330] entering.

Initializing Jailhouse hypervisor v0.12 (319-g56e70e09-dirty) on CPU 2
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 53/4063, remap 0/131072
Initializing processors:
 CPU 2... OK
 CPU 1... OK
 CPU 0... OK
 CPU 5... OK
 CPU 3... OK
 CPU 4... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Page pool usage after late setup: mem 82/4063, remap 5/131072
Activating hypervisor
[   20.219018] exitt.
[   20.222135] The Jailhouse is opening.
root@hihope-rzg2m:~#
root@hihope-rzg2m:~#

Have a good weekend! I shall start work on the inmate cell from
tomorrow. Hopefully there won't be any issues, fingers crossed.

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vQjdVghdJkcz_O9dOtqKFkndDxk5tY-5Z-ZaxQH-YD8g%40mail.gmail.com.
