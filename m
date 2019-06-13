Return-Path: <jailhouse-dev+bncBCC7DQPESQPRB2V3RHUAKGQEE2X3SJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8634373A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 16:30:04 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id x18sf14588809pfj.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 07:30:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560436203; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ncat0+i0lQRXso4yrFeGVRT6jSrW5QM/cXYellp1FWjQsPuhkP5RELKV+4ptSzUURQ
         c8/e+Ic0+VFsCxO3uYoW+A27i39GOVLOWDskDhQnLQUF2d5F3LALQaYtRF8tiCT1VpOe
         iJio+i0IjtMqx3DUxdI3JrgYapfev/JjGcVAhbmDc1s6scVholUeC25FYH0zVN998d8R
         Iy7l3GdVWSBhGmr+t7ctb55j1qrqwh0r33ktf6rhO4m10yYvUn3/EYifdtJe6EKXO672
         LUvpqwHUn9LhfvojSOc0m0f9W0sH/YyY7tpJxWZgzPd4eQUz5QJPKkVNO+1M6yYBbvqJ
         LGIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=FncP+lrXnjFHZLKbv5cwhNnrztlWLFdfREP2oWOlkjk=;
        b=FFZA3B8tvg3A0OYX5CiRmik/D0gSCfzmJGlfzyGEJRM7yOkzyhEMIZcq4eujckfTVp
         4jNalTxenNUOwfYOgUYnAVCpoc0mwV4lOSK5SQn49GTsHlWzYF413yyDdkBf7+wW0UJ8
         8czyXuRt2Hzk1iMdXUFpD7NH5KxEYnpLt4WqTb8nBheK9kN/jitBLdpvDoddA9+EJcQK
         LQTlZbPO7rPwpcpNt1U5hGxvnBPwaxO4Gq9epK/waIeEWOzaZR7385CL2ueKpWXvcDNX
         2sm88notBEy7UdsrXdnorEcc3iSVASsHBwZiaFMoXH8ZsTY2W0U+J27SJJi0EULQgBm7
         SWSg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VIGtmuFT;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::72c as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FncP+lrXnjFHZLKbv5cwhNnrztlWLFdfREP2oWOlkjk=;
        b=CQBTqiNxky65Y4fMBI+QbNhDsB3b/cMI+hL992l+R4q2Uriwc5cLEP+Yt6sRGtQHc3
         Ofo/0agiUkrv23DEDbdGabvfzyWOTD7bcMnuZ9ekv06bf5Adu5i8CiqEp2rHiv77DhGC
         ORfyp02MMsaUcBIcMTNU6YWYqSxqddiksMd/Gym4WCcBlezPmbuW392YTsNRpHS/5O3w
         oy7Bj07iRY3/nXL9cw6/3VOC26VcmMJutdop1epHysPSGYbwGXtRlEQ3XQ+p6VUBKUCH
         ysPrE4GWX09YrZljTSZlNMffipNBYvLfZrBF8fXHUEJxrumuRbUsepT51Ai/pSOMSwzk
         pdJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FncP+lrXnjFHZLKbv5cwhNnrztlWLFdfREP2oWOlkjk=;
        b=sA1fIdGHsO88Beh/NpD0sJB2D/5+uUweoffH0JD48oLO3VhU82+8UgHioGwaxHPpJK
         8JqjfkQ1dYW99RUC3LoQ6jjnY1yb70hAc8Mrk7PjlQEkcVusWd3Y7xmAFyl+Mcsn01di
         0TgkLCTBixgeSFxziYTx2VSR2KUeZ3uB32rDq50jH6htMo9LzNeSM3uFHXXkER1NWBQP
         zG1AsBuHcWSYcdjASMrcnD/9EIOn+xf5VzmHkeshoep2W9yzNYp12FWVQC2glZ/sVsCz
         FPqXlwG55DBA8f9rC9czqAlpC3CFFu6I3R7I1wEVnd6+66P86jMX7KG2uZE6zmnq4ZIb
         z4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FncP+lrXnjFHZLKbv5cwhNnrztlWLFdfREP2oWOlkjk=;
        b=kxmvYpFqNjOsP6Owv3rbi6tRuvcPl8ncoaaMZh68f+m77J+6AcTTBt4INDMJDJy2wm
         NSfwVOSwh4sNFaEeiwrZAXsRdvpOk9sCge/cAoOoARO+eouANIT5gBJJEn9HvYGciJ5t
         +clkyAKG1Nw3FQKecV7pB9/n34bH8rfycsj9ymxFSlupnGLrlb+++f/ZADe58cFhqAdH
         1yR+AZzVD8UXOCSf9+nMiXBUSimmQ7wTPfDbq+FKeDoSN4j2vLWHG0AzCN6CUACQcUD/
         31vNb+04Yq1EmW4/UxnzsFqwmMo4O0eDM2WN/6eucJwNsz/3K75Gndv3ZXvQWmVHesK4
         wWEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV1bYMrBcUgXzDG7XfD4MvWzVNQVMAqZTLwPd8wAvcbFaUjwIt6
	tzKHDob4ZLgxETU4JFJPrWQ=
X-Google-Smtp-Source: APXvYqzevL+P6ky9NmVS1AkTtQJltV+CZ91w3Ip4HNb1IXxlyxwlzv8Lk3gQytNNG3pwfrk29khK8A==
X-Received: by 2002:a62:68c4:: with SMTP id d187mr95694636pfc.245.1560436203155;
        Thu, 13 Jun 2019 07:30:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:8a8f:: with SMTP id p15ls1470495plo.2.gmail; Thu, 13
 Jun 2019 07:30:02 -0700 (PDT)
X-Received: by 2002:a17:90a:ad86:: with SMTP id s6mr5992931pjq.42.1560436202401;
        Thu, 13 Jun 2019 07:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560436202; cv=none;
        d=google.com; s=arc-20160816;
        b=D4k97X1kSNDJUG3o/J5z2q1kKP7oDbclxkxClfaBq6NMmOGIg8pzuVxWwXUVg21PSu
         uOGncu0qktX965MFPTOQpt0LQhTgfu/As6grWevhXuz3F3nUuzXpoaumzMCbqOLDE1JX
         V5SDKvAJySL2Jmtz4Dv65A3vRO9fplMsMVfoAvQe14TFGVt/XkiqrW425cWhcIh4hpPo
         P+hbj+AzTs/jpCb7LmlKbzM7ExEpmLdULJM0GwLfuDqIb5Ofp7uEvPoKozszxj5U6gt7
         Vh0uVYBj63fxXuZweE8OS5MxdepuCY7fwGti2vg8DGhiojAWHdLxjSsx9Whgzmz+qm5K
         AaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LHI1VE49hgPrOw20UfHBu7M8EAfeYFUJHtQaRECzIOY=;
        b=i+fCp4srX+z/SVxgQgXphuINPgKtjI+K5jriB6a9rV/Xz/9sVQFCumm0UHJjJwsPUc
         zU2DttJ+c5yjQUAKUBUvKsLAPmfatEAVRZA8TnGVwDVswr1tPjdxE7hzcbVML0+xZtOF
         dxhph3aO3AfzFK3KJhf1hAzR0YALcWAvIqrj5TsbVQFfLNoBkEy8NGF3K8LWd7YcGFJu
         wOiT4ehDXJJKKGVqyatrucV8rClRkj8/Rh9mTygzB+YoD3IZuZjxq0uWv4ZcG1FQ/R+J
         uJp7UdmMzsGh/9eVNcs+6Jk1tou7ykMMNNe4aiub8oMjCDx8czpciSrBxLyLisPsNWrJ
         +7qA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VIGtmuFT;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::72c as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com. [2607:f8b0:4864:20::72c])
        by gmr-mx.google.com with ESMTPS id 137si4275pfa.2.2019.06.13.07.30.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::72c as permitted sender) client-ip=2607:f8b0:4864:20::72c;
Received: by mail-qk1-x72c.google.com with SMTP id g18so12885031qkl.3
        for <jailhouse-dev@googlegroups.com>; Thu, 13 Jun 2019 07:30:01 -0700 (PDT)
X-Received: by 2002:a37:4b56:: with SMTP id y83mr28275248qka.338.1560436200615;
 Thu, 13 Jun 2019 07:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de> <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de> <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de> <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
 <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
 <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de> <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
 <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de> <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de> <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com>
In-Reply-To: <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com>
From: Wayne <racedrive1503@gmail.com>
Date: Thu, 13 Jun 2019 10:29:47 -0400
Message-ID: <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000006eb3af058b355dc2"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=VIGtmuFT;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::72c
 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;       dmarc=pass
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

--0000000000006eb3af058b355dc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for clarifying, I would have to start with the AMD64 file if I go
with Buildroot for x86.  However, I haven't been able to get Buildroot to
install yet on my machine.  Any recommended alternatives to Buildroot?
Does the rootfs.cpio basically run in a ramdisk like /dev/ram0 to prevent
the non-root linux from interfering with the root linux filesystem?
Meaning buildroot must do something different than what standard dracut
does to configure the initramfs image.

Thanks again,
Wayne

On Thu, Jun 13, 2019 at 9:53 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 13.06.19 15:37, Wayne wrote:
> > Hi Jan:
> >
> > In the example that you pointed me to below, how did you create the
> rootfs.cpio
> > image?  Is that considered an initrd or an initramfs?
> >
> > jailhouse cell linux /etc/jailhouse/linux-x86-demo.cell /boot/vmlinuz* =
\
> >                       -i /usr/libexec/jailhouse/demos/rootfs.cpio \
> >                       -c "console=3DttyS0 8250.nr_uarts=3D1 ip=3D192.16=
8.19.2"
> >
> > (From
> >
> https://github.com/siemens/jailhouse-images/blob/master/recipes-core/cust=
omizations/files/.bash_history-qemu-amd64
> )
> >
>
> The initramfs is built via this recipe:
>
> https://github.com/siemens/jailhouse-images/tree/master/recipes-core/non-=
root-initramfs
>
> You can find the buildroot configs for the different archs there, as well
> as a
> few pre-settings for convenience reasons.
>
> We call the parameters to specify a cpio-based initramfs also initrd, jus=
t
> like
> the kernel does in many places. Maybe "initramfs" would have been more
> correct,
> but, well...
>
> Jan
>
> > Thanks,
> >
> > Wayne
> >
> > On Wed, Jun 12, 2019 at 3:43 PM Ralf Ramsauer <
> ralf.ramsauer@oth-regensburg.de
> > <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
> >
> >     Hi,
> >
> >     On 6/12/19 9:32 PM, Wayne wrote:
> >      > I'm sorry about the formatting.  It didn't look like that before
> I sent it.
> >      >
> >      > I will double check my linux-x86-demo cell config again for the
> serial
> >      > IRQ mapping. Also I will build in the CONFIG_CRASH_CELL_ON_PANIC
> define
> >      > for help going forward.
> >      >
> >      > Can the "jailhouse cell linux" command take an initramfs image
> (.img)
> >      > through the "-i option" or does it need to be an initrd?  If
> initrd
> >
> >     Good question. The -i option does nothing else than loading the
> image -
> >     as a binary - to a RAM region and propagate its location. So I'd
> assume
> >     that support for different formats only depend if your kernel has
> >     builtin support for the eventual format.
> >
> >      > only, can you point me to an example x86 rootfs.cpio image?  I'm
> having
> >      > trouble installing Buildroot on my machine.
> >
> >     Buildroot is the perfect swiss army knife for non-root initrds.
> >
> >        Ralf
> >
> >      >
> >      > Thanks again,
> >      > Wayne
> >      >
> >      > On Wed, Jun 12, 2019 at 1:17 PM Ralf Ramsauer
> >      > <ralf.ramsauer@oth-regensburg.de <mailto:
> ralf.ramsauer@oth-regensburg.de>
> >      > <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>> wrote:
> >      >
> >      >     Hi Wayne,
> >      >
> >      >     On 6/12/19 3:55 PM, Wayne wrote:
> >      >     > Ralf/Jan,
> >      >     >
> >      >     >  Are you sure you remove the device from the kernel
> cmdline? *Yes,
> >      >     there
> >      >     > is no ttyS* device in my root linux cmdline*
> >      >     > - Are you sure that there doesn't spawn a tty? Check with
> >      >     systemctl. *No
> >      >     > tty as far as I can tell, verified with "lsof | grep
> ttyS".  The lsof
> >      >     > command stops working after the crash though*
> >      >
> >      >     please use plain text mails. It's getting hard to read :-)
> >      >
> >      >     > - lsof | grep ttyS
> >      >     > - The root-cell might receive the serial device's
> interrupt, while its
> >      >     >   ports are assigned to the non-root cell. Does the crash
> happen when
> >      >     >   you type in a character to the serial line? *This is
> possible,
> >      >     do you
> >      >     > have an example of how I would accomplish assigning the
> interrupt
> >      >     (IRQ 4
> >      >     > for ttyS0) to the non-root?  To rule out the interrupt
> concern.*
> >      >
> >      >     Compare linux-x86-demo.c. The .pin_bitmap field denotes the
> interrupts
> >      >     that are routed to the cell. If you use the original
> linux-x86-demo.c,
> >      >     then interrupt 4 should already be routed to the cell.
> >      >
> >      >     AFAICT, in linux-x86-demo.c, we assign IRQ 3 & 4. In your
> case, we also
> >      >     remove the other IRQ from the root cell - IRQ 3 should be
> commented out.
> >      >
> >      >     BTW, a helpful debugging feature:
> >      >     echo "#define CONFIG_CRASH_CELL_ON_PANIC 1" >>
> >      >     include/hypervisor/config.h
> >      >
> >      >     This will let the root cell print a stackdump which gives yo=
u
> a hint
> >      >     what codepath caused the crash.
> >      >
> >      >     >
> >      >     >   In this case, assign the interrupt to the non-root cell.
> You
> >      >     will need
> >      >     >   it in any case there once you have a initrd and want to
> type in
> >      >     stuff.
> >      >     >
> >      >     > So there must be some reason why the crash happens. The
> hard way is to
> >      >     > add 8250.nr_uarts=3D0 in your kernel cmdline of the root
> cell. *I
> >      >     can use
> >      >     > this method for now to continue booting the non-root linux=
.*
> >      >     >
> >      >     >>
> >      >     >>        if I leave out the pio mapping in the non-root
> linux, and
> >      >     >> alolothat block in the root cell instead then the non-roo=
t
> linux
> >      >     gets a
> >      >     >> PIO read fault on "0x3F9" while booting.
> >      >     >>        Ralf mentioned that Linux would not try enumerate
> the
> >      >     device if
> >      >     >> its set to -1 ( [0x3f8/8 ... 0x3ff/8] =3D -1)  , but the
> non-root
> >      >     seems to
> >      >     >> attempt to do something with it anyway:
> >      >     >>
> >      >     >> "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ
> sharing
> >      >     enabled"
> >      >     >> "FATAL: Invalid PIO read, port: 3f9: size 1"
> >      >     >
> >      >     > Hmm. At least that's what I thought. I don't know how
> enumeration of
> >      >     > platform devices works exactly, but reconsidering this, th=
e
> behaviour
> >      >     > above makes sense: How would it know that a platform devic=
e
> is not
> >      >     > present, depending of the configuration of the pio_bitmap.
> >      >      *Since I do
> >      >     > technically have two serial ports, is there a way (via
> command line or
> >      >     > kernel config for ex) to hardcode what the non-root would
> >      >     enumerate for
> >      >     > the UART when its booting up?  Meaning, force it to "see"
> the 0x2f8
> >      >     > serial port as ttyS0 instead of 0x3f8 when booting up
> >      >     > and** CONFIG_SERIAL_8250_RUNTIME_UARTS =3D 1**.  That way =
if
> you had say
> >      >     > three serial ports and three cells (1 root, 2 non-root
> linux) then
> >      >     each
> >      >     > could have their own separate dedicated ttyS0.*
> >      >
> >      >     Have a look at the documentation of the 8250 driver, don't
> know by
> >      >     heart.
> >      >
> >      >     HTH,
> >      >       Ralf
> >      >
> >      >     > *
> >      >     > *
> >      >     > As far as just booting the non-root besides the serial
> concern, I
> >      >     > haven't provided an initramfs to my non-root linux yet.  I
> would
> >      >     like to
> >      >     > probably boot it with a simple ramdisk if possible to get =
a
> point
> >      >     where
> >      >     > I can log in.
> >      >     > *
> >      >     > *
> >      >     > Thanks,
> >      >     > Wayne
> >      >     >
> >      >     > On Wed, Jun 12, 2019 at 6:43 AM Ralf Ramsauer
> >      >     > <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     > <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>> wrote:
> >      >     >
> >      >     >     Hi,
> >      >     >
> >      >     >     On 6/11/19 11:05 PM, Wayne wrote:
> >      >     >     > Jan/Ralf,
> >      >     >     >
> >      >     >     > I was able to get past issues 1 and 3 above by using
> Jan's
> >      >     kernel
> >      >     >     config
> >      >     >     > from this thread:
> >      >     >     >
> >      >     >     >
> >      >     >
> >      >
> >
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >
> >      >     >     >
> >      >     >     > The DMA issue was resolved by disabling kernel
> >      >     >     option CONFIG_ISA_DMA_API
> >      >     >     > as stated in another thread, and reflected in the
> config
> >      >     file above.
> >      >     >     >
> >      >     >     > So now I think i've almost got the non-root linux
> booting.  I'm
> >      >     >     stuck at
> >      >     >     > the point where its trying to mount a filesystem and
> since
> >      >     i'm not
> >      >     >     > providing an initramfs it panics.
> >      >     >
> >      >     >     Perfect!
> >      >     >
> >      >     >     >
> >      >     >     > Similar to the output below:
> >      >     >     >
> >      >     >     > [ 1.080178] VFS: Cannot open root device "(null)" or
> >      >     >     unknown-block(0,0):
> >      >     >     > error -6
> >      >     >     > [ 1.087662] Please append a correct "root=3D" boot
> option;
> >      >     here are the
> >      >     >     > available partitions:
> >      >     >     > [ 1.096013] Kernel panic - not syncing: VFS: Unable
> to mount
> >      >     root
> >      >     >     fs on
> >      >     >     > unknown-block(0,0)
> >      >     >     >
> >      >     >     > I have just a couple more questions:
> >      >     >     > 1. In general, is it true that an inmate will
> takeover control
> >      >     >     from the
> >      >     >     > root of any resource in the following arrays, or are
> there
> >      >     some cases
> >      >     >     > where they get "shared" between the root and inmate?
> >      >     >
> >      >     >     Depends.
> >      >     >
> >      >     >     >      A. ".mem_regions" -> Shared?
> >      >     >
> >      >     >     May be shared with the root cell (i.e., if the region
> has the flag
> >      >     >     JAILHOUSE_MEM_ROOTSHARED set).
> >      >     >
> >      >     >     >      B. ".irqchips" -> Shared?
> >      >     >
> >      >     >     Shared with whom? Only one guest runs on a CPU. This
> guest
> >      >     will have
> >      >     >     full access to the irqchip. Some accesses must be
> intercepted.
> >      >     >
> >      >     >     >      C. ".pio_bitmap" -> Inmate takes control of
> these if
> >      >     matching
> >      >     >     > between inmate and root
> >      >     >
> >      >     >     Exclusive control.
> >      >     >
> >      >     >     >      D. ".pci_devices" -> Inmate takes control?
> >      >     >
> >      >     >     Exclusive control.
> >      >     >
> >      >     >     >      E. ".pci_caps" -> Inmate takes control?
> >      >     >
> >      >     >     Exclusive control.
> >      >     >
> >      >     >     >
> >      >     >     > 2. Along the same lines, going back to my ttyS0 issu=
e
> >      >     mentioned above
> >      >     >     > while trying to share it:
> >      >     >     >
> >      >     >     >        If I allocate the following to the linux non
> root
> >      >     cell (and set
> >      >     >     > to -1 in the root)
> >      >     >
> >      >     >     BTW, there's generally no need to set -1 in the root
> cell --
> >      >     it will be
> >      >     >     taken away when the non-root cell is created.
> >      >     >
> >      >     >     >      .pio_bitmap =3D {
> >      >     >     >           [0x3f8/8 ... 0x3ff/8] =3D 0x00   /* serial=
 2*/
> >      >     >     >        }
> >      >     >     >
> >      >     >     >        Then on the root cell I randomly get a PIO
> read fault on
> >      >     >     "0x3FE"
> >      >     >     > when the non-root is booting, i'm not sure what
> process is
> >      >     causing
> >      >     >     this.
> >      >     >
> >      >     >     - Are you sure you remove the device from the kernel
> cmdline?
> >      >     >     - Are you sure that there doesn't spawn a tty? Check
> with
> >      >     systemctl.
> >      >     >     - lsof | grep ttyS
> >      >     >     - The root-cell might receive the serial device's
> interrupt,
> >      >     while its
> >      >     >       ports are assigned to the non-root cell. Does the
> crash
> >      >     happen when
> >      >     >       you type in a character to the serial line?
> >      >     >
> >      >     >       In this case, assign the interrupt to the non-root
> cell. You
> >      >     will need
> >      >     >       it in any case there once you have a initrd and want
> to type
> >      >     in stuff.
> >      >     >
> >      >     >     So there must be some reason why the crash happens. Th=
e
> hard
> >      >     way is to
> >      >     >     add 8250.nr_uarts=3D0 in your kernel cmdline of the ro=
ot
> cell.
> >      >     >
> >      >     >     >
> >      >     >     >        if I leave out the pio mapping in the non-roo=
t
> linux, and
> >      >     >     > alolothat block in the root cell instead then the
> non-root linux
> >      >     >     gets a
> >      >     >     > PIO read fault on "0x3F9" while booting.
> >      >     >     >        Ralf mentioned that Linux would not try
> enumerate the
> >      >     device if
> >      >     >     > its set to -1 ( [0x3f8/8 ... 0x3ff/8] =3D -1)  , but
> the non-root
> >      >     >     seems to
> >      >     >     > attempt to do something with it anyway:
> >      >     >     >
> >      >     >     > "[    0.956146]Serial: 8250/16550 driver, 1 ports,
> IRQ sharing
> >      >     >     enabled"
> >      >     >     > "FATAL: Invalid PIO read, port: 3f9: size 1"
> >      >     >
> >      >     >     Hmm. At least that's what I thought. I don't know how
> >      >     enumeration of
> >      >     >     platform devices works exactly, but reconsidering this=
,
> the
> >      >     behaviour
> >      >     >     above makes sense: How would it know that a platform
> device is not
> >      >     >     present, depending of the configuration of the
> pio_bitmap.
> >      >     >
> >      >     >     Anyway, 8250 drivers have some cmdline parameters that
> can be
> >      >     used to
> >      >     >     control initialisation (e.g., see the nr_uarts
> parameters above).
> >      >     >
> >      >     >     >
> >      >     >     >        Is it possible to map the same pio block in
> both the
> >      >     root and
> >      >     >     > non-root with a different mask?  Or does the non-roo=
t
> just
> >      >     >     override it?
> >      >     >     > It seems like the latter is true.
> >      >     >
> >      >     >     Exactly. That's not a) possible, and b) does not reall=
y
> make
> >      >     sense.
> >      >     >
> >      >     >       Ralf
> >      >     >
> >      >     >     >
> >      >     >     > Thanks again Jan and Ralf for your help getting to
> this point.
> >      >     >     >
> >      >     >     >
> >      >     >     > On Tue, Jun 11, 2019 at 2:13 PM Wayne
> >      >     <racedrive1503@gmail.com <mailto:racedrive1503@gmail.com>
> >     <mailto:racedrive1503@gmail.com <mailto:racedrive1503@gmail.com>>
> >      >     >     <mailto:racedrive1503@gmail.com
> >     <mailto:racedrive1503@gmail.com> <mailto:racedrive1503@gmail.com
> >     <mailto:racedrive1503@gmail.com>>>
> >      >     >     > <mailto:racedrive1503@gmail.com <mailto:
> racedrive1503@gmail.com>
> >      >     <mailto:racedrive1503@gmail.com <mailto:
> racedrive1503@gmail.com>>
> >     <mailto:racedrive1503@gmail.com <mailto:racedrive1503@gmail.com>
> >      >     <mailto:racedrive1503@gmail.com <mailto:
> racedrive1503@gmail.com>>>>>
> >      >     >     wrote:
> >      >     >     >
> >      >     >     >     Jan & Ralf:
> >      >     >     >
> >      >     >     >     I have a little good news, I have successfully
> gotten
> >      >     the non-root
> >      >     >     >     linux to display some startup output based on yo=
ur
> >      >     suggestions.
> >      >     >     >     Also, there must have been some small difference
> between
> >      >     the stock
> >      >     >     >     linux-x86-demo cell config and the one I
> tweaked.  I
> >      >     went back to
> >      >     >     >     the original and made some minor changes and it
> started
> >      >     displaying
> >      >     >     >     the serial output now for the non-root node.
> >      >     >     >
> >      >     >     >     I ended up making the root cell the primary user
> of the
> >      >     ttyS0
> >      >     >     >     device, and just having the non-root linux outpu=
t
> to the
> >      >     >     hypervisor
> >      >     >     >     virtual console (console=3Djailhouse).  In my
> setup, there
> >      >     >     appears to
> >      >     >     >     be some process still attempting to use the ttyS=
0
> >      >     randomly on the
> >      >     >     >     root linux, and that causes the hypervisor to
> halt it if
> >      >     I don't
> >      >     >     >     leave it in the PIO array.  Not sure who is doin=
g
> it.
> >      >     >     >
> >      >     >     >
> >      >     >     >     This is where i'm at now.  The non-root linux
> keeps
> >      >     running into
> >      >     >     >     points where it tries to access PIO and gets
> parked:
> >      >     >     >
> >      >     >     >     1. First crash:
> >      >     >     >
> >      >     >     >     [    0.424925]kworker/u6:0 (27) used greated sta=
ck
> >      >     depth: 14656
> >      >     >     >     bytes left
> >      >     >     >     [    0.425807]futex has table entries: 1024
> (order: 4, 65536
> >      >     >     bytes)
> >      >     >     >     "FATAL: Invalid PIO write, port: 70: size 1"
> >      >     >     >     ...
> >      >     >     >     Parking CPU 3 (Cell: "linux-x86-demo")
> >      >     >     >
> >      >     >     >     According to /proc/ioports, 70 has to do with th=
e
> >      >     Realtime clock
> >      >     >     >     (rtc0).  I was able to temporarily add the 70
> mapping to the
> >      >     >     >     non-root linux, but should it be there at all?  =
I
> tried
> >      >     to disable
> >      >     >     >     RTC support in the guest kernel config.
> >      >     >     >
> >      >     >     >
> >      >     >     >     2. On the next attempt, I then got further with =
a
> crash
> >      >     trying to
> >      >     >     >     initialize Ser device ttyS0:
> >      >     >     >
> >      >     >     >     "[    0.956146]Serial: 8250/16550 driver, 1
> ports, IRQ
> >      >     sharing
> >      >     >     enabled"
> >      >     >     >     "FATAL: Invalid PIO read, port: 3f9: size 1"
> >      >     >     >     ...
> >      >     >     >     Parking CPU 3 (Cell: "linux-x86-demo")
> >      >     >     >
> >      >     >     >     I can get around that if I allow the non-root
> access in
> >      >     its pio
> >      >     >     >     table, but then I have a problem above with the
> root linux
> >      >     >     randomly
> >      >     >     >     trying to use it.
> >      >     >     >
> >      >     >     >
> >      >     >     >     3. Now with the temporary adjustments to the
> non-root
> >      >     pio table
> >      >     >     >     above I get here:
> >      >     >     >
> >      >     >     >     "[    0.972399]clocksource:Switched to
> clocksource tsc"
> >      >     >     >     "FATAL: Invalid PIO read, port: 87: size 1"
> >      >     >     >     ...
> >      >     >     >     Parking CPU 3 (Cell: "linux-x86-demo")
> >      >     >     >
> >      >     >     >     According to proc/ioports this one has to do wit=
h
> "dma page
> >      >     >     >     request". It isn't mapped in my root linux PIO o=
r
> non-root
> >      >     >     linux array.
> >      >     >     >
> >      >     >     >
> >      >     >     >     Aside from the serial conflict, it seems like
> these
> >      >     should remain
> >      >     >     >     controlled by the root linux or hypervisor.   Do
> you use a
> >      >     >     >     particular bare minimum x86 kernel config on you=
r
> >      >     machine for the
> >      >     >     >     guest to get around these?  I know Jan mentioned
> the
> >      >     >     >     jailhouse-images project might have something,
> but I
> >      >     couldn't find
> >      >     >     >     it digging around quick.
> >      >     >     >
> >      >     >     >     Thanks to you both for your responses and
> patience.  I
> >      >     got the
> >      >     >     root
> >      >     >     >     linux up and going on my own, but the non-root
> guest is
> >      >     proving to
> >      >     >     >     be more difficult.
> >      >     >     >
> >      >     >     >     Wayne
> >      >     >     >
> >      >     >     >
> >      >     >     >
> >      >     >     >     On Tue, Jun 11, 2019 at 11:31 AM Ralf Ramsauer
> >      >     >     >     <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >      >     >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>> wrote:
> >      >     >     >
> >      >     >     >         Hi,
> >      >     >     >
> >      >     >     >         On 6/10/19 7:45 PM, Wayne wrote:
> >      >     >     >         > Thank you for your responses Ralf and Jan.
> >      >     >     >         >
> >      >     >     >         > Yes, I have successfully gotten both the
> apic-demo and
> >      >     >     >         tiny-demo cells
> >      >     >     >         > to work on my system before attempting to
> load the
> >      >     non-root
> >      >     >     >         linux.  I
> >      >     >     >         > can see serial output from them.
> >      >     >     >         >
> >      >     >     >         > However, if I try to share the UART betwee=
n
> root
> >      >     and inmate
> >      >     >     >         for them I
> >      >     >     >         > run into a crash on the hypervisor if the
> root linux
> >      >     >     attempts
> >      >     >     >         to write
> >      >     >     >         > to the UART (after creating/starting a
> demo).
> >      >     Does the root
> >      >     >     >         linux lose
> >      >     >     >         > access once an inmate is created/started?
> Or am I
> >      >     missing
> >      >     >     >         something
> >      >     >     >         > from my System config or tiny-demo config
> that allows
> >      >     >     them to
> >      >     >     >         share?  I
> >      >     >     >         > attached the crash in hypervisor_output.tx=
t.
> >      >     >     >         >
> >      >     >     >         > Also, I noticed the tiny-demo output on th=
e
> UART gets
> >      >     >     mirrored
> >      >     >     >         on the
> >      >     >     >
> >      >     >     >         Yes, according to your config,
> >      >     >     >         JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is
> >      >     >     >         set. This means that the guest will use the
> virtual
> >      >     >     console. The
> >      >     >     >         virtual
> >      >     >     >         console uses the hypervisor output which
> depends
> >      >     whatever
> >      >     >     is set
> >      >     >     >         in your
> >      >     >     >         system configuration. In your case the
> hypervisor
> >      >     uses 3f8.
> >      >     >     >
> >      >     >     >         And additionally, the inmate also a valid
> .console
> >      >     set. Again,
> >      >     >     >         3f8. This
> >      >     >     >         means, it will use the console *and* the
> hypervisor
> >      >     debug
> >      >     >     >         hypercall. In
> >      >     >     >         your case, both outputs are routed to the sa=
me
> >      >     device which
> >      >     >     >         explains the
> >      >     >     >         mirroring.
> >      >     >     >
> >      >     >     >         > Jailhouse virtual console.  Does that mean
> that its
> >      >     >     writing to the
> >      >     >     >         > serial through the hypervisor and not
> directly
> >      >     accessing
> >      >     >     ttyS0
> >      >     >     >         itself?
> >      >     >     >
> >      >     >     >         Exactly.
> >      >     >     >
> >      >     >     >         > If so, is there a way to create the cell t=
o
> write
> >      >     ttyS0
> >      >     >     >         directly as a
> >      >     >     >         > test?  To see if it exhibits same behavior
> as the
> >      >     >     non-root linux.
> >      >     >     >
> >      >     >     >         Sure, simply align the .address field of
> .console,
> >      >     and allow
> >      >     >     >         access to
> >      >     >     >         that port via .pio_bitmap.
> >      >     >     >
> >      >     >     >         >
> >      >     >     >         > FYI, I create the tiny-demo like this:
> >      >     >     >         >
> >      >     >     >         > jailhouse cell create
> configs/x86/tiny-demo.cell
> >      >     >     >         > jailhouse cell load tiny-demo
> >      >     >     inmates/demos/x86/tiny-demo.cell
> >      >     >     >         > jailhouse cell start tiny-demo
> >      >     >     >         >
> >      >     >     >         > Going back to my original non-root linux
> question, I
> >      >     >     don't see any
> >      >     >     >         > output when connected over ttyS0.  Its
> address is
> >      >     0x3f8
> >      >     >     >         ("serial 1") in
> >      >     >     >         > the PIO, and that seems to work fine for
> the other
> >      >     simple
> >      >     >     >         demos, minus
> >      >     >     >         > the hypervisor crash issue above when
> sharing.  I
> >      >     know there
> >      >     >     >         is the
> >      >     >     >         > other "serial 2" port but I haven't tried
> to use
> >      >     that one.
> >      >     >     >
> >      >     >     >         I see that port on our Dell server as well.
> It's
> >      >     present,
> >      >     >     but I
> >      >     >     >         don't
> >      >     >     >         know where it's connected to.
> >      >     >     >
> >      >     >     >         Let me just summarise your issue:
> >      >     >     >
> >      >     >     >         You only have one serial line available,
> right? From the
> >      >     >     root-cell's
> >      >     >     >         POV, it's ttyS0 on 3f8.
> >      >     >     >
> >      >     >     >         I would propose to share ttyS0 between the
> >      >     hypervisor and
> >      >     >     non-root
> >      >     >     >         Linux. This means:
> >      >     >     >
> >      >     >     >           - Don't let the root-cell use ttyS0. Remov=
e
> any
> >      >     >     console=3DttyS0
> >      >     >     >             parameters from you commandline. Ensure
> that noone
> >      >     >     else accesses
> >      >     >     >             ttyS0 (e.g., getty@ttyS0 or other
> friends)
> >      >     >     >
> >      >     >     >           - Set 3f8 as debug_console in your master.=
c
> (seems you
> >      >     >     already
> >      >     >     >         have)
> >      >     >     >
> >      >     >     >           - Allow 3f8 access in the linux-demo.c
> (already set in
> >      >     >     the default
> >      >     >     >             linux-demo
> >      >     >     >
> >      >     >     >           - Disallow 2f8 access in linux-demo.c:
> >      >     >     >         -               [ 0x2f8/8 ...  0x2ff/8] =3D =
0,
> /*
> >      >     serial2 */
> >      >     >     >         +               [ 0x2f8/8 ...  0x2ff/8] =3D =
-1,
> /*
> >      >     serial2 */
> >      >     >     >
> >      >     >     >             I don't know how Linux enumerates serial
> >      >     devices, but this
> >      >     >     >         ensures
> >      >     >     >             that Linux won't see the unconnected
> serial line
> >      >     and map
> >      >     >     >         ttyS0 to
> >      >     >     >             3f8
> >      >     >     >
> >      >     >     >         >
> >      >     >     >         > non root linux launched with:
> >      >     >     >         > /tools/jailhouse cell linux
> configs/x86/linux-x86.cell
> >      >     >     >         > /boot/vmlinux-4.1.16-Guest -c
> "console=3DttyS0,115200"
> >      >     >     >
> >      >     >     >         Then, this should actually work...
> >      >     >     >
> >      >     >     >         And if not, then console=3Djailhouse0 should
> work.
> >      >     >     >
> >      >     >     >         >
> >      >     >     >         > I can try the 4.19 siemens kernel and "nex=
t"
> >      >     branch for
> >      >     >     >         jailhouse you
> >      >     >     >         > suggested.  Do you think that combination
> will resolve
> >      >     >     the missing
> >      >     >     >         > serial for the non-root linux?  Otherwise,
> did my
> >      >     kernel
> >      >     >     >         config, system
> >      >     >     >         > config, and non-root linux cell configs
> look OK?
> >      >     >     >
> >      >     >     >         I didn't look at it, but we should at least =
-
> even
> >      >     if some
> >      >     >     flags are
> >      >     >     >         still incorrect - see the "Uncompressing
> kernel..."
> >      >     thing.
> >      >     >     >
> >      >     >     >         Wait -- one thing you could try: Deactivate
> >      >     CONFIG_EFI and
> >      >     >     >         especially
> >      >     >     >         CONFIG_EFI_STUBS. I'm not sure, but it could
> be that
> >      >     EFI_STUBS
> >      >     >     >         change
> >      >     >     >         the header format that our bootloader patche=
s.
> >      >     >     >
> >      >     >     >         >
> >      >     >     >         > Thanks again for your help.
> >      >     >     >
> >      >     >     >         No problem. But it's not yet working. ;-)
> >      >     >     >
> >      >     >     >           Ralf
> >      >     >     >
> >      >     >     >         >
> >      >     >     >         >
> >      >     >     >         > On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsau=
er
> >      >     >     >         > <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >      >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>
> >      >     >     >         > <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >      >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>>> wrote:
> >      >     >     >         >
> >      >     >     >         >     Hi Wayne,
> >      >     >     >         >
> >      >     >     >         >     On 6/7/19 10:04 PM, Wayne wrote:
> >      >     >     >         >     > Hi Ralf,
> >      >     >     >         >     >
> >      >     >     >         >     > Thank you for your responses.  I hav=
e
> >      >     attached the
> >      >     >     >         requested config
> >      >     >     >         >     > files.  I am now just trying to use
> the same
> >      >     >     bzImage for
> >      >     >     >         the root and
> >      >     >     >         >     > the non-root linux node.
> >      >     >     >         >
> >      >     >     >         >     One question that you didn't answer: d=
o
> >      >     apic-demo or
> >      >     >     >         tiny-demo work?
> >      >     >     >         >     They need to to have correct .console
> >      >     parameter set, so
> >      >     >     >         ensure that
> >      >     >     >         >     parameters are set if you run those
> demos in your
> >      >     >     >         linux-demo cell. Just
> >      >     >     >         >     compare it to tiny-demo.c or apic-demo=
.c
> >      >     >     >         >
> >      >     >     >         >     >
> >      >     >     >         >     > Yes, I am using vanilla 4.16 because
> the
> >      >     documentation
> >      >     >     >         indicated
> >      >     >     >         >     that it
> >      >     >     >         >     > is the first mainline release to
> officially
> >      >     support
> >      >     >     >         Jailhouse Guest
> >      >     >     >         >     > images.  Do you suggest that I use
> something
> >      >     else?
> >      >     >     >         >
> >      >     >     >         >     As Jan already wrote: Try to use
> Siemens' 4.19
> >      >     branch.
> >      >     >     >         >
> >      >     >     >         >     >
> >      >     >     >         >     > Right now i'm just trying to get som=
e
> serial
> >      >     >     output from
> >      >     >     >         the non-root
> >      >     >     >         >     > Linux.  Hopefully, I have that
> configured
> >      >     correctly.
> >      >     >     >         Ideally, I would
> >      >     >     >         >     > like to share the same serial consol=
e
> for
> >      >     the Root
> >      >     >     node
> >      >     >     >         and non-root
> >      >     >     >         >     > node eventually if possible.  I have
> been OK
> >      >     with
> >      >     >     using
> >      >     >     >         the virtual
> >      >     >     >         >     > console (jailhouse console -f) for t=
he
> >      >     Hypervisor
> >      >     >     output.
> >      >     >     >         >
> >      >     >     >         >     In addition to Jan's comment:
> >      >     >     >         >
> >      >     >     >         >     Currently you only have access to the
> >      >     jailhouse console
> >      >     >     >         via 'jailhouse
> >      >     >     >         >     console' from your root cell. Imagine
> your
> >      >     root cell
> >      >     >     >         crashes for some
> >      >     >     >         >     reason. You will never see the fault
> reason,
> >      >     which makes
> >      >     >     >         things hard to
> >      >     >     >         >     debug.
> >      >     >     >         >
> >      >     >     >         >     I would suggest to configure the
> hypervisor to
> >      >     use the
> >      >     >     >         serial console.
> >      >     >     >         >     You can share the device with the
> non-root
> >      >     Linux, that's
> >      >     >     >         no problem.
> >      >     >     >         >
> >      >     >     >         >     In this case, the non-root kernel's
> output will
> >      >     >     always be
> >      >     >     >         printed to the
> >      >     >     >         >     serial console. Directly, if you choos=
e
> >      >     >     console=3DttySx, and
> >      >     >     >         indirectly
> >      >     >     >         >     via the hypervisor if you choose
> >      >     console=3Djailhouse.
> >      >     >     >         >
> >      >     >     >         >     BTW: According to your config, your
> system is a
> >      >     >     PowerEdge,
> >      >     >     >         and the
> >      >     >     >         >     non-root cell gets both, 0x2f8 and
> 0x3f8. Are
> >      >     you sure
> >      >     >     >         that ttyS1 is the
> >      >     >     >         >     correct console that you are connected
> to?
> >      >     >     >         >
> >      >     >     >         >     Just mentioning this as we have a
> similar
> >      >     machine here,
> >      >     >     >         and, afair, both
> >      >     >     >         >     platform serial device are 'usable',
> but one
> >      >     ends in the
> >      >     >     >         nirvana while
> >      >     >     >         >     it is accessible.
> >      >     >     >         >
> >      >     >     >         >     Ah, and one last thing: try to switch
> to the
> >      >     current
> >      >     >     next
> >      >     >     >         branch for
> >      >     >     >         >     jailhouse. Jan just integrated a few
> patches
> >      >     from me
> >      >     >     that
> >      >     >     >         might also be
> >      >     >     >         >     relevant for your machine.
> >      >     >     >         >
> >      >     >     >         >     HTH
> >      >     >     >         >       Ralf
> >      >     >     >         >
> >      >     >     >         >     >
> >      >     >     >         >     > Wayne
> >      >     >     >         >     >
> >      >     >     >         >     > On Fri, Jun 7, 2019 at 9:10 AM Ralf
> Ramsauer
> >      >     >     >         >     > <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >      >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>
> >      >     >     >         >     <mailto:ralf.ramsauer@oth-regensburg.d=
e
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >      >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>>
> >      >     >     >         >     > <mailto:
> ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >      >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>
> >      >     >     >         >     <mailto:ralf.ramsauer@oth-regensburg.d=
e
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >      >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >      >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >      >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>>>> wrote:
> >      >     >     >         >     >
> >      >     >     >         >     >     Hi,
> >      >     >     >         >     >
> >      >     >     >         >     >     On 6/7/19 2:28 PM, Wayne wrote:
> >      >     >     >         >     >     > Hello,
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > I am new to Linux development
> and
> >      >     >     Jailhouse.  I have
> >      >     >     >         >     successfully
> >      >     >     >         >     >     booted
> >      >     >     >         >     >     > the Jailhouse Hypervisor and
> root cell
> >      >     on a bare
> >      >     >     >         metal X86 Linux
> >      >     >     >         >     >     system
> >      >     >     >         >     >     > (No QEMU).  I am now trying to
> load a
> >      >     non-root
> >      >     >     >         Linux cell
> >      >     >     >         >     and I have a
> >      >     >     >         >     >     > few questions.  Jailhouse
> accepts and
> >      >     starts my
> >      >     >     >         non-root
> >      >     >     >         >     linux cell
> >      >     >     >         >     >     > configuration and I see it as
> "running"
> >      >     >     through the
> >      >     >     >         >     "jailhouse cell
> >      >     >     >         >     >     > list" command.  However, I
> don't see
> >      >     any serial
> >      >     >     >         output from the
> >      >     >     >         >     >     > "non-root linux" cell booting
> up.  I=E2=80=99m
> >      >     not sure
> >      >     >     >         what the
> >      >     >     >         >     non-root node
> >      >     >     >         >     >     > is doing at this point.
> >      >     >     >         >     >
> >      >     >     >         >     >     Ok, first of all, can you see an=
y
> output
> >      >     from
> >      >     >     >         Jailhouse's demo
> >      >     >     >         >     inmates
> >      >     >     >         >     >     (e.g., tiny-demo or apic-demo)?
> >      >     >     >         >     >
> >      >     >     >         >     >     >
> >      >     >     >         >     >     >                My root node is
> a 4.16
> >      >     kernel
> >      >     >     >         configured this
> >      >     >     >         >     way:
> >      >     >     >         >     >     >                               =
1.
> >      >     >     >         CONFIG_JAILHOUSE_GUEST is
> >      >     >     >         >     not set
> >      >     >     >         >     >     >                               =
2.
> >      >     CONFIG_SERIO=3Dy
> >      >     >     >         >     >     >                               =
3.
> >      >     >     >         >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> >      >     >     >         >     >     >
> >      >     >     >         >     >     >                My non-root nod=
e
> is a
> >      >     4.16 kernel
> >      >     >     >         configured
> >      >     >     >         >     this way:
> >      >     >     >         >     >     >                               =
1.
> >      >     >     >         CONFIG_JAILHOUSE_GUEST=3Dy
> >      >     >     >         >     >     >                               =
2.
> >      >     CONFIG_SERIO=3Dm
> >      >     >     >         (can't seem
> >      >     >     >         >     to disable
> >      >     >     >         >     >     > completely in my config for
> 4.16)
> >      >     >     >         >     >     >                               =
3.
> >      >     >     >         >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1
> >      >     >     >         >     >
> >      >     >     >         >     >     Could you please provide a full
> .config?
> >      >     What
> >      >     >     branch
> >      >     >     >         are you
> >      >     >     >         >     exactly
> >      >     >     >         >     >     using? Vanilla 4.16?
> >      >     >     >         >     >
> >      >     >     >         >     >     Please attach your system config
> and your
> >      >     >     non-root linux
> >      >     >     >         >     config as well.
> >      >     >     >         >     >
> >      >     >     >         >     >     You may also want to try
> >      >     >     > https://github.com/siemens/linux . See
> >      >     >     >         >     >     jailhouse-enabling branches for
> some
> >      >     releases.
> >      >     >     >         >     >
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > In general, do the kernel
> config settings
> >      >     >     have to
> >      >     >     >         match between
> >      >     >     >         >     >     the root
> >      >     >     >         >     >     > node and non-linux or is the
> above fine?
> >      >     >     >         >     >
> >      >     >     >         >     >     No, they do not have to be the
> same, but
> >      >     they can.
> >      >     >     >         Still, an
> >      >     >     >         >     analysis
> >      >     >     >         >     >     requires your .config.
> >      >     >     >         >     >
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > The vmlinux-4.1.16-Guest
> bzImage is
> >      >     approx 7MB,
> >      >     >     >         and the
> >      >     >     >         >     inmate node is
> >      >     >     >         >     >     > allocated ~75MB of RAM.
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > I have a single UART, so I hav=
e
> >      >     configured the
> >      >     >     >         root cell
> >      >     >     >         >     system config
> >      >     >     >         >     >     > to output to the virtual
> hypervisor
> >      >     console:
> >      >     >     >         >     >
> >      >     >     >         >     >     Wait... You configured your
> root-cell to
> >      >     use the
> >      >     >     >         hypervisor debug
> >      >     >     >         >     >     console? How? It's only availabl=
e
> once the
> >      >     >     hypervisor is
> >      >     >     >         >     enabled. How
> >      >     >     >         >     >     should this work?
> >      >     >     >         >     >
> >      >     >     >         >     >     But let's have a look at your
> >      >     configuration first.
> >      >     >     >         >     >
> >      >     >     >         >     >     So you want to:
> >      >     >     >         >     >       - Have the UART (0x3f8)
> available in the
> >      >     >     non-root cell
> >      >     >     >=EF=BF=BD=EF=BF=BD        >     >       - Use 0x3f8 a=
s hypervisor debug
> >      >     console as well
> >      >     >     >         >     >       - No console for root-cell
> >      >     >     >         >     >
> >      >     >     >         >     >     Did I get this right?
> >      >     >     >         >     >
> >      >     >     >         >     >       Ralf
> >      >     >     >         >     >
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > .flags =3D
> >      >     JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > .debug_console =3D {
> >      >     >     >         >     >     > .type =3D JAILHOUSE_CON_TYPE_N=
ONE,
> >      >     >     >         >     >     > },
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > and I have configured the
> non-root
> >      >     linux cell to
> >      >     >     >         output to
> >      >     >     >         >     the UART:
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > (Added serial 0x3f8 to pio
> bitmap for
> >      >     non-root
> >      >     >     >         linux) and
> >      >     >     >         >     started the
> >      >     >     >         >     >     > node with this:
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > ./tools/jailhouse cell linux
> >      >     >     >         configs/x86/linux-x86.cell
> >      >     >     >         >     >     > /boot/vmlinux-4.1.16-Guest -c
> >      >     >     "console=3DttyS0,115200"
> >      >     >     >         >     >     > (Note I also tried
> "console=3Djailhouse"
> >      >     in the
> >      >     >     >         command above,
> >      >     >     >         >     and that
> >      >     >     >         >     >     > produces the same result)
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > I then see the following on my
> hypervisor
> >      >     >     console
> >      >     >     >         >     (./tools/jailhouse
> >      >     >     >         >     >     > console -f):
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > Created cell "linux-x86-demo"
> >      >     >     >         >     >     > ...
> >      >     >     >         >     >     > Cell "linux-x86-demo" can be
> loaded
> >      >     >     >         >     >     > Started cell "linux-x86-demo"
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > After a little while I do get =
a
> parked
> >      >     CPU error
> >      >     >     >         on the root
> >      >     >     >         >     node,
> >      >     >     >         >     >     looks
> >      >     >     >         >     >     > like its trying to do somethin=
g
> with the
> >      >     >     UART as well:
> >      >     >     >         >     >     > FATAL: Invalid PIO read, port:
> 3fe size: 1
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > I would expect something to po=
p
> out on
> >      >     the UART
> >      >     >     >         from the
> >      >     >     >         >     non-root
> >      >     >     >         >     >     linux
> >      >     >     >         >     >     > node first.  Note that root
> node has
> >      >     serial
> >      >     >     0x3f8
> >      >     >     >         disabled
> >      >     >     >         >     in its pio
> >      >     >     >         >     >     > bitmap.
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > I verifed that the UART is
> functioning by
> >      >     >     allowing the
> >      >     >     >         >     hypervisor to
> >      >     >     >         >     >     > print to it and also performed
> an echo
> >      >     test over
> >      >     >     >         ttyS0.
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > I have tried several
> configurations of
> >      >     >     >         kernel.....including your
> >      >     >     >         >     >     current
> >      >     >     >         >     >     > "queues/jailhouse" branch head
> kernel
> >      >     for the
> >      >     >     >         non-root node,
> >      >     >     >         >     along
> >      >     >     >         >     >     with
> >      >     >     >         >     >     > the kernel config for 4.7
> posted in
> >      >     this thread
> >      >     >     >         below (but I
> >      >     >     >         >     get same
> >      >     >     >         >     >     > result as above when I start
> it, no kernel
> >      >     >     output):
> >      >     >     >         >     >     >
> >      >     >     >         >     >     >
> >      >     >     >         >     >
> >      >     >     >         >
> >      >     >     >
> >      >     >
> >      >
> >            "
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > Any information you can provid=
e
> to me
> >      >     will be
> >      >     >     >         helpful.  I'm
> >      >     >     >         >     not sure
> >      >     >     >         >     >     > what might be going wrong here=
.
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > Thanks,
> >      >     >     >         >     >     > Wayne
> >      >     >     >         >     >     >
> >      >     >     >         >     >     > --
> >      >     >     >         >     >     > You received this message
> because you are
> >      >     >     >         subscribed to the
> >      >     >     >         >     Google
> >      >     >     >         >     >     > Groups "Jailhouse" group.
> >      >     >     >         >     >     > To unsubscribe from this group
> and stop
> >      >     >     receiving
> >      >     >     >         emails
> >      >     >     >         >     from it, send
> >      >     >     >         >     >     > an email to
> >      >     >     > jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
> >      >     >     >         <mailto:
> jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>>
> >      >     >     >         >
> >      >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>
> >      >     >     >
> >      >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:
> jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>>>>
> >      >     >     >         >     >
> >      >     >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>
> >      >     >     >
> >      >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:
> jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>>>
> >      >     >     >         >
> >      >     >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.co=
m
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:
> jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>>
> >      >     >     >
> >      >      <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:
> jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252525252Bunsubscribe@googlegroups.com>>>>>=
>
> >      >     >     >         >     >     >
> >      >     >     <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
> >      >     >     >         <mailto:
> jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>>
> >      >     >     >         >
> >      >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>
> >      >     >     >
> >      >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:
> jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>>>>
> >      >     >     >         >     >
> >      >     >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>
> >      >     >     >
> >      >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:
> jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>>>
> >      >     >     >         >
> >      >     >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.co=
m
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:
> jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>>
> >      >     >     >
> >      >      <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:
> jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252525252Bunsubscribe@googlegroups.com
> >>>>>>>.
> >      >     >     >         >     >     > To view this discussion on the
> web visit
> >      >     >     >         >     >     >
> >      >     >     >         >     >
> >      >     >     >         >
> >      >     >     >
> >      >     >
> >      >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
> >      >     >     >         >     >     >
> >      >     >     >         >     >
> >      >     >     >         >
> >      >     >     >
> >      >     >
> >      >
> >           <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> >      >     >     >         >     >     > For more options, visit
> >      >     >     > https://groups.google.com/d/optout.
> >      >     >     >         >     >
> >      >     >     >         >
> >      >     >     >
> >      >     >     > --
> >      >     >     > You received this message because you are subscribed
> to the
> >      >     Google
> >      >     >     > Groups "Jailhouse" group.
> >      >     >     > To unsubscribe from this group and stop receiving
> emails
> >      >     from it, send
> >      >     >     > an email to
> jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
> >      >     >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >      >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>>.
> >      >     >     > To view this discussion on the web visit
> >      >     >     >
> >      >     >
> >      >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Mae=
RW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com
> >      >     >     >
> >      >     >
> >      >
> >        <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Mae=
RW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> >      >     >     > For more options, visit
> https://groups.google.com/d/optout.
> >      >     >
> >      >     > --
> >      >     > You received this message because you are subscribed to th=
e
> Google
> >      >     > Groups "Jailhouse" group.
> >      >     > To unsubscribe from this group and stop receiving emails
> from it, send
> >      >     > an email to jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >      >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >      >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>>.
> >      >     > To view this discussion on the web visit
> >      >     >
> >      >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%=
2Bgpts0DUBENqV6eFDPazfs5kR_QRGaw%40mail.gmail.com
> >      >     >
> >      >
> >       <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%=
2Bgpts0DUBENqV6eFDPazfs5kR_QRGaw%40mail.gmail.com?utm_medium=3Demail&utm_so=
urce=3Dfooter
> >.
> >      >     > For more options, visit https://groups.google.com/d/optout=
.
> >      >
> >      > --
> >      > You received this message because you are subscribed to the Goog=
le
> >      > Groups "Jailhouse" group.
> >      > To unsubscribe from this group and stop receiving emails from it=
,
> send
> >      > an email to jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >      > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>>.
> >      > To view this discussion on the web visit
> >      >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc13nuahbog_WVD-=
BJi0asHEa8TxMAvB5M5damJGJ_5inA%40mail.gmail.com
> >      >
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc13nuahbog_WVD-=
BJi0asHEa8TxMAvB5M5damJGJ_5inA%40mail.gmail.com?utm_medium=3Demail&utm_sour=
ce=3Dfooter
> >.
> >      > For more options, visit https://groups.google.com/d/optout.
> >
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%2BKhc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE%2B1JEX0D2Q%40m=
ail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--0000000000006eb3af058b355dc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIGZvciBjbGFyaWZ5aW5nLCBJIHdvdWxkIGhhdmUgdG8gc3Rh
cnQgd2l0aCB0aGUgQU1ENjQgZmlsZSBpZiBJIGdvIHdpdGggQnVpbGRyb290IGZvciB4ODYuwqAg
SG93ZXZlciwgSSBoYXZlbiYjMzk7dCBiZWVuIGFibGUgdG8gZ2V0IEJ1aWxkcm9vdCB0byBpbnN0
YWxsIHlldCBvbiBteSBtYWNoaW5lLsKgIEFueSByZWNvbW1lbmRlZCBhbHRlcm5hdGl2ZXMgdG8g
QnVpbGRyb290P8KgIERvZXMgdGhlIHJvb3Rmcy5jcGlvIGJhc2ljYWxseSBydW4gaW4gYSByYW1k
aXNrIGxpa2UgL2Rldi9yYW0wIHRvIHByZXZlbnQgdGhlIG5vbi1yb290IGxpbnV4IGZyb20gaW50
ZXJmZXJpbmcgd2l0aCB0aGUgcm9vdCBsaW51eCBmaWxlc3lzdGVtP8KgIE1lYW5pbmcgYnVpbGRy
b290IG11c3QgZG8gc29tZXRoaW5nIGRpZmZlcmVudCB0aGFuIHdoYXQgc3RhbmRhcmQgZHJhY3V0
IGRvZXMgdG8gY29uZmlndXJlIHRoZSBpbml0cmFtZnMgaW1hZ2UuPGRpdj48YnI+PC9kaXY+PGRp
dj5UaGFua3MgYWdhaW4sPC9kaXY+PGRpdj5XYXluZTwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFRodSwg
SnVuIDEzLCAyMDE5IGF0IDk6NTMgQU0gSmFuIEtpc3prYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmph
bi5raXN6a2FAc2llbWVucy5jb20iPmphbi5raXN6a2FAc2llbWVucy5jb208L2E+Jmd0OyB3cm90
ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQp
O3BhZGRpbmctbGVmdDoxZXgiPk9uIDEzLjA2LjE5IDE1OjM3LCBXYXluZSB3cm90ZTo8YnI+DQom
Z3Q7IEhpIEphbjo8YnI+DQomZ3Q7IDxicj4NCiZndDsgSW4gdGhlIGV4YW1wbGUgdGhhdCB5b3Ug
cG9pbnRlZCBtZSB0byBiZWxvdywgaG93IGRpZCB5b3UgY3JlYXRlIHRoZSByb290ZnMuY3BpbyA8
YnI+DQomZ3Q7IGltYWdlP8KgIElzIHRoYXQgY29uc2lkZXJlZCBhbiBpbml0cmQgb3IgYW4gaW5p
dHJhbWZzPzxicj4NCiZndDsgPGJyPg0KJmd0OyBqYWlsaG91c2UgY2VsbCBsaW51eCAvZXRjL2ph
aWxob3VzZS9saW51eC14ODYtZGVtby5jZWxsIC9ib290L3ZtbGludXoqIFw8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAtaSAvdXNyL2xpYmV4ZWMvamFpbGhvdXNl
L2RlbW9zL3Jvb3Rmcy5jcGlvIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAtYyAmcXVvdDtjb25zb2xlPXR0eVMwIDgyNTAubnJfdWFydHM9MSBpcD0xOTIuMTY4
LjE5LjImcXVvdDs8YnI+DQomZ3Q7IDxicj4NCiZndDsgKEZyb20gPGJyPg0KJmd0OyA8YSBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vc2llbWVucy9qYWlsaG91c2UtaW1hZ2VzL2Jsb2IvbWFzdGVy
L3JlY2lwZXMtY29yZS9jdXN0b21pemF0aW9ucy9maWxlcy8uYmFzaF9oaXN0b3J5LXFlbXUtYW1k
NjQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9z
aWVtZW5zL2phaWxob3VzZS1pbWFnZXMvYmxvYi9tYXN0ZXIvcmVjaXBlcy1jb3JlL2N1c3RvbWl6
YXRpb25zL2ZpbGVzLy5iYXNoX2hpc3RvcnktcWVtdS1hbWQ2NDwvYT4pPGJyPg0KJmd0OyA8YnI+
DQo8YnI+DQpUaGUgaW5pdHJhbWZzIGlzIGJ1aWx0IHZpYSB0aGlzIHJlY2lwZTo8YnI+DQo8YSBo
cmVmPSJodHRwczovL2dpdGh1Yi5jb20vc2llbWVucy9qYWlsaG91c2UtaW1hZ2VzL3RyZWUvbWFz
dGVyL3JlY2lwZXMtY29yZS9ub24tcm9vdC1pbml0cmFtZnMiIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9zaWVtZW5zL2phaWxob3VzZS1pbWFnZXMv
dHJlZS9tYXN0ZXIvcmVjaXBlcy1jb3JlL25vbi1yb290LWluaXRyYW1mczwvYT48YnI+DQo8YnI+
DQpZb3UgY2FuIGZpbmQgdGhlIGJ1aWxkcm9vdCBjb25maWdzIGZvciB0aGUgZGlmZmVyZW50IGFy
Y2hzIHRoZXJlLCBhcyB3ZWxsIGFzIGEgPGJyPg0KZmV3IHByZS1zZXR0aW5ncyBmb3IgY29udmVu
aWVuY2UgcmVhc29ucy48YnI+DQo8YnI+DQpXZSBjYWxsIHRoZSBwYXJhbWV0ZXJzIHRvIHNwZWNp
ZnkgYSBjcGlvLWJhc2VkIGluaXRyYW1mcyBhbHNvIGluaXRyZCwganVzdCBsaWtlIDxicj4NCnRo
ZSBrZXJuZWwgZG9lcyBpbiBtYW55IHBsYWNlcy4gTWF5YmUgJnF1b3Q7aW5pdHJhbWZzJnF1b3Q7
IHdvdWxkIGhhdmUgYmVlbiBtb3JlIGNvcnJlY3QsIDxicj4NCmJ1dCwgd2VsbC4uLjxicj4NCjxi
cj4NCkphbjxicj4NCjxicj4NCiZndDsgVGhhbmtzLDxicj4NCiZndDsgPGJyPg0KJmd0OyBXYXlu
ZTxicj4NCiZndDsgPGJyPg0KJmd0OyBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAzOjQzIFBNIFJh
bGYgUmFtc2F1ZXIgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNi
dXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwv
YT4gPGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90
aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5z
YnVyZy5kZTwvYT4mZ3Q7Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoEhp
LDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgT24gNi8xMi8xOSA5OjMyIFBNLCBXYXluZSB3
cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBJJiMzOTttIHNvcnJ5IGFib3V0IHRoZSBmb3Jt
YXR0aW5nLsKgIEl0IGRpZG4mIzM5O3QgbG9vayBsaWtlIHRoYXQgYmVmb3JlIEkgc2VudCBpdC48
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IEkgd2lsbCBkb3Vi
bGUgY2hlY2sgbXkgbGludXgteDg2LWRlbW8gY2VsbCBjb25maWcgYWdhaW4gZm9yIHRoZSBzZXJp
YWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBJUlEgbWFwcGluZy4gQWxzbyBJIHdpbGwgYnVpbGQg
aW4gdGhlIENPTkZJR19DUkFTSF9DRUxMX09OX1BBTklDIGRlZmluZTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IGZvciBoZWxwIGdvaW5nIGZvcndhcmQuPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyBDYW4gdGhlICZxdW90O2phaWxob3VzZSBjZWxsIGxpbnV4JnF1
b3Q7IGNvbW1hbmQgdGFrZSBhbiBpbml0cmFtZnMgaW1hZ2UgKC5pbWcpPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgdGhyb3VnaCB0aGUgJnF1b3Q7LWkgb3B0aW9uJnF1b3Q7IG9yIGRvZXMgaXQgbmVl
ZCB0byBiZSBhbiBpbml0cmQ/wqAgSWYgaW5pdHJkPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAg
wqBHb29kIHF1ZXN0aW9uLiBUaGUgLWkgb3B0aW9uIGRvZXMgbm90aGluZyBlbHNlIHRoYW4gbG9h
ZGluZyB0aGUgaW1hZ2UgLTxicj4NCiZndDvCoCDCoCDCoGFzIGEgYmluYXJ5IC0gdG8gYSBSQU0g
cmVnaW9uIGFuZCBwcm9wYWdhdGUgaXRzIGxvY2F0aW9uLiBTbyBJJiMzOTtkIGFzc3VtZTxicj4N
CiZndDvCoCDCoCDCoHRoYXQgc3VwcG9ydCBmb3IgZGlmZmVyZW50IGZvcm1hdHMgb25seSBkZXBl
bmQgaWYgeW91ciBrZXJuZWwgaGFzPGJyPg0KJmd0O8KgIMKgIMKgYnVpbHRpbiBzdXBwb3J0IGZv
ciB0aGUgZXZlbnR1YWwgZm9ybWF0Ljxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
b25seSwgY2FuIHlvdSBwb2ludCBtZSB0byBhbiBleGFtcGxlIHg4NiByb290ZnMuY3BpbyBpbWFn
ZT/CoCBJJiMzOTttIGhhdmluZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHRyb3VibGUgaW5zdGFs
bGluZyBCdWlsZHJvb3Qgb24gbXkgbWFjaGluZS48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDC
oEJ1aWxkcm9vdCBpcyB0aGUgcGVyZmVjdCBzd2lzcyBhcm15IGtuaWZlIGZvciBub24tcm9vdCBp
bml0cmRzLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIFJhbGY8YnI+DQomZ3Q7IDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVGhhbmtzIGFnYWlu
LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IFdheW5lPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAxOjE3IFBNIFJhbGYg
UmFtc2F1ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhbGYu
cmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVy
QG90aC1yZWdlbnNidXJnLmRlPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJh
bXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBv
dGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0
PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5z
YnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8
L2E+Jmd0OyZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoEhpIFdheW5lLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoE9uIDYvMTIvMTkgMzo1NSBQTSwgV2F5bmUgd3JvdGU6
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgUmFsZi9KYW4sPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
OyDCoEFyZSB5b3Ugc3VyZSB5b3UgcmVtb3ZlIHRoZSBkZXZpY2UgZnJvbSB0aGUga2VybmVsIGNt
ZGxpbmU/ICpZZXMsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHRoZXJlPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgaXMgbm8gdHR5UyogZGV2aWNlIGluIG15IHJvb3Qg
bGludXggY21kbGluZSo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0OyAtIEFyZSB5
b3Ugc3VyZSB0aGF0IHRoZXJlIGRvZXNuJiMzOTt0IHNwYXduIGEgdHR5PyBDaGVjayB3aXRoPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHN5c3RlbWN0bC4gKk5vPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDsgdHR5IGFzIGZhciBhcyBJIGNhbiB0ZWxsLCB2ZXJpZmllZCB3
aXRoICZxdW90O2xzb2YgfCBncmVwIHR0eVMmcXVvdDsuwqAgVGhlIGxzb2Y8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0OyBjb21tYW5kIHN0b3BzIHdvcmtpbmcgYWZ0ZXIgdGhlIGNy
YXNoIHRob3VnaCo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqBwbGVhc2UgdXNlIHBsYWluIHRleHQgbWFpbHMuIEl0JiMzOTtzIGdldHRpbmcgaGFy
ZCB0byByZWFkIDotKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDsgLSBsc29mIHwgZ3JlcCB0dHlTPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDsgLSBUaGUgcm9vdC1jZWxsIG1pZ2h0IHJlY2VpdmUgdGhlIHNlcmlhbCBkZXZp
Y2UmIzM5O3MgaW50ZXJydXB0LCB3aGlsZSBpdHM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0OyDCoCBwb3J0cyBhcmUgYXNzaWduZWQgdG8gdGhlIG5vbi1yb290IGNlbGwuIERvZXMg
dGhlIGNyYXNoIGhhcHBlbiB3aGVuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsg
wqAgeW91IHR5cGUgaW4gYSBjaGFyYWN0ZXIgdG8gdGhlIHNlcmlhbCBsaW5lPyAqVGhpcyBpcyBw
b3NzaWJsZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgZG8geW91PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDsgaGF2ZSBhbiBleGFtcGxlIG9mIGhvdyBJIHdvdWxkIGFj
Y29tcGxpc2ggYXNzaWduaW5nIHRoZSBpbnRlcnJ1cHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgKElSUSA0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgZm9yIHR0eVMw
KSB0byB0aGUgbm9uLXJvb3Q/wqAgVG8gcnVsZSBvdXQgdGhlIGludGVycnVwdCBjb25jZXJuLio8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBDb21w
YXJlIGxpbnV4LXg4Ni1kZW1vLmMuIFRoZSAucGluX2JpdG1hcCBmaWVsZCBkZW5vdGVzIHRoZSBp
bnRlcnJ1cHRzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHRoYXQgYXJlIHJvdXRlZCB0
byB0aGUgY2VsbC4gSWYgeW91IHVzZSB0aGUgb3JpZ2luYWwgbGludXgteDg2LWRlbW8uYyw8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgdGhlbiBpbnRlcnJ1cHQgNCBzaG91bGQgYWxyZWFk
eSBiZSByb3V0ZWQgdG8gdGhlIGNlbGwuPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgQUZBSUNULCBpbiBsaW51eC14ODYtZGVtby5jLCB3ZSBhc3Np
Z24gSVJRIDMgJmFtcDsgNC4gSW4geW91ciBjYXNlLCB3ZSBhbHNvPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoHJlbW92ZSB0aGUgb3RoZXIgSVJRIGZyb20gdGhlIHJvb3QgY2VsbCAtIElS
USAzIHNob3VsZCBiZSBjb21tZW50ZWQgb3V0Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoEJUVywgYSBoZWxwZnVsIGRlYnVnZ2luZyBmZWF0dXJl
Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBlY2hvICZxdW90OyNkZWZpbmUgQ09ORklH
X0NSQVNIX0NFTExfT05fUEFOSUMgMSZxdW90OyAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqBpbmNsdWRlL2h5cGVydmlzb3IvY29uZmlnLmg8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBUaGlzIHdpbGwgbGV0IHRoZSByb290
IGNlbGwgcHJpbnQgYSBzdGFja2R1bXAgd2hpY2ggZ2l2ZXMgeW91IGEgaGludDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqB3aGF0IGNvZGVwYXRoIGNhdXNlZCB0aGUgY3Jhc2guPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIEluIHRoaXMgY2FzZSwgYXNzaWduIHRo
ZSBpbnRlcnJ1cHQgdG8gdGhlIG5vbi1yb290IGNlbGwuIFlvdTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqB3aWxsIG5lZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0OyDC
oCBpdCBpbiBhbnkgY2FzZSB0aGVyZSBvbmNlIHlvdSBoYXZlIGEgaW5pdHJkIGFuZCB3YW50IHRv
IHR5cGUgaW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgc3R1ZmYuPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
OyBTbyB0aGVyZSBtdXN0IGJlIHNvbWUgcmVhc29uIHdoeSB0aGUgY3Jhc2ggaGFwcGVucy4gVGhl
IGhhcmQgd2F5IGlzIHRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgYWRkIDgy
NTAubnJfdWFydHM9MCBpbiB5b3VyIGtlcm5lbCBjbWRsaW5lIG9mIHRoZSByb290IGNlbGwuICpJ
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGNhbiB1c2U8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0OyB0aGlzIG1ldGhvZCBmb3Igbm93IHRvIGNvbnRpbnVlIGJvb3Rpbmcg
dGhlIG5vbi1yb290IGxpbnV4Lio8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7Jmd0OyDCoCDCoCDCoCDCoGlmIEkgbGVhdmUgb3V0IHRoZSBwaW8gbWFw
cGluZyBpbiB0aGUgbm9uLXJvb3QgbGludXgsIGFuZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7Jmd0OyBhbG9sb3RoYXQgYmxvY2sgaW4gdGhlIHJvb3QgY2VsbCBpbnN0ZWFkIHRo
ZW4gdGhlIG5vbi1yb290IGxpbnV4PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGdldHMg
YTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7Jmd0OyBQSU8gcmVhZCBmYXVsdCBv
biAmcXVvdDsweDNGOSZxdW90OyB3aGlsZSBib290aW5nLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7Jmd0OyDCoCDCoCDCoCDCoFJhbGYgbWVudGlvbmVkIHRoYXQgTGludXggd291
bGQgbm90IHRyeSBlbnVtZXJhdGUgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGRl
dmljZSBpZjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7Jmd0OyBpdHMgc2V0IHRv
IC0xICjCoFsweDNmOC84IC4uLiAweDNmZi84XSA9IC0xKcKgICwgYnV0IHRoZSBub24tcm9vdDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBzZWVtcyB0bzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7Jmd0OyBhdHRlbXB0IHRvIGRvIHNvbWV0aGluZyB3aXRoIGl0IGFueXdh
eTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0OyZndDsgJnF1b3Q7WyDCoCDCoDAuOTU2MTQ2XVNlcmlhbDogODI1
MC8xNjU1MCBkcml2ZXIsIDEgcG9ydHMsIElSUSBzaGFyaW5nPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoGVuYWJsZWQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
OyZndDsgJnF1b3Q7RkFUQUw6IEludmFsaWQgUElPIHJlYWQsIHBvcnQ6IDNmOTogc2l6ZSAxJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0OyBIbW0uIEF0IGxlYXN0IHRoYXQmIzM5O3Mgd2hhdCBJIHRob3VnaHQu
IEkgZG9uJiMzOTt0IGtub3cgaG93IGVudW1lcmF0aW9uIG9mPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDsgcGxhdGZvcm0gZGV2aWNlcyB3b3JrcyBleGFjdGx5LCBidXQgcmVjb25z
aWRlcmluZyB0aGlzLCB0aGUgYmVoYXZpb3VyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDsgYWJvdmUgbWFrZXMgc2Vuc2U6IEhvdyB3b3VsZCBpdCBrbm93IHRoYXQgYSBwbGF0Zm9y
bSBkZXZpY2UgaXMgbm90PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgcHJlc2Vu
dCwgZGVwZW5kaW5nIG9mIHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBwaW9fYml0bWFwLjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqDCoCpTaW5jZSBJIGRvPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDsgdGVjaG5pY2FsbHkgaGF2ZSB0d28gc2VyaWFsIHBvcnRzLCBpcyB0
aGVyZSBhIHdheSAodmlhIGNvbW1hbmQgbGluZSBvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7IGtlcm5lbCBjb25maWcgZm9yIGV4KSB0byBoYXJkY29kZSB3aGF0IHRoZSBub24t
cm9vdCB3b3VsZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBlbnVtZXJhdGUgZm9yPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgdGhlIFVBUlQgd2hlbiBpdHMgYm9vdGlu
ZyB1cD/CoCBNZWFuaW5nLCBmb3JjZSBpdCB0byAmcXVvdDtzZWUmcXVvdDsgdGhlIDB4MmY4PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgc2VyaWFsIHBvcnQgYXMgdHR5UzAgaW5z
dGVhZCBvZiAweDNmOCB3aGVuIGJvb3RpbmcgdXA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0OyBhbmQqKsKgQ09ORklHX1NFUklBTF84MjUwX1JVTlRJTUVfVUFSVFMgPSAxKiouwqAg
VGhhdCB3YXkgaWYgeW91IGhhZCBzYXk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
OyB0aHJlZSBzZXJpYWwgcG9ydHMgYW5kIHRocmVlIGNlbGxzICgxIHJvb3QsIDIgbm9uLXJvb3Qg
bGludXgpIHRoZW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgZWFjaDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7IGNvdWxkIGhhdmUgdGhlaXIgb3duIHNlcGFyYXRlIGRl
ZGljYXRlZCB0dHlTMC4qPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgSGF2ZSBhIGxvb2sgYXQgdGhlIGRvY3VtZW50YXRpb24gb2YgdGhlIDgyNTAg
ZHJpdmVyLCBkb24mIzM5O3Qga25vdyBieTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBo
ZWFydC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqBIVEgsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoMKgIFJhbGY8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7ICo8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0OyAqPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDsgQXMgZmFyIGFzIGp1c3QgYm9vdGluZyB0aGUgbm9uLXJvb3QgYmVzaWRlcyB0aGUgc2Vy
aWFsIGNvbmNlcm4sIEk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0OyBoYXZlbiYj
Mzk7dCBwcm92aWRlZCBhbiBpbml0cmFtZnMgdG8gbXkgbm9uLXJvb3QgbGludXggeWV0LsKgIEkg
d291bGQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgbGlrZSB0bzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7IHByb2JhYmx5IGJvb3QgaXQgd2l0aCBhIHNpbXBsZSByYW1k
aXNrIGlmIHBvc3NpYmxlIHRvIGdldCBhIHBvaW50PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoHdoZXJlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgSSBjYW4gbG9nIGlu
Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7ICo8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0OyAqPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgVGhh
bmtzLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7IFdheW5lPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
OyBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCA2OjQzIEFNIFJhbGYgUmFtc2F1ZXI8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1y
ZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxm
LnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5k
ZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJh
bXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBv
dGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUi
IHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3Ro
LXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNi
dXJnLmRlPC9hPiZndDsmZ3Q7Jmd0OyZndDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgSGks
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgT24gNi8xMS8xOSAxMTowNSBQTSwgV2F5bmUgd3JvdGU6PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgSmFuL1JhbGYsPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBJIHdhcyBhYmxlIHRvIGdldCBwYXN0
IGlzc3VlcyAxIGFuZCAzIGFib3ZlIGJ5IHVzaW5nIEphbiYjMzk7czxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqBrZXJuZWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgY29uZmlnPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgZnJvbSB0aGlzIHRocmVhZDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZm9y
dW0vIyFzZWFyY2hpbi9qYWlsaG91c2UtZGV2L1JlJDNBJDIwRmFpbGVkJDIwdG8kMjBib290JDIw
amFpbGhvdXNlJTdDc29ydDpyZWxldmFuY2UvamFpbGhvdXNlLWRldi9NN1VPODlYRklrMC9RaTQw
RER1TUJBQUoiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBz
Lmdvb2dsZS5jb20vZm9ydW0vIyFzZWFyY2hpbi9qYWlsaG91c2UtZGV2L1JlJDNBJDIwRmFpbGVk
JDIwdG8kMjBib290JDIwamFpbGhvdXNlJTdDc29ydDpyZWxldmFuY2UvamFpbGhvdXNlLWRldi9N
N1VPODlYRklrMC9RaTQwRER1TUJBQUo8L2E+JnF1b3Q7Ljxicj4NCiZndDsgPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBUaGUgRE1BIGlzc3VlIHdhcyByZXNvbHZlZCBieSBk
aXNhYmxpbmcga2VybmVsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oG9wdGlvbsKgQ09ORklHX0lTQV9ETUFfQVBJPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDsgYXMgc3RhdGVkIGluIGFub3RoZXIgdGhyZWFkLCBhbmQgcmVmbGVj
dGVkIGluIHRoZSBjb25maWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgZmlsZSBhYm92
ZS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFNvIG5vdyBJIHRoaW5rIGkm
IzM5O3ZlIGFsbW9zdCBnb3QgdGhlIG5vbi1yb290IGxpbnV4IGJvb3RpbmcuwqAgSSYjMzk7bTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBzdHVjayBhdDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHRoZSBwb2ludCB3aGVyZSBp
dHMgdHJ5aW5nIHRvIG1vdW50IGEgZmlsZXN5c3RlbSBhbmQgc2luY2U8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgaSYjMzk7bSBub3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0OyBwcm92aWRpbmcgYW4gaW5pdHJhbWZzIGl0IHBhbmljcy48YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqBQZXJmZWN0ITxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBTaW1pbGFyIHRvIHRoZSBvdXRw
dXQgYmVsb3c6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBbIDEuMDgwMTc4
XSBWRlM6IENhbm5vdCBvcGVuIHJvb3QgZGV2aWNlICZxdW90OyhudWxsKSZxdW90OyBvcjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB1bmtub3duLWJsb2NrKDAsMCk6
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgZXJyb3IgLTY8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBbIDEuMDg3NjYy
XSBQbGVhc2UgYXBwZW5kIGEgY29ycmVjdCAmcXVvdDtyb290PSZxdW90OyBib290IG9wdGlvbjs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgaGVyZSBhcmUgdGhlPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgYXZhaWxhYmxlIHBhcnRpdGlvbnM6PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgWyAxLjA5NjAxM10g
S2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRvIG1vdW50PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoHJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgZnMgb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0OyB1bmtub3duLWJsb2NrKDAsMCk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7IEkgaGF2ZSBqdXN0IGEgY291cGxlIG1vcmUgcXVlc3Rpb25zOjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IDEuIEluIGdlbmVyYWwsIGlzIGl0IHRy
dWUgdGhhdCBhbiBpbm1hdGUgd2lsbCB0YWtlb3ZlciBjb250cm9sPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGZyb20gdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDsgcm9vdCBvZiBhbnkgcmVzb3VyY2UgaW4gdGhlIGZvbGxv
d2luZyBhcnJheXMsIG9yIGFyZSB0aGVyZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBz
b21lIGNhc2VzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsg
d2hlcmUgdGhleSBnZXQgJnF1b3Q7c2hhcmVkJnF1b3Q7IGJldHdlZW4gdGhlIHJvb3QgYW5kIGlu
bWF0ZT88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBEZXBlbmRzLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgwqAgwqAgwqBBLiAmcXVvdDsubWVtX3JlZ2lvbnMmcXVvdDsgLSZndDsgU2hhcmVkPzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoE1heSBiZSBzaGFyZWQgd2l0aCB0aGUgcm9vdCBjZWxsIChpLmUuLCBp
ZiB0aGUgcmVnaW9uIGhhcyB0aGUgZmxhZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqBKQUlMSE9VU0VfTUVNX1JPT1RTSEFSRUQgc2V0KS48YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgQi4gJnF1b3Q7LmlycWNoaXBzJnF1b3Q7IC0mZ3Q7IFNoYXJlZD88
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqBTaGFyZWQgd2l0aCB3aG9tPyBPbmx5IG9uZSBndWVzdCBydW5z
IG9uIGEgQ1BVLiBUaGlzIGd1ZXN0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHdpbGwg
aGF2ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBmdWxsIGFjY2Vz
cyB0byB0aGUgaXJxY2hpcC4gU29tZSBhY2Nlc3NlcyBtdXN0IGJlIGludGVyY2VwdGVkLjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqBDLiAmcXVvdDsucGlvX2JpdG1hcCZxdW90OyAt
Jmd0OyBJbm1hdGUgdGFrZXMgY29udHJvbCBvZiB0aGVzZSBpZjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqBtYXRjaGluZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7IGJldHdlZW4gaW5tYXRlIGFuZCByb290PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgRXhj
bHVzaXZlIGNvbnRyb2wuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoEQuICZxdW90
Oy5wY2lfZGV2aWNlcyZxdW90OyAtJmd0OyBJbm1hdGUgdGFrZXMgY29udHJvbD88YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqBFeGNsdXNpdmUgY29udHJvbC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKg
IMKgIMKgRS4gJnF1b3Q7LnBjaV9jYXBzJnF1b3Q7IC0mZ3Q7IElubWF0ZSB0YWtlcyBjb250cm9s
Pzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoEV4Y2x1c2l2ZSBjb250cm9sLjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAy
LiBBbG9uZyB0aGUgc2FtZSBsaW5lcywgZ29pbmcgYmFjayB0byBteSB0dHlTMCBpc3N1ZTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBtZW50aW9uZWQgYWJvdmU8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB3aGlsZSB0cnlpbmcgdG8gc2hhcmUgaXQ6
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoElmIEkgYWxs
b2NhdGUgdGhlIGZvbGxvd2luZyB0byB0aGUgbGludXggbm9uIHJvb3Q8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgY2VsbCAoYW5kIHNldDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7IHRvIC0xIGluIHRoZSByb290KTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oEJUVywgdGhlcmUmIzM5O3MgZ2VuZXJhbGx5IG5vIG5lZWQgdG8gc2V0IC0xIGluIHRoZSByb290
IGNlbGwgLS08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgaXQgd2lsbCBiZTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB0YWtlbiBhd2F5IHdoZW4gdGhlIG5v
bi1yb290IGNlbGwgaXMgY3JlYXRlZC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
LnBpb19iaXRtYXAgPSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDsgwqAgwqAgwqAgwqAgwqAgWzB4M2Y4LzggLi4uIDB4M2ZmLzhdID0gMHgwMMKgIMKgLyog
c2VyaWFsIDIqLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAg
wqAgwqBUaGVuIG9uIHRoZSByb290IGNlbGwgSSByYW5kb21seSBnZXQgYSBQSU8gcmVhZCBmYXVs
dCBvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmcXVvdDsweDNG
RSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHdo
ZW4gdGhlIG5vbi1yb290IGlzIGJvb3RpbmcsIGkmIzM5O20gbm90IHN1cmUgd2hhdCBwcm9jZXNz
IGlzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGNhdXNpbmc8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgdGhpcy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAtIEFy
ZSB5b3Ugc3VyZSB5b3UgcmVtb3ZlIHRoZSBkZXZpY2UgZnJvbSB0aGUga2VybmVsIGNtZGxpbmU/
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoC0gQXJlIHlvdSBzdXJl
IHRoYXQgdGhlcmUgZG9lc24mIzM5O3Qgc3Bhd24gYSB0dHk/IENoZWNrIHdpdGg8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgc3lzdGVtY3RsLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAtIGxzb2YgfCBncmVwIHR0eVM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgLSBUaGUgcm9vdC1jZWxsIG1pZ2h0IHJlY2VpdmUgdGhlIHNl
cmlhbCBkZXZpY2UmIzM5O3MgaW50ZXJydXB0LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqB3aGlsZSBpdHM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgwqAg
cG9ydHMgYXJlIGFzc2lnbmVkIHRvIHRoZSBub24tcm9vdCBjZWxsLiBEb2VzIHRoZSBjcmFzaDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBoYXBwZW4gd2hlbjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqDCoCB5b3UgdHlwZSBpbiBhIGNoYXJhY3RlciB0byB0
aGUgc2VyaWFsIGxpbmU/PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgwqAgSW4gdGhpcyBjYXNlLCBhc3Np
Z24gdGhlIGludGVycnVwdCB0byB0aGUgbm9uLXJvb3QgY2VsbC4gWW91PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoHdpbGwgbmVlZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqDCoCBpdCBpbiBhbnkgY2FzZSB0aGVyZSBvbmNlIHlvdSBoYXZlIGEgaW5pdHJk
IGFuZCB3YW50IHRvIHR5cGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgaW4gc3R1ZmYu
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgU28gdGhlcmUgbXVzdCBiZSBzb21lIHJlYXNvbiB3aHkgdGhl
IGNyYXNoIGhhcHBlbnMuIFRoZSBoYXJkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHdh
eSBpcyB0bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBhZGQgODI1
MC5ucl91YXJ0cz0wIGluIHlvdXIga2VybmVsIGNtZGxpbmUgb2YgdGhlIHJvb3QgY2VsbC48YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDsgwqAgwqAgwqAgwqBpZiBJIGxlYXZlIG91dCB0aGUgcGlvIG1hcHBpbmcgaW4g
dGhlIG5vbi1yb290IGxpbnV4LCBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0OyBhbG9sb3RoYXQgYmxvY2sgaW4gdGhlIHJvb3QgY2VsbCBpbnN0ZWFkIHRo
ZW4gdGhlIG5vbi1yb290IGxpbnV4PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoGdldHMgYTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7IFBJTyByZWFkIGZhdWx0IG9uICZxdW90OzB4M0Y5JnF1b3Q7IHdoaWxlIGJvb3RpbmcuPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBS
YWxmIG1lbnRpb25lZCB0aGF0IExpbnV4IHdvdWxkIG5vdCB0cnkgZW51bWVyYXRlIHRoZTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBkZXZpY2UgaWY8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBpdHMgc2V0IHRvIC0xICjCoFsweDNmOC84IC4uLiAw
eDNmZi84XSA9IC0xKcKgICwgYnV0IHRoZSBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqBzZWVtcyB0bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7IGF0dGVtcHQgdG8gZG8gc29tZXRoaW5nIHdpdGggaXQgYW55d2F5
Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgJnF1b3Q7WyDCoCDCoDAuOTU2
MTQ2XVNlcmlhbDogODI1MC8xNjU1MCBkcml2ZXIsIDEgcG9ydHMsIElSUSBzaGFyaW5nPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGVuYWJsZWQmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAmcXVvdDtGQVRBTDogSW52
YWxpZCBQSU8gcmVhZCwgcG9ydDogM2Y5OiBzaXplIDEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqBIbW0uIEF0IGxlYXN0IHRoYXQmIzM5O3Mgd2hhdCBJIHRob3VnaHQuIEkgZG9uJiMzOTt0IGtu
b3cgaG93PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGVudW1lcmF0aW9uIG9mPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHBsYXRmb3JtIGRldmljZXMgd29y
a3MgZXhhY3RseSwgYnV0IHJlY29uc2lkZXJpbmcgdGhpcywgdGhlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoGJlaGF2aW91cjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqBhYm92ZSBtYWtlcyBzZW5zZTogSG93IHdvdWxkIGl0IGtub3cgdGhhdCBhIHBsYXRm
b3JtIGRldmljZSBpcyBub3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgcHJlc2VudCwgZGVwZW5kaW5nIG9mIHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBwaW9fYml0
bWFwLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoEFueXdheSwgODI1MCBkcml2ZXJzIGhhdmUgc29tZSBj
bWRsaW5lIHBhcmFtZXRlcnMgdGhhdCBjYW4gYmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgdXNlZCB0bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBjb250
cm9sIGluaXRpYWxpc2F0aW9uIChlLmcuLCBzZWUgdGhlIG5yX3VhcnRzIHBhcmFtZXRlcnMgYWJv
dmUpLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoElzIGl0IHBvc3NpYmxlIHRvIG1hcCB0aGUg
c2FtZSBwaW8gYmxvY2sgaW4gYm90aCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
cm9vdCBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBu
b24tcm9vdCB3aXRoIGEgZGlmZmVyZW50IG1hc2s/wqAgT3IgZG9lcyB0aGUgbm9uLXJvb3QganVz
dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBvdmVycmlkZSBpdD88
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBJdCBzZWVtcyBs
aWtlIHRoZSBsYXR0ZXIgaXMgdHJ1ZS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBFeGFjdGx5LiBUaGF0
JiMzOTtzIG5vdCBhKSBwb3NzaWJsZSwgYW5kIGIpIGRvZXMgbm90IHJlYWxseSBtYWtlPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHNlbnNlLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoMKgIFJh
bGY8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDsgVGhhbmtzIGFnYWluIEphbiBhbmQgUmFsZiBmb3IgeW91ciBoZWxw
IGdldHRpbmcgdG8gdGhpcyBwb2ludC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgT24gVHVl
LCBKdW4gMTEsIDIwMTkgYXQgMjoxMyBQTSBXYXluZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhY2Vkcml2ZTE1MDNAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+cmFjZWRyaXZlMTUwM0BnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnJhY2Vkcml2ZTE1MDNAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFjZWRyaXZl
MTUwM0BnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnJhY2Vkcml2ZTE1MDNAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFjZWRy
aXZlMTUwM0BnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhY2Vkcml2
ZTE1MDNAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFjZWRyaXZlMTUwM0BnbWFpbC5jb208
L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFjZWRyaXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5yYWNlZHJpdmUxNTAzQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWNlZHJpdmUxNTAzQGdtYWlsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPnJhY2Vkcml2ZTE1MDNAZ21haWwuY29tPC9hPiZndDsgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86cmFjZWRyaXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWNlZHJp
dmUxNTAzQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpyYWNlZHJpdmUxNTAzQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhY2Vkcml2
ZTE1MDNAZ21haWwuY29tPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhY2Vkcml2
ZTE1MDNAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFjZWRyaXZlMTUwM0BnbWFpbC5jb208
L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhY2Vkcml2ZTE1MDNAZ21haWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cmFjZWRyaXZlMTUwM0BnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWNlZHJpdmUx
NTAzQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhY2Vkcml2ZTE1MDNAZ21haWwuY29tPC9h
PiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWNlZHJpdmUxNTAzQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPnJhY2Vkcml2ZTE1MDNAZ21haWwuY29tPC9hPiZndDsmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFjZWRyaXZlMTUwM0BnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5yYWNlZHJpdmUxNTAzQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cmFjZWRyaXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5r
Ij5yYWNlZHJpdmUxNTAzQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhY2Vkcml2ZTE1MDNAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+cmFjZWRyaXZlMTUwM0BnbWFpbC5jb208L2E+ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnJhY2Vkcml2ZTE1MDNAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
cmFjZWRyaXZlMTUwM0BnbWFpbC5jb208L2E+Jmd0OyZndDsmZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgSmFuICZhbXA7IFJhbGY6PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgSSBoYXZlIGEgbGl0dGxlIGdvb2QgbmV3cywg
SSBoYXZlIHN1Y2Nlc3NmdWxseSBnb3R0ZW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
dGhlIG5vbi1yb290PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoGxpbnV4IHRvIGRpc3BsYXkgc29tZSBzdGFydHVwIG91dHB1dCBiYXNlZCBvbiB5
b3VyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHN1Z2dlc3Rpb25zLjxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBBbHNvLCB0aGVyZSBt
dXN0IGhhdmUgYmVlbiBzb21lIHNtYWxsIGRpZmZlcmVuY2UgYmV0d2Vlbjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqB0aGUgc3RvY2s8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgbGludXgteDg2LWRlbW8gY2VsbCBjb25maWcgYW5kIHRo
ZSBvbmUgSSB0d2Vha2VkLsKgIEk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgd2VudCBi
YWNrIHRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoHRoZSBvcmlnaW5hbCBhbmQgbWFkZSBzb21lIG1pbm9yIGNoYW5nZXMgYW5kIGl0IHN0YXJ0
ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgZGlzcGxheWluZzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB0aGUgc2VyaWFsIG91dHB1
dCBub3cgZm9yIHRoZSBub24tcm9vdCBub2RlLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoEkgZW5kZWQgdXAgbWFraW5nIHRoZSByb290IGNlbGwgdGhlIHByaW1h
cnkgdXNlciBvZiB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgdHR5UzA8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgZGV2aWNlLCBh
bmQganVzdCBoYXZpbmcgdGhlIG5vbi1yb290IGxpbnV4IG91dHB1dCB0byB0aGU8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgaHlwZXJ2aXNvcjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB2aXJ0dWFsIGNvbnNvbGUg
KGNvbnNvbGU9amFpbGhvdXNlKS7CoCBJbiBteSBzZXR1cCwgdGhlcmU8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgYXBwZWFycyB0bzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBiZSBzb21lIHByb2Nlc3Mgc3RpbGwg
YXR0ZW1wdGluZyB0byB1c2UgdGhlIHR0eVMwPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oHJhbmRvbWx5IG9uIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqByb290IGxpbnV4LCBhbmQgdGhhdCBjYXVzZXMgdGhlIGh5cGVydmlzb3Ig
dG8gaGFsdCBpdCBpZjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBJIGRvbiYjMzk7dDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBsZWF2
ZSBpdCBpbiB0aGUgUElPIGFycmF5LsKgIE5vdCBzdXJlIHdobyBpcyBkb2luZyBpdC48YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFRoaXMgaXMgd2hlcmUgaSYjMzk7bSBhdCBub3cu
wqAgVGhlIG5vbi1yb290IGxpbnV4IGtlZXBzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oHJ1bm5pbmcgaW50bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqBwb2ludHMgd2hlcmUgaXQgdHJpZXMgdG8gYWNjZXNzIFBJTyBhbmQgZ2V0cyBw
YXJrZWQ6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgMS4gRmly
c3QgY3Jhc2g6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgWyDC
oCDCoDAuNDI0OTI1XWt3b3JrZXIvdTY6MCAoMjcpIHVzZWQgZ3JlYXRlZCBzdGFjazxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBkZXB0aDogMTQ2NTY8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgYnl0ZXMgbGVmdDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBbIMKgIMKgMC40MjU4MDdd
ZnV0ZXggaGFzIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiA0LCA2NTUzNjxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBieXRlcyk8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJnF1b3Q7RkFUQUw6IEludmFsaWQg
UElPIHdyaXRlLCBwb3J0OiA3MDogc2l6ZSAxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoC4uLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBQYXJraW5nIENQVSAzIChDZWxsOiAmcXVv
dDtsaW51eC14ODYtZGVtbyZxdW90Oyk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqBBY2NvcmRpbmcgdG8gL3Byb2MvaW9wb3J0cywgNzAgaGFzIHRvIGRvIHdpdGgg
dGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoFJlYWx0aW1lIGNsb2NrPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoChydGMwKS7CoCBJ
IHdhcyBhYmxlIHRvIHRlbXBvcmFyaWx5IGFkZCB0aGUgNzAgbWFwcGluZyB0byB0aGU8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgbm9uLXJvb3Qg
bGludXgsIGJ1dCBzaG91bGQgaXQgYmUgdGhlcmUgYXQgYWxsP8KgIEkgdHJpZWQ8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgdG8gZGlzYWJsZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBSVEMgc3VwcG9ydCBpbiB0aGUgZ3Vlc3Qga2Vy
bmVsIGNvbmZpZy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoDIuIE9uIHRoZSBu
ZXh0IGF0dGVtcHQsIEkgdGhlbiBnb3QgZnVydGhlciB3aXRoIGEgY3Jhc2g8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgdHJ5aW5nIHRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGluaXRpYWxpemUgU2VyIGRldmljZSB0dHlTMDo8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmcXVvdDtbIMKgIMKgMC45
NTYxNDZdU2VyaWFsOiA4MjUwLzE2NTUwIGRyaXZlciwgMSBwb3J0cywgSVJRPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoHNoYXJpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgZW5hYmxlZCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmcXVvdDtGQVRBTDogSW52YWxpZCBQSU8gcmVhZCwgcG9y
dDogM2Y5OiBzaXplIDEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgLi4uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoFBhcmtpbmcgQ1BVIDMgKENlbGw6ICZxdW90O2xpbnV4LXg4Ni1k
ZW1vJnF1b3Q7KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoEkg
Y2FuIGdldCBhcm91bmQgdGhhdCBpZiBJIGFsbG93IHRoZSBub24tcm9vdCBhY2Nlc3MgaW48YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgaXRzIHBpbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB0YWJsZSwgYnV0IHRoZW4gSSBoYXZlIGEg
cHJvYmxlbSBhYm92ZSB3aXRoIHRoZSByb290IGxpbnV4PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoHJhbmRvbWx5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHRyeWluZyB0byB1c2UgaXQuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAzLiBOb3cgd2l0aCB0aGUgdGVtcG9yYXJ5IGFkanVzdG1lbnRz
IHRvIHRoZSBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBwaW8gdGFibGU8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgYWJv
dmUgSSBnZXQgaGVyZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmcXVvdDtbIMKgIMKgMC45NzIzOTldY2xvY2tzb3VyY2U6U3dpdGNoZWQgdG8gY2xvY2tzb3Vy
Y2UgdHNjJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZxdW90O0ZBVEFMOiBJbnZhbGlkIFBJTyByZWFkLCBwb3J0OiA4Nzogc2l6ZSAx
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoC4uLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqBQYXJraW5nIENQVSAzIChDZWxsOiAmcXVvdDtsaW51eC14ODYtZGVtbyZxdW90Oyk8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBBY2NvcmRpbmcgdG8gcHJv
Yy9pb3BvcnRzIHRoaXMgb25lIGhhcyB0byBkbyB3aXRoICZxdW90O2RtYSBwYWdlPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHJlcXVlc3QmcXVv
dDsuIEl0IGlzbiYjMzk7dCBtYXBwZWQgaW4gbXkgcm9vdCBsaW51eCBQSU8gb3Igbm9uLXJvb3Q8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgbGludXggYXJyYXkuPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBBc2lkZSBmcm9tIHRoZSBzZXJpYWwgY29u
ZmxpY3QsIGl0IHNlZW1zIGxpa2UgdGhlc2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
c2hvdWxkIHJlbWFpbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqBjb250cm9sbGVkIGJ5IHRoZSByb290IGxpbnV4IG9yIGh5cGVydmlzb3IuwqAg
wqBEbyB5b3UgdXNlIGE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgcGFydGljdWxhciBiYXJlIG1pbmltdW0geDg2IGtlcm5lbCBjb25maWcgb24g
eW91cjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBtYWNoaW5lIGZvciB0aGU8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgZ3Vlc3QgdG8g
Z2V0IGFyb3VuZCB0aGVzZT/CoCBJIGtub3cgSmFuIG1lbnRpb25lZCB0aGU8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgamFpbGhvdXNlLWltYWdl
cyBwcm9qZWN0IG1pZ2h0IGhhdmUgc29tZXRoaW5nLCBidXQgSTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqBjb3VsZG4mIzM5O3QgZmluZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBpdCBkaWdnaW5nIGFyb3VuZCBxdWljay48YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBUaGFua3MgdG8geW91IGJvdGgg
Zm9yIHlvdXIgcmVzcG9uc2VzIGFuZCBwYXRpZW5jZS7CoCBJPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoGdvdCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgcm9vdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqBsaW51eCB1cCBhbmQgZ29pbmcgb24gbXkgb3duLCBidXQgdGhlIG5vbi1yb290IGd1ZXN0
IGlzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHByb3ZpbmcgdG88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgYmUgbW9yZSBkaWZmaWN1
bHQuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgV2F5bmU8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTE6MzEgQU0gUmFs
ZiBSYW1zYXVlcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0
PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5z
YnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8
L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIg
dGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgt
cmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1
cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9i
bGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJn
LmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4m
Z3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRl
IiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+
DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90
aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5z
YnVyZy5kZTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNi
dXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNh
dWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgt
cmVnZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRh
cmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJl
Z2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJn
LmRlPC9hPiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoEhpLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoE9uIDYvMTAvMTkgNzo0NSBQTSwgV2F5bmUgd3JvdGU6
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDsgVGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlcyBSYWxmIGFuZCBKYW4uPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0OyBZZXMsIEkgaGF2ZSBzdWNjZXNzZnVsbHkgZ290dGVuIGJvdGggdGhlIGFwaWMt
ZGVtbyBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgdGlueS1kZW1vIGNlbGxzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgdG8gd29yayBvbiBteSBzeXN0ZW0g
YmVmb3JlIGF0dGVtcHRpbmcgdG8gbG9hZCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgbm9uLXJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgbGludXguwqAgSTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IGNhbiBzZWUgc2VyaWFsIG91dHB1dCBm
cm9tIHRoZW0uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBIb3dldmVyLCBpZiBJIHRyeSB0byBzaGFyZSB0aGUg
VUFSVCBiZXR3ZWVuIHJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgYW5kIGlubWF0
ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqBmb3IgdGhlbSBJPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCZndDsgcnVuIGludG8gYSBjcmFzaCBvbiB0aGUgaHlwZXJ2aXNv
ciBpZiB0aGUgcm9vdCBsaW51eDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqBhdHRlbXB0czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqB0byB3cml0ZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IHRvIHRoZSBVQVJUIChhZnRlciBjcmVh
dGluZy9zdGFydGluZyBhIGRlbW8pLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBEb2Vz
IHRoZSByb290PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoGxpbnV4IGxvc2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBhY2Nlc3Mgb25jZSBhbiBpbm1hdGUgaXMg
Y3JlYXRlZC9zdGFydGVkP8KgIE9yIGFtIEk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
bWlzc2luZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBzb21ldGhpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBmcm9tIG15IFN5c3RlbSBjb25maWcgb3IgdGlu
eS1kZW1vIGNvbmZpZyB0aGF0IGFsbG93czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqB0aGVtIHRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoHNoYXJlP8KgIEk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBhdHRhY2hlZCB0aGUgY3Jh
c2ggaW4gaHlwZXJ2aXNvcl9vdXRwdXQudHh0Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgQWxzbywgSSBub3Rp
Y2VkIHRoZSB0aW55LWRlbW8gb3V0cHV0IG9uIHRoZSBVQVJUIGdldHM8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgbWlycm9yZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgb24gdGhlPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgWWVzLCBhY2NvcmRpbmcgdG8g
eW91ciBjb25maWcsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoEpBSUxIT1VTRV9DRUxMX1ZJUlRVQUxfQ09OU09MRV9BQ1RJVkUgaXM8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgc2V0LiBUaGlzIG1lYW5zIHRoYXQgdGhlIGd1ZXN0IHdpbGwgdXNlIHRoZSB2aXJ0dWFsPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGNvbnNvbGUuIFRoZTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB2
aXJ0dWFsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoGNvbnNvbGUgdXNlcyB0aGUgaHlwZXJ2aXNvciBvdXRwdXQgd2hpY2ggZGVwZW5k
czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqB3aGF0ZXZlcjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBpcyBzZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgaW4geW91cjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBzeXN0ZW0gY29u
ZmlndXJhdGlvbi4gSW4geW91ciBjYXNlIHRoZSBoeXBlcnZpc29yPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoHVzZXMgM2Y4Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoEFuZCBhZGRpdGlvbmFsbHksIHRoZSBpbm1hdGUgYWxzbyBhIHZhbGlk
IC5jb25zb2xlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHNldC4gQWdhaW4sPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoDNm
OC4gVGhpczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBtZWFucywgaXQgd2lsbCB1c2UgdGhlIGNvbnNvbGUgKmFuZCogdGhlIGh5cGVy
dmlzb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgZGVidWc8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgaHlwZXJjYWxsLiBJ
bjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqB5b3VyIGNhc2UsIGJvdGggb3V0cHV0cyBhcmUgcm91dGVkIHRvIHRoZSBzYW1lPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGRldmljZSB3aGljaDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBleHBsYWlucyB0aGU8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
bWlycm9yaW5nLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDsgSmFpbGhvdXNlIHZpcnR1YWwgY29uc29sZS7CoCBEb2VzIHRoYXQgbWVhbiB0aGF0
IGl0czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB3cml0aW5nIHRv
IHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAmZ3Q7IHNlcmlhbCB0aHJvdWdoIHRoZSBoeXBlcnZpc29yIGFuZCBub3QgZGlyZWN0
bHk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgYWNjZXNzaW5nPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHR0eVMwPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGl0c2VsZj88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBFeGFjdGx5Ljxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgSWYgc28sIGlzIHRo
ZXJlIGEgd2F5IHRvIGNyZWF0ZSB0aGUgY2VsbCB0byB3cml0ZTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqB0dHlTMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqBkaXJlY3RseSBhcyBhPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgdGVzdD/CoCBUbyBzZWUg
aWYgaXQgZXhoaWJpdHMgc2FtZSBiZWhhdmlvciBhcyB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgbm9uLXJvb3QgbGludXguPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgU3VyZSwgc2ltcGx5IGFsaWduIHRoZSAuYWRk
cmVzcyBmaWVsZCBvZiAuY29uc29sZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgYW5k
IGFsbG93PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoGFjY2VzcyB0bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB0aGF0IHBvcnQgdmlhIC5waW9fYml0bWFwLjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBG
WUksIEkgY3JlYXRlIHRoZSB0aW55LWRlbW8gbGlrZSB0aGlzOjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgamFp
bGhvdXNlIGNlbGwgY3JlYXRlIGNvbmZpZ3MveDg2L3RpbnktZGVtby5jZWxsPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgamFp
bGhvdXNlIGNlbGwgbG9hZCB0aW55LWRlbW88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgaW5tYXRlcy9kZW1vcy94ODYvdGlueS1kZW1vLmNlbGw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBqYWls
aG91c2UgY2VsbCBzdGFydCB0aW55LWRlbW88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IEdvaW5nIGJhY2sgdG8g
bXkgb3JpZ2luYWwgbm9uLXJvb3QgbGludXggcXVlc3Rpb24sIEk8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgZG9uJiMzOTt0IHNlZSBhbnk8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBvdXRwdXQg
d2hlbiBjb25uZWN0ZWQgb3ZlciB0dHlTMC7CoCBJdHMgYWRkcmVzcyBpczxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAweDNmODxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAoJnF1b3Q7c2VyaWFsIDEmcXVvdDspIGluPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDsgdGhlIFBJTywgYW5kIHRoYXQgc2VlbXMgdG8gd29yayBmaW5lIGZvciB0aGUgb3RoZXI8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgc2ltcGxlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGRlbW9zLCBtaW51czxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
IHRoZSBoeXBlcnZpc29yIGNyYXNoIGlzc3VlIGFib3ZlIHdoZW4gc2hhcmluZy7CoCBJPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGtub3cgdGhlcmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgaXMgdGhlPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgb3Ro
ZXIgJnF1b3Q7c2VyaWFsIDImcXVvdDsgcG9ydCBidXQgSSBoYXZlbiYjMzk7dCB0cmllZCB0byB1
c2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgdGhhdCBvbmUuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgSSBzZWUgdGhhdCBwb3J0IG9uIG91
ciBEZWxsIHNlcnZlciBhcyB3ZWxsLiBJdCYjMzk7czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqBwcmVzZW50LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBi
dXQgSTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqBkb24mIzM5O3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKga25vdyB3aGVyZSBpdCYjMzk7cyBjb25uZWN0ZWQgdG8uPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgTGV0IG1lIGp1
c3Qgc3VtbWFyaXNlIHlvdXIgaXNzdWU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgWW91IG9ubHkgaGF2ZSBvbmUgc2VyaWFsIGxpbmUgYXZhaWxhYmxl
LCByaWdodD8gRnJvbSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgcm9vdC1jZWxsJiMzOTtzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoFBPViwgaXQmIzM5O3MgdHR5UzAgb24gM2Y4Ljxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoEkgd291bGQgcHJvcG9z
ZSB0byBzaGFyZSB0dHlTMCBiZXR3ZWVuIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqBoeXBlcnZpc29yIGFuZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqBMaW51eC4gVGhpcyBtZWFuczo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqDCoCAtIERvbiYjMzk7dCBsZXQgdGhlIHJvb3QtY2Vs
bCB1c2UgdHR5UzAuIFJlbW92ZSBhbnk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgY29uc29sZT10dHlTMDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqDCoCDCoCBwYXJhbWV0ZXJzIGZyb20geW91IGNvbW1h
bmRsaW5lLiBFbnN1cmUgdGhhdCBub29uZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqBlbHNlIGFjY2Vzc2VzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoMKgIMKgIHR0eVMwIChlLmcuLCBnZXR0eUB0dHlT
MCBvciBvdGhlciBmcmllbmRzKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoMKgIC0gU2V0IDNmOCBhcyBkZWJ1Z19jb25zb2xlIGluIHlvdXIgbWFzdGVy
LmMgKHNlZW1zIHlvdTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBh
bHJlYWR5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoGhhdmUpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgwqAgLSBBbGxvdyAzZjggYWNjZXNzIGluIHRoZSBsaW51eC1kZW1vLmMgKGFscmVh
ZHkgc2V0IGluPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHRoZSBk
ZWZhdWx0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoMKgIMKgIGxpbnV4LWRlbW88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqDCoCAtIERpc2FsbG93IDJmOCBhY2Nlc3MgaW4gbGludXgtZGVt
by5jOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBbIDB4MmY4LzggLi4uwqAgMHgyZmYvOF0g
PSAwLCAvKjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBzZXJpYWwyICovPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoFsgMHgyZjgvOCAuLi7CoCAweDJmZi84XSA9IC0xLCAvKjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBzZXJpYWwyICovPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgwqAgwqAgSSBkb24mIzM5O3Qga25vdyBob3cg
TGludXggZW51bWVyYXRlcyBzZXJpYWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgZGV2
aWNlcywgYnV0IHRoaXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgZW5zdXJlczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqDCoCDCoCB0aGF0IExpbnV4IHdvbiYjMzk7dCBz
ZWUgdGhlIHVuY29ubmVjdGVkIHNlcmlhbCBsaW5lPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoGFuZCBtYXA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgdHR5UzAgdG88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgwqAgwqAgM2Y4PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IG5vbiByb290IGxpbnV4
IGxhdW5jaGVkIHdpdGg6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCZndDsgL3Rvb2xzL2phaWxob3VzZSBjZWxsIGxpbnV4IGNvbmZp
Z3MveDg2L2xpbnV4LXg4Ni5jZWxsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgL2Jvb3Qvdm1saW51eC00LjEuMTYtR3Vlc3Qg
LWMgJnF1b3Q7Y29uc29sZT10dHlTMCwxMTUyMDAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBUaGVuLCB0aGlzIHNob3VsZCBhY3R1YWxseSB3
b3JrLi4uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
QW5kIGlmIG5vdCwgdGhlbiBjb25zb2xlPWphaWxob3VzZTAgc2hvdWxkIHdvcmsuPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IEkg
Y2FuIHRyeSB0aGUgNC4xOSBzaWVtZW5zIGtlcm5lbCBhbmQgJnF1b3Q7bmV4dCZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBicmFuY2ggZm9yPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGphaWxob3VzZSB5b3U8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0OyBzdWdnZXN0ZWQuwqAgRG8geW91IHRoaW5rIHRoYXQgY29tYmluYXRpb24gd2lsbCByZXNv
bHZlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHRoZSBtaXNzaW5n
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDsgc2VyaWFsIGZvciB0aGUgbm9uLXJvb3QgbGludXg/wqAgT3RoZXJ3aXNlLCBkaWQg
bXk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKga2VybmVsPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGNvbmZpZywgc3lzdGVt
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDsgY29uZmlnLCBhbmQgbm9uLXJvb3QgbGludXggY2VsbCBjb25maWdzIGxvb2sgT0s/
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgSSBkaWRu
JiMzOTt0IGxvb2sgYXQgaXQsIGJ1dCB3ZSBzaG91bGQgYXQgbGVhc3QgLSBldmVuPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoGlmIHNvbWU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgZmxhZ3MgYXJlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHN0aWxsIGluY29ycmVjdCAtIHNlZSB0aGUgJnF1
b3Q7VW5jb21wcmVzc2luZyBrZXJuZWwuLi4mcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgdGhpbmcuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgV2FpdCAtLSBvbmUgdGhpbmcgeW91IGNvdWxkIHRyeTogRGVhY3RpdmF0ZTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBDT05GSUdfRUZJIGFuZDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBlc3BlY2lhbGx5PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoENP
TkZJR19FRklfU1RVQlMuIEkmIzM5O20gbm90IHN1cmUsIGJ1dCBpdCBjb3VsZCBiZSB0aGF0PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoEVGSV9TVFVCUzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjaGFuZ2U8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgdGhlIGhl
YWRlciBmb3JtYXQgdGhhdCBvdXIgYm9vdGxvYWRlciBwYXRjaGVzLjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBUaGFua3MgYWdh
aW4gZm9yIHlvdXIgaGVscC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBObyBwcm9ibGVtLiBCdXQgaXQmIzM5O3Mgbm90IHlldCB3b3JraW5nLiA7LSk8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqDCoCBSYWxm
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDsgT24gRnJpLCBKdW4gNywgMjAxOSBhdCA1OjMwIFBNIFJhbGYgUmFtc2F1
ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1
cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1y
ZWdlbnNidXJnLmRlPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFy
Z2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGU8L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5k
ZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBv
dGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vu
c2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9
Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNi
dXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwv
YT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVl
ckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJl
Z2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYu
cmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5k
ZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJh
bXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBv
dGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90
aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5z
YnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpy
YWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1z
YXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1
cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1y
ZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFu
ayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRl
IiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJh
bXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0i
X2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5y
YWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRh
cmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFs
Zi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxh
bmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0OyZndDsmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUi
IHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3Ro
LXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNi
dXJnLmRlPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJf
YmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVy
Zy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+
Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFy
Z2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFu
ayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRl
IiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7
Jmd0OyZndDsmZ3Q7Jmd0OyZndDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgSGkgV2F5
bmUsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgT24gNi83LzE5IDEwOjA0IFBNLCBXYXluZSB3cm90
ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBIaSBSYWxmLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDsgVGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlcy7CoCBJIGhhdmU8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgYXR0YWNoZWQgdGhlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHJlcXVlc3RlZCBjb25m
aWc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBmaWxlcy7CoCBJIGFtIG5vdyBqdXN0IHRyeWluZyB0byB1
c2UgdGhlIHNhbWU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgYnpJ
bWFnZSBmb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgdGhlIHJvb3QgYW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgdGhlIG5vbi1yb290
IGxpbnV4IG5vZGUuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgT25lIHF1ZXN0aW9uIHRoYXQgeW91
IGRpZG4mIzM5O3QgYW5zd2VyOiBkbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBhcGlj
LWRlbW8gb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgdGlueS1kZW1vIHdvcms/PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoFRoZXkgbmVlZCB0byB0
byBoYXZlIGNvcnJlY3QgLmNvbnNvbGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgcGFy
YW1ldGVyIHNldCwgc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgZW5zdXJlIHRoYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgcGFyYW1ldGVycyBh
cmUgc2V0IGlmIHlvdSBydW4gdGhvc2UgZGVtb3MgaW4geW91cjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBsaW51eC1kZW1vIGNlbGwu
IEp1c3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgY29tcGFyZSBpdCB0byB0aW55LWRlbW8uYyBvciBhcGljLWRl
bW8uYzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBZZXMs
IEkgYW0gdXNpbmcgdmFuaWxsYSA0LjE2IGJlY2F1c2UgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoGRvY3VtZW50YXRpb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgaW5kaWNhdGVkPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoHRoYXQg
aXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBpcyB0aGUgZmlyc3QgbWFpbmxpbmUgcmVsZWFzZSB0byBv
ZmZpY2lhbGx5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHN1cHBvcnQ8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgSmFpbGhv
dXNlIEd1ZXN0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgaW1hZ2VzLsKgIERvIHlvdSBzdWdnZXN0IHRo
YXQgSSB1c2Ugc29tZXRoaW5nPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGVsc2U/PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgQXMgSmFuIGFscmVhZHkgd3JvdGU6IFRyeSB0byB1c2UgU2ll
bWVucyYjMzk7IDQuMTk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgYnJhbmNoLjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBSaWdodCBub3cgaSYj
Mzk7bSBqdXN0IHRyeWluZyB0byBnZXQgc29tZSBzZXJpYWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgb3V0cHV0IGZyb208YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgdGhlIG5vbi1yb290PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDsgTGludXguwqAgSG9wZWZ1bGx5LCBJIGhhdmUgdGhhdCBjb25maWd1cmVkPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGNvcnJlY3RseS48YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgSWRlYWxseSwgSSB3b3Vs
ZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGxpa2UgdG8gc2hhcmUgdGhlIHNhbWUgc2VyaWFsIGNvbnNv
bGUgZm9yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHRoZSBSb290PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoG5vZGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgYW5kIG5vbi1yb290PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDsgbm9kZSBldmVudHVhbGx5IGlmIHBvc3NpYmxlLsKgIEkgaGF2ZSBiZWVu
IE9LPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHdpdGg8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgdXNpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgdGhlIHZpcnR1YWw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0OyBjb25zb2xlIChqYWlsaG91c2UgY29uc29sZSAtZikgZm9yIHRoZTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqBIeXBlcnZpc29yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoG91dHB1dC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBJbiBhZGRpdGlv
biB0byBKYW4mIzM5O3MgY29tbWVudDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBDdXJyZW50bHkg
eW91IG9ubHkgaGF2ZSBhY2Nlc3MgdG8gdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oGphaWxob3VzZSBjb25zb2xlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoHZpYSAmIzM5O2phaWxob3VzZTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBj
b25zb2xlJiMzOTsgZnJvbSB5b3VyIHJvb3QgY2VsbC4gSW1hZ2luZSB5b3VyPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoHJvb3QgY2VsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjcmFzaGVzIGZvciBzb21lPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoHJlYXNvbi4gWW91IHdpbGwgbmV2ZXIgc2VlIHRoZSBmYXVsdCByZWFzb24sPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHdoaWNoIG1ha2VzPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHRoaW5ncyBoYXJkIHRvPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoGRlYnVnLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoEkgd291bGQgc3VnZ2Vz
dCB0byBjb25maWd1cmUgdGhlIGh5cGVydmlzb3IgdG88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgdXNlIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqBzZXJpYWwgY29uc29sZS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgWW91IGNhbiBz
aGFyZSB0aGUgZGV2aWNlIHdpdGggdGhlIG5vbi1yb290PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoExpbnV4LCB0aGF0JiMzOTtzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoG5vIHByb2JsZW0uPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgSW4gdGhpcyBjYXNlLCB0aGUgbm9uLXJvb3Qga2VybmVsJiMzOTtzIG91dHB1dCB3aWxs
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGFsd2F5cyBiZTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBw
cmludGVkIHRvIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBzZXJpYWwgY29uc29sZS4gRGlyZWN0bHksIGlm
IHlvdSBjaG9vc2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgY29u
c29sZT10dHlTeCwgYW5kPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoGluZGlyZWN0bHk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgdmlhIHRoZSBoeXBl
cnZpc29yIGlmIHlvdSBjaG9vc2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgY29uc29s
ZT1qYWlsaG91c2UuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgQlRXOiBBY2NvcmRpbmcgdG8geW91
ciBjb25maWcsIHlvdXIgc3lzdGVtIGlzIGE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgUG93ZXJFZGdlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBhbmQgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoG5vbi1yb290
IGNlbGwgZ2V0cyBib3RoLCAweDJmOCBhbmQgMHgzZjguIEFyZTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqB5b3Ugc3VyZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB0aGF0IHR0eVMxIGlzIHRoZTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBj
b3JyZWN0IGNvbnNvbGUgdGhhdCB5b3UgYXJlIGNvbm5lY3RlZCB0bz88YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqBKdXN0IG1lbnRpb25pbmcgdGhpcyBhcyB3ZSBoYXZlIGEgc2ltaWxhcjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBtYWNoaW5lIGhlcmUsPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGFuZCwgYWZhaXIsIGJvdGg8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgcGxhdGZvcm0gc2VyaWFsIGRldmljZSBhcmUgJiMzOTt1c2FibGUmIzM5
OywgYnV0IG9uZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBlbmRzIGluIHRoZTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBu
aXJ2YW5hIHdoaWxlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGl0IGlzIGFjY2Vzc2libGUuPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgQWgsIGFuZCBvbmUgbGFzdCB0aGluZzogdHJ5IHRvIHN3aXRjaCB0byB0aGU8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgY3VycmVudDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBuZXh0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGJyYW5jaCBmb3I8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
amFpbGhvdXNlLiBKYW4ganVzdCBpbnRlZ3JhdGVkIGEgZmV3IHBhdGNoZXM8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgZnJvbSBtZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqB0aGF0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoG1pZ2h0IGFsc28gYmU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgcmVsZXZhbnQg
Zm9yIHlvdXIgbWFjaGluZS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBIVEg8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgwqAgUmFsZjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
OyBXYXluZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgT24gRnJpLCBK
dW4gNywgMjAxOSBhdCA5OjEwIEFNIFJhbGYgUmFtc2F1ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdl
dD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vu
c2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRl
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsi
PnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIg
dGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0OyZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJf
YmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVy
Zy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFs
Zi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJn
ZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0OyZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5z
YnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8
L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1z
YXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3Ro
LXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0
YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1y
ZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVy
Zy5kZTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJn
LmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVy
QG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdl
dD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vu
c2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRl
PC9hPiZndDsmZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJh
bGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFy
Z2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxm
LnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVl
ckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFu
ayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9
Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFt
c2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90
aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5y
YWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJn
ZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5k
ZTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5r
Ij5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUi
IHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0i
X2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1
cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJh
bGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFy
Z2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0OyZndDsm
Z3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9
Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFt
c2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90
aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5y
YWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJh
bGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNh
dWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2Js
YW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVl
ckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJl
Z2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYu
cmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0i
X2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1
cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJh
bGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFy
Z2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0OyZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxh
bmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5k
ZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9
Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0OyZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1y
ZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxm
LnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBv
dGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vu
c2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFt
c2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNi
dXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNh
dWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgt
cmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYu
cmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0
PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJh
bXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBv
dGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+
cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpy
YWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1z
YXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9i
bGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1y
ZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxm
LnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyZn
dDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
SGksPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgT24gNi83
LzE5IDI6MjggUE0sIFdheW5lIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
IEhlbGxvLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDsgSSBhbSBuZXcgdG8gTGludXggZGV2ZWxvcG1lbnQgYW5kPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoEphaWxob3VzZS7CoCBJIGhhdmU8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgc3VjY2Vzc2Z1bGx5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGJvb3Rl
ZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHRoZSBKYWlsaG91c2UgSHlwZXJ2aXNv
ciBhbmQgcm9vdCBjZWxsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoG9uIGEgYmFyZTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqBtZXRhbCBYODYgTGludXg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgc3lzdGVtPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgKE5vIFFFTVUpLsKgIEkgYW0gbm93IHRyeWluZyB0
byBsb2FkIGE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgbm9uLXJvb3Q8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgTGludXgg
Y2VsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqBhbmQgSSBoYXZlIGE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0OyBmZXcgcXVlc3Rpb25zLsKgIEphaWxob3VzZSBhY2NlcHRzIGFuZDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqBzdGFydHMgbXk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgbm9uLXJvb3Q8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
bGludXggY2VsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGNvbmZpZ3VyYXRpb24g
YW5kIEkgc2VlIGl0IGFzICZxdW90O3J1bm5pbmcmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgdGhyb3VnaCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJnF1b3Q7amFp
bGhvdXNlIGNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBsaXN0JnF1b3Q7IGNv
bW1hbmQuwqAgSG93ZXZlciwgSSBkb24mIzM5O3Qgc2VlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoGFueSBzZXJpYWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgb3V0cHV0IGZyb20gdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDsgJnF1b3Q7bm9uLXJvb3QgbGludXgmcXVvdDsgY2VsbCBib290aW5nIHVwLsKg
IEnigJltPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoG5vdCBzdXJlPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHdoYXQgdGhl
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoG5vbi1yb290IG5vZGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0OyBpcyBkb2luZyBhdCB0aGlzIHBvaW50Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoE9rLCBmaXJzdCBvZiBhbGwsIGNhbiB5b3Ugc2VlIGFueSBvdXRw
dXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgZnJvbTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBKYWlsaG91c2UmIzM5O3Mg
ZGVtbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqBpbm1hdGVzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoChl
LmcuLCB0aW55LWRlbW8gb3IgYXBpYy1kZW1vKT88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNeSByb290IG5vZGUgaXMgYSA0LjE2PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoGtlcm5lbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjb25maWd1cmVkIHRoaXM8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgd2F5Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDEuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoENPTkZJR19KQUlMSE9VU0VfR1VFU1Qg
aXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgbm90IHNldDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDIuPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoENPTkZJR19TRVJJTz15PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
My48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgQ09ORklHX1NFUklBTF84MjUwX1JVTlRJTUVfVUFSVFM9NDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNeSBub24tcm9vdCBub2RlIGlzIGE8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgNC4xNiBrZXJuZWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgY29uZmlndXJlZDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqB0aGlzIHdheTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAxLjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBDT05GSUdfSkFJTEhPVVNF
X0dVRVNUPXk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAyLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqBDT05GSUdfU0VSSU89bTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAoY2FuJiMzOTt0IHNlZW08YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgdG8g
ZGlzYWJsZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGNvbXBsZXRlbHkgaW4gbXkg
Y29uZmlnIGZvciA0LjE2KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDMuPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoENP
TkZJR19TRVJJQUxfODI1MF9SVU5USU1FX1VBUlRTPTE8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgYSBmdWxsIC5j
b25maWc/PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoFdoYXQ8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgYnJhbmNoPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGFyZSB5b3U8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgZXhhY3RseTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB1c2luZz8gVmFuaWxsYSA0LjE2
Pzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFBsZWFzZSBh
dHRhY2ggeW91ciBzeXN0ZW0gY29uZmlnIGFuZCB5b3VyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoG5vbi1yb290IGxpbnV4PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGNvbmZpZyBh
cyB3ZWxsLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFlv
dSBtYXkgYWxzbyB3YW50IHRvIHRyeTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9zaWVtZW5zL2xpbnV4IiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vc2llbWVu
cy9saW51eDwvYT4gLiBTZWU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgamFpbGhvdXNlLWVu
YWJsaW5nIGJyYW5jaGVzIGZvciBzb21lPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHJl
bGVhc2VzLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBJbiBnZW5lcmFsLCBkbyB0aGUga2Vy
bmVsIGNvbmZpZyBzZXR0aW5nczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqBoYXZlIHRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoG1hdGNoIGJldHdlZW48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
dGhlIHJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBub2RlIGFuZCBub24tbGlu
dXggb3IgaXMgdGhlIGFib3ZlIGZpbmU/PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgTm8sIHRoZXkgZG8gbm90IGhhdmUgdG8gYmUgdGhlIHNhbWUsIGJ1dDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqB0aGV5IGNhbi48YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgU3RpbGwsIGFuPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoGFuYWx5c2lzPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHJlcXVpcmVzIHlv
dXIgLmNvbmZpZy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgVGhlIHZtbGludXgtNC4xLjE2
LUd1ZXN0IGJ6SW1hZ2UgaXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgYXBwcm94IDdN
Qiw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgYW5kIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBpbm1hdGUgbm9kZSBpczxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7IGFsbG9jYXRlZCB+NzVNQiBvZiBSQU0uPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBJIGhhdmUg
YSBzaW5nbGUgVUFSVCwgc28gSSBoYXZlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGNv
bmZpZ3VyZWQgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoHJvb3QgY2VsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBzeXN0ZW0gY29uZmlnPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgdG8gb3V0cHV0IHRvIHRoZSB2aXJ0dWFsIGh5
cGVydmlzb3I8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgY29uc29sZTo8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBXYWl0Li4uIFlvdSBjb25maWd1
cmVkIHlvdXIgcm9vdC1jZWxsIHRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHVzZSB0
aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgaHlwZXJ2aXNvciBkZWJ1Zzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBjb25zb2xl
PyBIb3c/IEl0JiMzOTtzIG9ubHkgYXZhaWxhYmxlIG9uY2UgdGhlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGh5cGVydmlzb3IgaXM8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgZW5h
YmxlZC4gSG93PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHNob3VsZCB0aGlzIHdvcms/PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgQnV0IGxldCYjMzk7
cyBoYXZlIGEgbG9vayBhdCB5b3VyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGNvbmZp
Z3VyYXRpb24gZmlyc3QuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgU28geW91IHdhbnQgdG86PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoMKgIC0gSGF2
ZSB0aGUgVUFSVCAoMHgzZjgpIGF2YWlsYWJsZSBpbiB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgbm9uLXJvb3QgY2VsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q777+977+9IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgwqAgLSBVc2UgMHgzZjggYXMgaHlwZXJ2aXNvciBkZWJ1Zzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqBjb25zb2xlIGFzIHdlbGw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgwqAgLSBObyBjb25zb2xlIGZvciByb290LWNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBEaWQgSSBnZXQgdGhpcyByaWdodD88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqDCoCBSYWxmPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7IC5mbGFncyA9PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoEpBSUxI
T1VTRV9TWVNfVklSVFVBTF9ERUJVR19DT05TT0xFLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgLmRlYnVnX2NvbnNvbGUgPSB7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgLnR5cGUgPSBKQUlMSE9VU0VfQ09OX1RZ
UEVfTk9ORSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB9LDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgYW5kIEkg
aGF2ZSBjb25maWd1cmVkIHRoZSBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqBsaW51eCBjZWxsIHRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoG91dHB1dCB0bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqB0aGUgVUFSVDo8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7IChBZGRlZCBzZXJpYWwgMHgzZjggdG8gcGlvIGJpdG1hcCBmb3I8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgbm9uLXJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgbGludXgpIGFuZDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBzdGFy
dGVkIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IG5vZGUgd2l0aCB0aGlzOjxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDsgLi90b29scy9qYWlsaG91c2UgY2VsbCBsaW51eDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjb25maWdzL3g4Ni9saW51eC14
ODYuY2VsbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IC9ib290L3ZtbGludXgtNC4x
LjE2LUd1ZXN0IC1jPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZx
dW90O2NvbnNvbGU9dHR5UzAsMTE1MjAwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDsgKE5vdGUgSSBhbHNvIHRyaWVkICZxdW90O2NvbnNvbGU9amFpbGhvdXNlJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoGluIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjb21tYW5kIGFib3ZlLDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqBhbmQgdGhhdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHByb2R1
Y2VzIHRoZSBzYW1lIHJlc3VsdCk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IEkgdGhlbiBzZWUgdGhlIGZvbGxvd2luZyBvbiBt
eSBoeXBlcnZpc29yPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGNv
bnNvbGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgKC4vdG9vbHMvamFpbGhvdXNlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDsgY29uc29sZSAtZik6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBDcmVhdGVkIGNlbGwgJnF1b3Q7bGlu
dXgteDg2LWRlbW8mcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAuLi48YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBDZWxsICZxdW90O2xpbnV4LXg4Ni1kZW1vJnF1
b3Q7IGNhbiBiZSBsb2FkZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBTdGFydGVk
IGNlbGwgJnF1b3Q7bGludXgteDg2LWRlbW8mcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IEFmdGVyIGEgbGl0dGxlIHdo
aWxlIEkgZG8gZ2V0IGEgcGFya2VkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoENQVSBl
cnJvcjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqBvbiB0aGUgcm9vdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBub2RlLDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqBsb29rczxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGxpa2UgaXRz
IHRyeWluZyB0byBkbyBzb21ldGhpbmcgd2l0aCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgVUFSVCBhcyB3ZWxsOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7IEZBVEFMOiBJbnZhbGlkIFBJTyByZWFkLCBwb3J0OiAzZmUgc2l6ZTogMTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsg
SSB3b3VsZCBleHBlY3Qgc29tZXRoaW5nIHRvIHBvcCBvdXQgb248YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgdGhlIFVBUlQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgZnJvbSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgbm9uLXJvb3Q8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgbGludXg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0OyBub2RlIGZpcnN0LsKgIE5vdGUgdGhhdCByb290IG5vZGUgaGFzPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoHNlcmlhbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAweDNmODxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqBkaXNhYmxlZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBpbiBpdHMgcGlvPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgYml0bWFwLjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgSSB2ZXJpZmVkIHRo
YXQgdGhlIFVBUlQgaXMgZnVuY3Rpb25pbmcgYnk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgYWxsb3dpbmcgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGh5cGVydmlzb3IgdG88
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBwcmludCB0byBpdCBhbmQgYWxzbyBwZXJm
b3JtZWQgYW4gZWNobzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqB0ZXN0IG92ZXI8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
dHR5UzAuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0OyBJIGhhdmUgdHJpZWQgc2V2ZXJhbCBjb25maWd1cmF0aW9ucyBvZjxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBr
ZXJuZWwuLi4uLmluY2x1ZGluZyB5b3VyPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGN1cnJl
bnQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAmcXVvdDtxdWV1ZXMvamFpbGhvdXNl
JnF1b3Q7IGJyYW5jaCBoZWFkIGtlcm5lbDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBm
b3IgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoG5vbi1yb290IG5vZGUsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGFsb25nPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoHdpdGg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB0aGUg
a2VybmVsIGNvbmZpZyBmb3IgNC43IHBvc3RlZCBpbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqB0aGlzIHRocmVhZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqBiZWxvdyAoYnV0IEk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgZ2V0IHNhbWU8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyByZXN1bHQgYXMgYWJvdmUgd2hlbiBJIHN0
YXJ0IGl0LCBubyBrZXJuZWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgb3V0cHV0KTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKg
IMKgIMKgwqDCoMKgwqDCoCZxdW90OzxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20v
Zm9ydW0vIyFzZWFyY2hpbi9qYWlsaG91c2UtZGV2L1JlJDNBJDIwRmFpbGVkJDIwdG8kMjBib290
JDIwamFpbGhvdXNlJTdDc29ydDpyZWxldmFuY2UvamFpbGhvdXNlLWRldi9NN1VPODlYRklrMC9R
aTQwRER1TUJBQUoiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3Jv
dXBzLmdvb2dsZS5jb20vZm9ydW0vIyFzZWFyY2hpbi9qYWlsaG91c2UtZGV2L1JlJDNBJDIwRmFp
bGVkJDIwdG8kMjBib290JDIwamFpbGhvdXNlJTdDc29ydDpyZWxldmFuY2UvamFpbGhvdXNlLWRl
di9NN1VPODlYRklrMC9RaTQwRER1TUJBQUo8L2E+JnF1b3Q7Ljxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgQW55IGluZm9ybWF0
aW9uIHlvdSBjYW4gcHJvdmlkZSB0byBtZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqB3
aWxsIGJlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoGhlbHBmdWwuwqAgSSYjMzk7bTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBub3Qgc3VyZTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHdoYXQgbWlnaHQgYmUgZ29pbmcgd3JvbmcgaGVy
ZS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7IFRoYW5rcyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBXYXluZTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDsgLS08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBZb3UgcmVjZWl2ZWQgdGhp
cyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBzdWJzY3JpYmVkIHRvIHRoZTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqBHb29nbGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBHcm91cHMgJnF1b3Q7
SmFpbGhvdXNlJnF1b3Q7IGdyb3VwLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFRv
IHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqByZWNlaXZpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgZW1haWxzPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oGZyb20gaXQsIHNlbmQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBhbiBlbWFpbCB0
bzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IDxhIGhyZWY9
Im1haWx0bzpqYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2Ut
ZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFp
bGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91
c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+
amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
diUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9
Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRl
diUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFp
bGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxo
b3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyQnVuc3Vi
c2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTJC
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
diUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRl
diUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5q
YWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1
MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxo
b3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7
Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdy
b3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29v
Z2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRh
cmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vi
c2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1
MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1
MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1
MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNl
LWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJz
Y3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUy
NTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUy
NTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhv
dXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUy
QnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2Ut
ZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0
YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdy
b3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vi
c2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0OyZndDsmZ3Q7Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJC
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1k
ZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUy
QnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUy
NTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3Vz
ZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
diUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDsmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2Ut
ZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5q
YWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1
MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNl
LWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNl
LWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5r
Ij5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmph
aWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVn
cm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUy
NTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MjUyQnVuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUy
NTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0OyZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5j
b20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29v
Z2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJz
Y3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVn
cm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRl
diUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5q
YWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1
MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxo
b3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxo
b3VzZS1kZXYlMjUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUy
QnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUy
NTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpq
YWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyNTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29v
Z2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVu
c3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTI1MjUyQnVuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyNTI1
MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDsmZ3Q7Jmd0OyZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNl
LWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMkJ1bnN1
YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5zdWJz
Y3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3Vz
ZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVu
c3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVu
c3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2
JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdy
b3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdl
dD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5j
b208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1
MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyNTJC
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9
Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRl
diUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFp
bGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxo
b3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBn
b29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5j
b20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29v
Z2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqDCoCZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29v
Z2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vi
c2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNl
LWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5r
Ij5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmph
aWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmph
aWxob3VzZS1kZXYlMjUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdy
b3Vwcy5jb208L2E+Jmd0OyZndDsmZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20i
IHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWls
aG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2Js
YW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91
c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4m
Z3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vi
c2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJC
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29v
Z2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJz
Y3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1
YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUy
NTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUy
NTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpq
YWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91
c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208
L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdl
dD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29t
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3Vz
ZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRh
cmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1
MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyNTJC
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1
MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91
c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1
MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91
c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0i
X2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208
L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNl
LWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1
MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxo
b3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1
MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxo
b3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpq
YWlsaG91c2UtZGV2JTI1MjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRh
cmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVn
cm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmphaWxob3VzZS1kZXYlMjUyNTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29t
IiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBn
b29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyZndDsuPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDsgVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdl
YiB2aXNpdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9t
c2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjMmlLazFKNiUyQjBodWg1X19kUzRIeXVqWHpW
OXIlMkJMYktMenVWWjRLM0J0NWVBJTQwbWFpbC5nbWFpbC5jb20iIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91
c2UtZGV2L0NBJTJCJTJCS2hjMmlLazFKNiUyQjBodWg1X19kUzRIeXVqWHpWOXIlMkJMYktMenVW
WjRLM0J0NWVBJTQwbWFpbC5nbWFpbC5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqDCoMKgwqDC
oCZsdDs8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNl
LWRldi9DQSUyQiUyQktoYzJpS2sxSjYlMkIwaHVoNV9fZFM0SHl1alh6VjlyJTJCTGJLTHp1Vlo0
SzNCdDVlQSU0MG1haWwuZ21haWwuY29tP3V0bV9tZWRpdW09ZW1haWwmYW1wO3V0bV9zb3VyY2U9
Zm9vdGVyIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dyb3Vwcy5n
b29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzJpS2sxSjYlMkIwaHVo
NV9fZFM0SHl1alh6VjlyJTJCTGJLTHp1Vlo0SzNCdDVlQSU0MG1haWwuZ21haWwuY29tP3V0bV9t
ZWRpdW09ZW1haWwmYW1wO3V0bV9zb3VyY2U9Zm9vdGVyPC9hPiZndDsuPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDsgRm9yIG1vcmUgb3B0aW9ucywgdmlzaXQ8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyA8YSBocmVmPSJodHRwczovL2dyb3Vwcy5n
b29nbGUuY29tL2Qvb3B0b3V0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL2dyb3Vwcy5nb29nbGUuY29tL2Qvb3B0b3V0PC9hPi48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAtLTxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFlvdSByZWNlaXZlZCB0aGlzIG1l
c3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoEdvb2dsZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7IEdyb3VwcyAmcXVvdDtKYWlsaG91c2UmcXVvdDsgZ3JvdXAuPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgVG8gdW5zdWJzY3JpYmUgZnJvbSB0
aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgZnJvbSBpdCwgc2VuZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7IGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTJC
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1k
ZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBn
b29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1
YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUy
QnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVu
c3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5r
Ij5qYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYl
MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJC
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1k
ZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vi
c2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNl
LWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmph
aWxob3VzZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYl
MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1
MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91
c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1
YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUy
NTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0OyZndDsuPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgVG8gdmlldyB0aGlz
IGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNpdDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vZ3Jv
dXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjME8yelNldUxM
WTNNYWVSVzdjUXJXYnEtNlkyQkhKZyUyQnhfajZuayUzREVDYV9BJTQwbWFpbC5nbWFpbC5jb20i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5j
b20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjME8yelNldUxMWTNNYWVSVzdjUXJX
YnEtNlkyQkhKZyUyQnhfajZuayUzREVDYV9BJTQwbWFpbC5nbWFpbC5jb208L2E+PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqDCoCZsdDs8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQv
amFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzBPMnpTZXVMTFkzTWFlUlc3Y1FyV2JxLTZZMkJISmcl
MkJ4X2o2bmslM0RFQ2FfQSU0MG1haWwuZ21haWwuY29tP3V0bV9tZWRpdW09ZW1haWwmYW1wO3V0
bV9zb3VyY2U9Zm9vdGVyIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczov
L2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzBPMnpT
ZXVMTFkzTWFlUlc3Y1FyV2JxLTZZMkJISmclMkJ4X2o2bmslM0RFQ2FfQSU0MG1haWwuZ21haWwu
Y29tP3V0bV9tZWRpdW09ZW1haWwmYW1wO3V0bV9zb3VyY2U9Zm9vdGVyPC9hPiZndDsuPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgRm9yIG1vcmUgb3B0aW9u
cywgdmlzaXQgPGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL29wdG91dCIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9k
L29wdG91dDwvYT4uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0OyAtLTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAmZ3Q7IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmli
ZWQgdG8gdGhlIEdvb2dsZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7IEdyb3Vw
cyAmcXVvdDtKYWlsaG91c2UmcXVvdDsgZ3JvdXAuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCZndDsgVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2Vpdmlu
ZyBlbWFpbHMgZnJvbSBpdCwgc2VuZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7
IGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYrdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29t
IiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdy
b3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9
Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwv
YT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmph
aWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2Js
YW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0i
X2JsYW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0
Oy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0OyBUbyB2aWV3IHRoaXMgZGlzY3Vz
c2lvbiBvbiB0aGUgd2ViIHZpc2l0PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8v
Z3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjMzZzUDdB
QkVzUjVCcCUyQmdwdHMwRFVCRU5xVjZlRkRQYXpmczVrUl9RUkdhdyU0MG1haWwuZ21haWwuY29t
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dyb3Vwcy5nb29nbGUu
Y29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzM2c1A3QUJFc1I1QnAlMkJncHRz
MERVQkVOcVY2ZUZEUGF6ZnM1a1JfUVJHYXclNDBtYWlsLmdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9k
L21zZ2lkL2phaWxob3VzZS1kZXYvQ0ElMkIlMkJLaGMzNnNQN0FCRXNSNUJwJTJCZ3B0czBEVUJF
TnFWNmVGRFBhemZzNWtSX1FSR2F3JTQwbWFpbC5nbWFpbC5jb20/dXRtX21lZGl1bT1lbWFpbCZh
bXA7dXRtX3NvdXJjZT1mb290ZXIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hj
MzZzUDdBQkVzUjVCcCUyQmdwdHMwRFVCRU5xVjZlRkRQYXpmczVrUl9RUkdhdyU0MG1haWwuZ21h
aWwuY29tP3V0bV9tZWRpdW09ZW1haWwmYW1wO3V0bV9zb3VyY2U9Zm9vdGVyPC9hPiZndDsuPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZndDsgRm9yIG1vcmUgb3B0aW9ucywgdmlzaXQg
PGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL29wdG91dCIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL29wdG91dDwv
YT4uPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAtLTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3Ug
YXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IEdyb3Vw
cyAmcXVvdDtKYWlsaG91c2UmcXVvdDsgZ3JvdXAuPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVG8g
dW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJv
bSBpdCwgc2VuZDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1h
aWx0bzpqYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhv
dXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
dit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Oy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBUbyB2
aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqA8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2Qv
bXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzEzbnVhaGJvZ19XVkQtQkppMGFzSEVhOFR4
TUF2QjVNNWRhbUpHSl81aW5BJTQwbWFpbC5nbWFpbC5jb20iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2Ut
ZGV2L0NBJTJCJTJCS2hjMTNudWFoYm9nX1dWRC1CSmkwYXNIRWE4VHhNQXZCNU01ZGFtSkdKXzVp
bkElNDBtYWlsLmdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFp
bGhvdXNlLWRldi9DQSUyQiUyQktoYzEzbnVhaGJvZ19XVkQtQkppMGFzSEVhOFR4TUF2QjVNNWRh
bUpHSl81aW5BJTQwbWFpbC5nbWFpbC5jb20/dXRtX21lZGl1bT1lbWFpbCZhbXA7dXRtX3NvdXJj
ZT1mb290ZXIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBz
Lmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjMTNudWFoYm9nX1dW
RC1CSmkwYXNIRWE4VHhNQXZCNU01ZGFtSkdKXzVpbkElNDBtYWlsLmdtYWlsLmNvbT91dG1fbWVk
aXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWZvb3RlcjwvYT4mZ3Q7Ljxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IEZvciBtb3JlIG9wdGlvbnMsIHZpc2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdv
b2dsZS5jb20vZC9vcHRvdXQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9vcHRvdXQ8L2E+Ljxicj4NCiZndDsgPGJyPg0KPGJyPg0K
LS0gPGJyPg0KU2llbWVucyBBRywgQ29ycG9yYXRlIFRlY2hub2xvZ3ksIENUIFJEQSBJT1QgU0VT
LURFPGJyPg0KQ29ycG9yYXRlIENvbXBldGVuY2UgQ2VudGVyIEVtYmVkZGVkIExpbnV4PGJyPg0K
PC9ibG9ja3F1b3RlPjwvZGl2Pg0KDQo8cD48L3A+CgotLSA8YnIgLz4KWW91IHJlY2VpdmVkIHRo
aXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3Vw
cyAmcXVvdDtKYWlsaG91c2UmcXVvdDsgZ3JvdXAuPGJyIC8+ClRvIHVuc3Vic2NyaWJlIGZyb20g
dGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1h
aWwgdG8gPGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbSI+amFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPi48
YnIgLz4KVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNpdCA8YSBocmVmPSJo
dHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQkto
YzBzZUJEbk4yaEQ3RUpoM2cyNXVuVUVGcUJ1aVJTbTVId09FJTJCMUpFWDBEMlElNDBtYWlsLmdt
YWlsLmNvbT91dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9Zm9vdGVyIj5odHRwczovL2dyb3Vw
cy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzBzZUJEbk4yaEQ3
RUpoM2cyNXVuVUVGcUJ1aVJTbTVId09FJTJCMUpFWDBEMlElNDBtYWlsLmdtYWlsLmNvbTwvYT4u
PGJyIC8+CkZvciBtb3JlIG9wdGlvbnMsIHZpc2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdv
b2dsZS5jb20vZC9vcHRvdXQiPmh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9vcHRvdXQ8L2E+
LjxiciAvPgo=
--0000000000006eb3af058b355dc2--
