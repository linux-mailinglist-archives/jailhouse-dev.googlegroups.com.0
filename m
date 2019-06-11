Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBQ6677TQKGQEJZWP57Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-it1-x13b.google.com (mail-it1-x13b.google.com [IPv6:2607:f8b0:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFCB3D54B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 20:13:25 +0200 (CEST)
Received: by mail-it1-x13b.google.com with SMTP id u127sf3021515ith.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 11:13:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560276804; cv=pass;
        d=google.com; s=arc-20160816;
        b=QFOUtMKpLivNgKwsRBWrNMcErGfgW8aCh0xxm4q1wQmhFXBqMBeM6VbqRI+eLmNOGv
         XemEE3ljp/byRfBhwVfGhmoDG86txjkbRzn8HlmnRKO2iiA/Acyu/44ve79QHqwSVtK1
         QzlVbWKF0MGfGJtDyBmNg6cOTh+KknW8utQoAQPWpIUxyAlKto49fv30crII+/IBWYcp
         sleTElnEPJ49Ze6YRPPVY5zeON+rYR44V8MoxSxQ/begJQufm9Vb6vfubSbN6lhsyQ7M
         NW518XDAjGJyUxjLJJJZCsd2ySdMMW1lNaLxiwmPgZKlOJmzkCYjvSF/3y+GOjlW97ai
         8F3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=AR8I0wDN/dMLzfAIr7EPo8Mxzi239/opAcBIALA88Dk=;
        b=Zp7k2ZgkMwR4ZSp97qsW25LSE1LqWWNcERmY9FzjlueKXFaGoSIlfvSsjWoj1GurZt
         NSzAWVRUPAA4KG/sXRUZzqM2D0/M7zXqmCqZIaNkFn28aHeJDh5pQU0V2SAn6m46xF24
         +07g7aNsepOGl6Cz/OhnG5zlEcW7vEFT2BxzQ2cGVqDqqJm6Hl/XSi+r9rPNHm4pp+OP
         0ljNVaY3pUgnuH6uRzdxqTNMKtpf8fMNU5MN80ljZEtQBD84r7O/Vg1HOCBc95qaO3e1
         axKgKJF+CMP/2vYX/yM3KNJ9jcejWe6OCwy0oAG9TXdHVHrXfvlIwRhi4ZKbBGQRxGtR
         khhg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=D6yIC49q;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::82b as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AR8I0wDN/dMLzfAIr7EPo8Mxzi239/opAcBIALA88Dk=;
        b=PQ04OppDu+vAOGrDIe9L4v9qu9ciOfvZUKArCYEplMDkwrmfzuNN4frrhrvEBxkph5
         B7vZG2IqOqJeO6z6h6UNGmUvOOz6/8/8wqzIEWa26r4dcUJScx32nQKT99pizbCSKqEQ
         Luo5srtLQGEvkwNHea4VhUiYJRWFF++SfOXcko+L0WaNcUkJugbwKzi4N6NoZqG33g+0
         u7qpKMiLI5gg3ErgITRq+P+tt112EHfvPvo5D1Lg6V74xVLwPXR402iflRi2cbPEP+4C
         UDq9LTc+q3Ll/S4zolUlAP1VhP0NeB7QOBmTiPwYxNTcXQw2So/leH3ISvhlfCmK2BVF
         9HmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AR8I0wDN/dMLzfAIr7EPo8Mxzi239/opAcBIALA88Dk=;
        b=MCMJv7jguK3Ve55198OYn4Fn5UgyCkIEDEov4WW2S5/YQqM3S1eAfYvrggI49PcoaN
         A49TKSobvLqh4YhWdZ51zHUFcsiNUEaiLdUdhGT07MthlSnlNglyTQtTMW5UCvOiihGs
         o4VSRJBxo4trIHlCWFiZkd/YS36HXbr6yM759gRfb9K64s66HtNkU34I7GaifBBlgbqU
         OorRDb3dswmSAwyi+sU1euBh7YfZ6ESspSIXEpjUdLuV2L7aQ6RxdE0WWKUtfZJArv8T
         /t6TCzIf4VG3OJBt9vNR0EuWTMs1W1Z5B1jXX3LeJnALfpRGON03wjMJZQeHNPMZK/Zq
         KmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AR8I0wDN/dMLzfAIr7EPo8Mxzi239/opAcBIALA88Dk=;
        b=Kik9pj4bu5zFGF2oUOd9N4ZkIuKKwScZfFgWuYPicLwd2JEr70SmtBJXcjJiU+V0za
         sGArTmiegv2kpl3jPmawLoNE83E9yPKxrWpIbNSFCQKUdRHCbxGlzes9+JMOE3AyROqz
         BdrvHu4icSg0MH9anB+9qnoa9FLQE0mgqMKEzWrMiN8dluzy1qqLaw2QE3Aae+1F4oyA
         EN5Lu3kyeDhUT3sdZRiY8umLoemGoDnvRSzcPMJHsGMr7v9RltTpuOpD1AozdzeidkiZ
         ZJW8HkgWs6iRZBEDDJhaX0M3THcfpRX4NYg0Tv9wSfNuusddVSmaTOCOp2FkJ4vIPYtH
         lSRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0Jk9Qj5mCFNO15UE3KTlDIXjMz7PgAbcQ3/gFH1NsHQBxNhvU
	yp94TrZd25QajJ9S7+z7nZM=
X-Google-Smtp-Source: APXvYqzF4IwkBkGKMSf0GG6jSG0bAiSAiRbDfNaebEcZ76Pm9ztHxGJ4H88qfL0VetZxMQ6o46v+Tw==
X-Received: by 2002:a05:660c:251:: with SMTP id t17mr19850098itk.7.1560276803878;
        Tue, 11 Jun 2019 11:13:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a24:2554:: with SMTP id g81ls1125503itg.3.gmail; Tue, 11 Jun
 2019 11:13:23 -0700 (PDT)
X-Received: by 2002:a24:61d7:: with SMTP id s206mr6144583itc.92.1560276803322;
        Tue, 11 Jun 2019 11:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560276803; cv=none;
        d=google.com; s=arc-20160816;
        b=kuzB6etqgEXnxWyE512CnEV376EexKO9T7XgSqU3DGWCb5uHALefQzzTZ9mKMpBYBC
         oatpHSvjMzwtv9Y2P3frORYpxCpTZtSHi75BtggeTKKrqe489qbCBj2yU+k3BD+7rq3I
         RqZeqOYKPxrN4UOCG7BdJlNYWxrXR+QWL2RDhK+tvVj5vNAUQ7LtuyoejzKgf5Yt/jcU
         8zbffnd/1mnxtvWV6Y7o9FwRSOBE3+uYSf6plL7igrG1L2fNHrpA3Bs+Ri1H6zjzlDQp
         vMXX2bcIg9/RVV/lQ3c/31EPoYj7eRq2iObWUA5pocEjXPwUMqSfssJWHB95HLbqpCQx
         hyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FtTMg6zBwx9oiswmZ8oJ/hFbSvREACuzXnCqhaIH8pw=;
        b=TfleRKcDvAGxXK9CKVohT15YC3kb1t3UD7ZiTWDpCtFhUCS2hWNPLjgTP3uxUUAKKh
         JKzV3VnPI9ewcdXYJ7JccoLXSHMgDhfOesgEymhPQM1HjtL3QyzCrtj7JbFtW9jlophY
         AKFj6S+oypNwmLsS6mD6JNPHq7nLJ+c+6HLZe1qdrDoLiM8UxoBLepCBM9zuNkVejojb
         W04aC2EjURZWY0ii+dzghN37rFkLLlkmGbU8Da96LmzcQ6P9hT3AYJYEEPr5oR0yHlOB
         AZvQsPCl23xO96hKkE2n0c7Ux5oBcaIDdfuyTYSDKXHoTZLS1OYgQlPAnMnk+u5O0Pke
         XcAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=D6yIC49q;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::82b as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com. [2607:f8b0:4864:20::82b])
        by gmr-mx.google.com with ESMTPS id t143si123563itc.0.2019.06.11.11.13.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 11:13:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::82b as permitted sender) client-ip=2607:f8b0:4864:20::82b;
Received: by mail-qt1-x82b.google.com with SMTP id x47so15642096qtk.11
        for <jailhouse-dev@googlegroups.com>; Tue, 11 Jun 2019 11:13:23 -0700 (PDT)
X-Received: by 2002:a0c:879d:: with SMTP id 29mr39340769qvj.91.1560276802538;
 Tue, 11 Jun 2019 11:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de> <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de> <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de>
In-Reply-To: <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de>
From: Wayne <racedrive1503@gmail.com>
Date: Tue, 11 Jun 2019 14:13:11 -0400
Message-ID: <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
Content-Type: multipart/alternative; boundary="0000000000009111d5058b1040ac"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=D6yIC49q;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::82b
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

--0000000000009111d5058b1040ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jan & Ralf:

I have a little good news, I have successfully gotten the non-root linux to
display some startup output based on your suggestions.  Also, there must
have been some small difference between the stock linux-x86-demo cell
config and the one I tweaked.  I went back to the original and made some
minor changes and it started displaying the serial output now for the
non-root node.

I ended up making the root cell the primary user of the ttyS0 device, and
just having the non-root linux output to the hypervisor virtual console
(console=3Djailhouse).  In my setup, there appears to be some process still
attempting to use the ttyS0 randomly on the root linux, and that causes the
hypervisor to halt it if I don't leave it in the PIO array.  Not sure who
is doing it.


This is where i'm at now.  The non-root linux keeps running into points
where it tries to access PIO and gets parked:

1. First crash:

[    0.424925]kworker/u6:0 (27) used greated stack depth: 14656 bytes left
[    0.425807]futex has table entries: 1024 (order: 4, 65536 bytes)
"FATAL: Invalid PIO write, port: 70: size 1"
...
Parking CPU 3 (Cell: "linux-x86-demo")

According to /proc/ioports, 70 has to do with the Realtime clock (rtc0).  I
was able to temporarily add the 70 mapping to the non-root linux, but
should it be there at all?  I tried to disable RTC support in the guest
kernel config.


2. On the next attempt, I then got further with a crash trying to
initialize Ser device ttyS0:

"[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled"
"FATAL: Invalid PIO read, port: 3f9: size 1"
...
Parking CPU 3 (Cell: "linux-x86-demo")

I can get around that if I allow the non-root access in its pio table, but
then I have a problem above with the root linux randomly trying to use it.


3. Now with the temporary adjustments to the non-root pio table above I get
here:

"[    0.972399]clocksource:Switched to clocksource tsc"
"FATAL: Invalid PIO read, port: 87: size 1"
...
Parking CPU 3 (Cell: "linux-x86-demo")

According to proc/ioports this one has to do with "dma page request". It
isn't mapped in my root linux PIO or non-root linux array.


Aside from the serial conflict, it seems like these should remain
controlled by the root linux or hypervisor.   Do you use a particular bare
minimum x86 kernel config on your machine for the guest to get around
these?  I know Jan mentioned the jailhouse-images project might have
something, but I couldn't find it digging around quick.

Thanks to you both for your responses and patience.  I got the root linux
up and going on my own, but the non-root guest is proving to be more
difficult.

Wayne



On Tue, Jun 11, 2019 at 11:31 AM Ralf Ramsauer <
ralf.ramsauer@oth-regensburg.de> wrote:

> Hi,
>
> On 6/10/19 7:45 PM, Wayne wrote:
> > Thank you for your responses Ralf and Jan.
> >
> > Yes, I have successfully gotten both the apic-demo and tiny-demo cells
> > to work on my system before attempting to load the non-root linux.  I
> > can see serial output from them.
> >
> > However, if I try to share the UART between root and inmate for them I
> > run into a crash on the hypervisor if the root linux attempts to write
> > to the UART (after creating/starting a demo).  Does the root linux lose
> > access once an inmate is created/started?  Or am I missing something
> > from my System config or tiny-demo config that allows them to share?  I
> > attached the crash in hypervisor_output.txt.
> >
> > Also, I noticed the tiny-demo output on the UART gets mirrored on the
>
> Yes, according to your config, JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is
> set. This means that the guest will use the virtual console. The virtual
> console uses the hypervisor output which depends whatever is set in your
> system configuration. In your case the hypervisor uses 3f8.
>
> And additionally, the inmate also a valid .console set. Again, 3f8. This
> means, it will use the console *and* the hypervisor debug hypercall. In
> your case, both outputs are routed to the same device which explains the
> mirroring.
>
> > Jailhouse virtual console.  Does that mean that its writing to the
> > serial through the hypervisor and not directly accessing ttyS0 itself?
>
> Exactly.
>
> > If so, is there a way to create the cell to write ttyS0 directly as a
> > test?  To see if it exhibits same behavior as the non-root linux.
>
> Sure, simply align the .address field of .console, and allow access to
> that port via .pio_bitmap.
>
> >
> > FYI, I create the tiny-demo like this:
> >
> > jailhouse cell create configs/x86/tiny-demo.cell
> > jailhouse cell load tiny-demo inmates/demos/x86/tiny-demo.cell
> > jailhouse cell start tiny-demo
> >
> > Going back to my original non-root linux question, I don't see any
> > output when connected over ttyS0.  Its address is 0x3f8 ("serial 1") in
> > the PIO, and that seems to work fine for the other simple demos, minus
> > the hypervisor crash issue above when sharing.  I know there is the
> > other "serial 2" port but I haven't tried to use that one.
>
> I see that port on our Dell server as well. It's present, but I don't
> know where it's connected to.
>
> Let me just summarise your issue:
>
> You only have one serial line available, right? From the root-cell's
> POV, it's ttyS0 on 3f8.
>
> I would propose to share ttyS0 between the hypervisor and non-root
> Linux. This means:
>
>   - Don't let the root-cell use ttyS0. Remove any console=3DttyS0
>     parameters from you commandline. Ensure that noone else accesses
>     ttyS0 (e.g., getty@ttyS0 or other friends)
>
>   - Set 3f8 as debug_console in your master.c (seems you already have)
>
>   - Allow 3f8 access in the linux-demo.c (already set in the default
>     linux-demo
>
>   - Disallow 2f8 access in linux-demo.c:
> -               [ 0x2f8/8 ...  0x2ff/8] =3D 0, /* serial2 */
> +               [ 0x2f8/8 ...  0x2ff/8] =3D -1, /* serial2 */
>
>     I don't know how Linux enumerates serial devices, but this ensures
>     that Linux won't see the unconnected serial line and map ttyS0 to
>     3f8
>
> >
> > non root linux launched with:
> > /tools/jailhouse cell linux configs/x86/linux-x86.cell
> > /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
>
> Then, this should actually work...
>
> And if not, then console=3Djailhouse0 should work.
>
> >
> > I can try the 4.19 siemens kernel and "next" branch for jailhouse you
> > suggested.  Do you think that combination will resolve the missing
> > serial for the non-root linux?  Otherwise, did my kernel config, system
> > config, and non-root linux cell configs look OK?
>
> I didn't look at it, but we should at least - even if some flags are
> still incorrect - see the "Uncompressing kernel..." thing.
>
> Wait -- one thing you could try: Deactivate CONFIG_EFI and especially
> CONFIG_EFI_STUBS. I'm not sure, but it could be that EFI_STUBS change
> the header format that our bootloader patches.
>
> >
> > Thanks again for your help.
>
> No problem. But it's not yet working. ;-)
>
>   Ralf
>
> >
> >
> > On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsauer
> > <ralf.ramsauer@oth-regensburg.de
> > <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
> >
> >     Hi Wayne,
> >
> >     On 6/7/19 10:04 PM, Wayne wrote:
> >     > Hi Ralf,
> >     >
> >     > Thank you for your responses.  I have attached the requested conf=
ig
> >     > files.  I am now just trying to use the same bzImage for the root
> and
> >     > the non-root linux node.
> >
> >     One question that you didn't answer: do apic-demo or tiny-demo work=
?
> >     They need to to have correct .console parameter set, so ensure that
> >     parameters are set if you run those demos in your linux-demo cell.
> Just
> >     compare it to tiny-demo.c or apic-demo.c
> >
> >     >
> >     > Yes, I am using vanilla 4.16 because the documentation indicated
> >     that it
> >     > is the first mainline release to officially support Jailhouse Gue=
st
> >     > images.  Do you suggest that I use something else?
> >
> >     As Jan already wrote: Try to use Siemens' 4.19 branch.
> >
> >     >
> >     > Right now i'm just trying to get some serial output from the
> non-root
> >     > Linux.  Hopefully, I have that configured correctly.  Ideally, I
> would
> >     > like to share the same serial console for the Root node and
> non-root
> >     > node eventually if possible.  I have been OK with using the virtu=
al
> >     > console (jailhouse console -f) for the Hypervisor output.
> >
> >     In addition to Jan's comment:
> >
> >     Currently you only have access to the jailhouse console via
> 'jailhouse
> >     console' from your root cell. Imagine your root cell crashes for so=
me
> >     reason. You will never see the fault reason, which makes things har=
d
> to
> >     debug.
> >
> >     I would suggest to configure the hypervisor to use the serial
> console.
> >     You can share the device with the non-root Linux, that's no problem=
.
> >
> >     In this case, the non-root kernel's output will always be printed t=
o
> the
> >     serial console. Directly, if you choose console=3DttySx, and indire=
ctly
> >     via the hypervisor if you choose console=3Djailhouse.
> >
> >     BTW: According to your config, your system is a PowerEdge, and the
> >     non-root cell gets both, 0x2f8 and 0x3f8. Are you sure that ttyS1 i=
s
> the
> >     correct console that you are connected to?
> >
> >     Just mentioning this as we have a similar machine here, and, afair,
> both
> >     platform serial device are 'usable', but one ends in the nirvana
> while
> >     it is accessible.
> >
> >     Ah, and one last thing: try to switch to the current next branch fo=
r
> >     jailhouse. Jan just integrated a few patches from me that might als=
o
> be
> >     relevant for your machine.
> >
> >     HTH
> >       Ralf
> >
> >     >
> >     > Wayne
> >     >
> >     > On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsauer
> >     > <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     > <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>> wrote:
> >     >
> >     >     Hi,
> >     >
> >     >     On 6/7/19 2:28 PM, Wayne wrote:
> >     >     > Hello,
> >     >     >
> >     >     > I am new to Linux development and Jailhouse.  I have
> >     successfully
> >     >     booted
> >     >     > the Jailhouse Hypervisor and root cell on a bare metal X86
> Linux
> >     >     system
> >     >     > (No QEMU).  I am now trying to load a non-root Linux cell
> >     and I have a
> >     >     > few questions.  Jailhouse accepts and starts my non-root
> >     linux cell
> >     >     > configuration and I see it as "running" through the
> >     "jailhouse cell
> >     >     > list" command.  However, I don't see any serial output from
> the
> >     >     > "non-root linux" cell booting up.  I=E2=80=99m not sure wha=
t the
> >     non-root node
> >     >     > is doing at this point.
> >     >
> >     >     Ok, first of all, can you see any output from Jailhouse's dem=
o
> >     inmates
> >     >     (e.g., tiny-demo or apic-demo)?
> >     >
> >     >     >
> >     >     >                My root node is a 4.16 kernel configured thi=
s
> >     way:
> >     >     >                               1. CONFIG_JAILHOUSE_GUEST is
> >     not set
> >     >     >                               2. CONFIG_SERIO=3Dy
> >     >     >                               3.
> >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> >     >     >
> >     >     >                My non-root node is a 4.16 kernel configured
> >     this way:
> >     >     >                               1. CONFIG_JAILHOUSE_GUEST=3Dy
> >     >     >                               2. CONFIG_SERIO=3Dm (can't se=
em
> >     to disable
> >     >     > completely in my config for 4.16)
> >     >     >                               3.
> >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1
> >     >
> >     >     Could you please provide a full .config? What branch are you
> >     exactly
> >     >     using? Vanilla 4.16?
> >     >
> >     >     Please attach your system config and your non-root linux
> >     config as well.
> >     >
> >     >     You may also want to try https://github.com/siemens/linux .
> See
> >     >     jailhouse-enabling branches for some releases.
> >     >
> >     >     >
> >     >     > In general, do the kernel config settings have to match
> between
> >     >     the root
> >     >     > node and non-linux or is the above fine?
> >     >
> >     >     No, they do not have to be the same, but they can. Still, an
> >     analysis
> >     >     requires your .config.
> >     >
> >     >     >
> >     >     > The vmlinux-4.1.16-Guest bzImage is approx 7MB, and the
> >     inmate node is
> >     >     > allocated ~75MB of RAM.
> >     >     >
> >     >     > I have a single UART, so I have configured the root cell
> >     system config
> >     >     > to output to the virtual hypervisor console:
> >     >
> >     >     Wait... You configured your root-cell to use the hypervisor
> debug
> >     >     console? How? It's only available once the hypervisor is
> >     enabled. How
> >     >     should this work?
> >     >
> >     >     But let's have a look at your configuration first.
> >     >
> >     >     So you want to:
> >     >       - Have the UART (0x3f8) available in the non-root cell
> >     >       - Use 0x3f8 as hypervisor debug console as well
> >     >       - No console for root-cell
> >     >
> >     >     Did I get this right?
> >     >
> >     >       Ralf
> >     >
> >     >     >
> >     >     > .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> >     >     >
> >     >     > .debug_console =3D {
> >     >     > .type =3D JAILHOUSE_CON_TYPE_NONE,
> >     >     > },
> >     >     >
> >     >     > and I have configured the non-root linux cell to output to
> >     the UART:
> >     >     >
> >     >     > (Added serial 0x3f8 to pio bitmap for non-root linux) and
> >     started the
> >     >     > node with this:
> >     >     >
> >     >     > ./tools/jailhouse cell linux configs/x86/linux-x86.cell
> >     >     > /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
> >     >     > (Note I also tried "console=3Djailhouse" in the command abo=
ve,
> >     and that
> >     >     > produces the same result)
> >     >     >
> >     >     > I then see the following on my hypervisor console
> >     (./tools/jailhouse
> >     >     > console -f):
> >     >     >
> >     >     > Created cell "linux-x86-demo"
> >     >     > ...
> >     >     > Cell "linux-x86-demo" can be loaded
> >     >     > Started cell "linux-x86-demo"
> >     >     >
> >     >     > After a little while I do get a parked CPU error on the roo=
t
> >     node,
> >     >     looks
> >     >     > like its trying to do something with the UART as well:
> >     >     > FATAL: Invalid PIO read, port: 3fe size: 1
> >     >     >
> >     >     > I would expect something to pop out on the UART from the
> >     non-root
> >     >     linux
> >     >     > node first.  Note that root node has serial 0x3f8 disabled
> >     in its pio
> >     >     > bitmap.
> >     >     >
> >     >     > I verifed that the UART is functioning by allowing the
> >     hypervisor to
> >     >     > print to it and also performed an echo test over ttyS0.
> >     >     >
> >     >     > I have tried several configurations of kernel.....including
> your
> >     >     current
> >     >     > "queues/jailhouse" branch head kernel for the non-root node=
,
> >     along
> >     >     with
> >     >     > the kernel config for 4.7 posted in this thread below (but =
I
> >     get same
> >     >     > result as above when I start it, no kernel output):
> >     >     >
> >     >     >
> >     >
> >       "
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >     >     >
> >     >     > Any information you can provide to me will be helpful.  I'm
> >     not sure
> >     >     > what might be going wrong here.
> >     >     >
> >     >     > Thanks,
> >     >     > Wayne
> >     >     >
> >     >     > --
> >     >     > You received this message because you are subscribed to the
> >     Google
> >     >     > Groups "Jailhouse" group.
> >     >     > To unsubscribe from this group and stop receiving emails
> >     from it, send
> >     >     > an email to jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >     >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>>.
> >     >     > To view this discussion on the web visit
> >     >     >
> >     >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
> >     >     >
> >     >
> >      <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> >     >     > For more options, visit https://groups.google.com/d/optout.
> >     >
> >
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%2BKhc0FZSWvVZZyV%2B4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig%40m=
ail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--0000000000009111d5058b1040ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Jan &amp; Ralf:<br><br>I have a little good news, I h=
ave successfully gotten the non-root linux to display some startup output b=
ased on your suggestions.=C2=A0 Also, there must have been some small diffe=
rence between the stock linux-x86-demo cell config and the one I tweaked.=
=C2=A0 I went back to the original and made some minor changes and it start=
ed displaying the serial output now for the non-root node.<br><br>I ended u=
p making the root cell the primary user of the ttyS0 device, and just havin=
g the non-root linux output to the hypervisor virtual console (console=3Dja=
ilhouse).=C2=A0 In my setup, there appears to be some process still attempt=
ing to use the ttyS0 randomly on the root linux, and that causes the hyperv=
isor to halt it if I don&#39;t leave it in the PIO array.=C2=A0 Not sure wh=
o is doing it.<br><br><br>This is where i&#39;m at now.=C2=A0 The non-root =
linux keeps running into points where it tries to access PIO and gets parke=
d:<br><br>1. First crash:<br><br>[ =C2=A0 =C2=A00.424925]kworker/u6:0 (27) =
used greated stack depth: 14656 bytes left<br>[ =C2=A0 =C2=A00.425807]futex=
 has table entries: 1024 (order: 4, 65536 bytes)<br>&quot;FATAL: Invalid PI=
O write, port: 70: size 1&quot;<br>...<br>Parking CPU 3 (Cell: &quot;linux-=
x86-demo&quot;)<br><br>According to /proc/ioports, 70 has to do with the Re=
altime clock (rtc0).=C2=A0 I was able to temporarily add the 70 mapping to =
the non-root linux, but should it be there at all?=C2=A0 I tried to disable=
 RTC support in the guest kernel config.<br><br><br>2. On the next attempt,=
 I then got further with a crash trying to initialize Ser device ttyS0:<br>=
<br>&quot;[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 driver, 1 ports, IRQ s=
haring enabled&quot;<br>&quot;FATAL: Invalid PIO read, port: 3f9: size 1&qu=
ot;<br>...<br>Parking CPU 3 (Cell: &quot;linux-x86-demo&quot;)<br><br>I can=
 get around that if I allow the non-root access in its pio table, but then =
I have a problem above with the root linux randomly trying to use it.<br><b=
r><br>3. Now with the temporary adjustments to the non-root pio table above=
 I get here:<br><br>&quot;[ =C2=A0 =C2=A00.972399]clocksource:Switched to c=
locksource tsc&quot;<br>&quot;FATAL: Invalid PIO read, port: 87: size 1&quo=
t;<br>...<br>Parking CPU 3 (Cell: &quot;linux-x86-demo&quot;)<br><br>Accord=
ing to proc/ioports this one has to do with &quot;dma page request&quot;. I=
t isn&#39;t mapped in my root linux PIO or non-root linux array.<br><br><br=
>Aside from the serial conflict, it seems like these should remain controll=
ed by the root linux or hypervisor.=C2=A0 =C2=A0Do you use a particular bar=
e minimum x86 kernel config on your machine for the guest to get around the=
se?=C2=A0 I know Jan mentioned the jailhouse-images project might have some=
thing, but I couldn&#39;t find it digging around quick.<br><br>Thanks to yo=
u both for your responses and patience.=C2=A0 I got the root linux up and g=
oing on my own, but the non-root guest is proving to be more difficult.<br>=
<br>Wayne<br></div><div><br></div><div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 11, 2019 at 11=
:31 AM Ralf Ramsauer &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de"=
>ralf.ramsauer@oth-regensburg.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<br>
On 6/10/19 7:45 PM, Wayne wrote:<br>
&gt; Thank you for your responses Ralf and Jan.<br>
&gt; <br>
&gt; Yes, I have successfully gotten both the apic-demo and tiny-demo cells=
<br>
&gt; to work on my system before attempting to load the non-root linux.=C2=
=A0 I<br>
&gt; can see serial output from them.<br>
&gt; <br>
&gt; However, if I try to share the UART between root and inmate for them I=
<br>
&gt; run into a crash on the hypervisor if the root linux attempts to write=
<br>
&gt; to the UART (after creating/starting a demo).=C2=A0 Does the root linu=
x lose<br>
&gt; access once an inmate is created/started?=C2=A0 Or am I missing someth=
ing<br>
&gt; from my System config or tiny-demo config that allows them to share?=
=C2=A0 I<br>
&gt; attached the crash in hypervisor_output.txt.<br>
&gt; <br>
&gt; Also, I noticed the tiny-demo output on the UART gets mirrored on the<=
br>
<br>
Yes, according to your config, JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is<br>
set. This means that the guest will use the virtual console. The virtual<br=
>
console uses the hypervisor output which depends whatever is set in your<br=
>
system configuration. In your case the hypervisor uses 3f8.<br>
<br>
And additionally, the inmate also a valid .console set. Again, 3f8. This<br=
>
means, it will use the console *and* the hypervisor debug hypercall. In<br>
your case, both outputs are routed to the same device which explains the<br=
>
mirroring.<br>
<br>
&gt; Jailhouse virtual console.=C2=A0 Does that mean that its writing to th=
e<br>
&gt; serial through the hypervisor and not directly accessing ttyS0 itself?=
 <br>
<br>
Exactly.<br>
<br>
&gt; If so, is there a way to create the cell to write ttyS0 directly as a<=
br>
&gt; test?=C2=A0 To see if it exhibits same behavior as the non-root linux.=
<br>
<br>
Sure, simply align the .address field of .console, and allow access to<br>
that port via .pio_bitmap.<br>
<br>
&gt; <br>
&gt; FYI, I create the tiny-demo like this:<br>
&gt; <br>
&gt; jailhouse cell create configs/x86/tiny-demo.cell<br>
&gt; jailhouse cell load tiny-demo inmates/demos/x86/tiny-demo.cell =C2=A0<=
br>
&gt; jailhouse cell start tiny-demo<br>
&gt; <br>
&gt; Going back to my original non-root linux question, I don&#39;t see any=
<br>
&gt; output when connected over ttyS0.=C2=A0 Its address is 0x3f8 (&quot;se=
rial 1&quot;) in<br>
&gt; the PIO, and that seems to work fine for the other simple demos, minus=
<br>
&gt; the hypervisor crash issue above when sharing.=C2=A0 I know there is t=
he<br>
&gt; other &quot;serial 2&quot; port but I haven&#39;t tried to use that on=
e.<br>
<br>
I see that port on our Dell server as well. It&#39;s present, but I don&#39=
;t<br>
know where it&#39;s connected to.<br>
<br>
Let me just summarise your issue:<br>
<br>
You only have one serial line available, right? From the root-cell&#39;s<br=
>
POV, it&#39;s ttyS0 on 3f8.<br>
<br>
I would propose to share ttyS0 between the hypervisor and non-root<br>
Linux. This means:<br>
<br>
=C2=A0 - Don&#39;t let the root-cell use ttyS0. Remove any console=3DttyS0<=
br>
=C2=A0 =C2=A0 parameters from you commandline. Ensure that noone else acces=
ses<br>
=C2=A0 =C2=A0 ttyS0 (e.g., getty@ttyS0 or other friends)<br>
<br>
=C2=A0 - Set 3f8 as debug_console in your master.c (seems you already have)=
<br>
<br>
=C2=A0 - Allow 3f8 access in the linux-demo.c (already set in the default<b=
r>
=C2=A0 =C2=A0 linux-demo<br>
<br>
=C2=A0 - Disallow 2f8 access in linux-demo.c:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ 0x2f8/8 ...=C2=A0=
 0x2ff/8] =3D 0, /* serial2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ 0x2f8/8 ...=C2=A0=
 0x2ff/8] =3D -1, /* serial2 */<br>
<br>
=C2=A0 =C2=A0 I don&#39;t know how Linux enumerates serial devices, but thi=
s ensures<br>
=C2=A0 =C2=A0 that Linux won&#39;t see the unconnected serial line and map =
ttyS0 to<br>
=C2=A0 =C2=A0 3f8<br>
<br>
&gt; <br>
&gt; non root linux launched with:<br>
&gt; /tools/jailhouse cell linux configs/x86/linux-x86.cell<br>
&gt; /boot/vmlinux-4.1.16-Guest -c &quot;console=3DttyS0,115200&quot;<br>
<br>
Then, this should actually work...<br>
<br>
And if not, then console=3Djailhouse0 should work.<br>
<br>
&gt; <br>
&gt; I can try the 4.19 siemens kernel and &quot;next&quot; branch for jail=
house you<br>
&gt; suggested.=C2=A0 Do you think that combination will resolve the missin=
g<br>
&gt; serial for the non-root linux?=C2=A0 Otherwise, did my kernel config, =
system<br>
&gt; config, and non-root linux cell configs look OK?<br>
<br>
I didn&#39;t look at it, but we should at least - even if some flags are<br=
>
still incorrect - see the &quot;Uncompressing kernel...&quot; thing.<br>
<br>
Wait -- one thing you could try: Deactivate CONFIG_EFI and especially<br>
CONFIG_EFI_STUBS. I&#39;m not sure, but it could be that EFI_STUBS change<b=
r>
the header format that our bootloader patches.<br>
<br>
&gt; <br>
&gt; Thanks again for your help.<br>
<br>
No problem. But it&#39;s not yet working. ;-)<br>
<br>
=C2=A0 Ralf<br>
<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsauer<br>
&gt; &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=3D"_blan=
k">ralf.ramsauer@oth-regensburg.de</a><br>
&gt; &lt;mailto:<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=
=3D"_blank">ralf.ramsauer@oth-regensburg.de</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Wayne,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 6/7/19 10:04 PM, Wayne wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Ralf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thank you for your responses.=C2=A0 I have att=
ached the requested config<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; files.=C2=A0 I am now just trying to use the s=
ame bzImage for the root and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the non-root linux node.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0One question that you didn&#39;t answer: do apic-de=
mo or tiny-demo work?<br>
&gt;=C2=A0 =C2=A0 =C2=A0They need to to have correct .console parameter set=
, so ensure that<br>
&gt;=C2=A0 =C2=A0 =C2=A0parameters are set if you run those demos in your l=
inux-demo cell. Just<br>
&gt;=C2=A0 =C2=A0 =C2=A0compare it to tiny-demo.c or apic-demo.c<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Yes, I am using vanilla 4.16 because the docum=
entation indicated<br>
&gt;=C2=A0 =C2=A0 =C2=A0that it<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; is the first mainline release to officially su=
pport Jailhouse Guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; images.=C2=A0 Do you suggest that I use someth=
ing else?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0As Jan already wrote: Try to use Siemens&#39; 4.19 =
branch.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Right now i&#39;m just trying to get some seri=
al output from the non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Linux.=C2=A0 Hopefully, I have that configured=
 correctly.=C2=A0 Ideally, I would<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; like to share the same serial console for the =
Root node and non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; node eventually if possible.=C2=A0 I have been=
 OK with using the virtual<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; console (jailhouse console -f) for the Hypervi=
sor output.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In addition to Jan&#39;s comment:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Currently you only have access to the jailhouse con=
sole via &#39;jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0console&#39; from your root cell. Imagine your root=
 cell crashes for some<br>
&gt;=C2=A0 =C2=A0 =C2=A0reason. You will never see the fault reason, which =
makes things hard to<br>
&gt;=C2=A0 =C2=A0 =C2=A0debug.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I would suggest to configure the hypervisor to use =
the serial console.<br>
&gt;=C2=A0 =C2=A0 =C2=A0You can share the device with the non-root Linux, t=
hat&#39;s no problem.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In this case, the non-root kernel&#39;s output will=
 always be printed to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0serial console. Directly, if you choose console=3Dt=
tySx, and indirectly<br>
&gt;=C2=A0 =C2=A0 =C2=A0via the hypervisor if you choose console=3Djailhous=
e.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0BTW: According to your config, your system is a Pow=
erEdge, and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-root cell gets both, 0x2f8 and 0x3f8. Are you s=
ure that ttyS1 is the<br>
&gt;=C2=A0 =C2=A0 =C2=A0correct console that you are connected to?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Just mentioning this as we have a similar machine h=
ere, and, afair, both<br>
&gt;=C2=A0 =C2=A0 =C2=A0platform serial device are &#39;usable&#39;, but on=
e ends in the nirvana while<br>
&gt;=C2=A0 =C2=A0 =C2=A0it is accessible.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Ah, and one last thing: try to switch to the curren=
t next branch for<br>
&gt;=C2=A0 =C2=A0 =C2=A0jailhouse. Jan just integrated a few patches from m=
e that might also be<br>
&gt;=C2=A0 =C2=A0 =C2=A0relevant for your machine.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0HTH<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Wayne<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsauer<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:ralf.ramsauer@oth-regens=
burg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ralf.ramsauer@oth-rege=
nsburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:ralf.ramsauer@oth=
-regensburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ralf.ramsauer@oth-rege=
nsburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de</a>&gt;&gt;&gt=
; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On 6/7/19 2:28 PM, Wayne wr=
ote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I am new to Linux deve=
lopment and Jailhouse.=C2=A0 I have<br>
&gt;=C2=A0 =C2=A0 =C2=A0successfully<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0booted<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; the Jailhouse Hypervis=
or and root cell on a bare metal X86 Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0system<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; (No QEMU).=C2=A0 I am =
now trying to load a non-root Linux cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0and I have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; few questions.=C2=A0 J=
ailhouse accepts and starts my non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0linux cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; configuration and I se=
e it as &quot;running&quot; through the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;jailhouse cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; list&quot; command.=C2=
=A0 However, I don&#39;t see any serial output from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;non-root linux&q=
uot; cell booting up.=C2=A0 I=E2=80=99m not sure what the<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-root node<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; is doing at this point=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Ok, first of all, can you s=
ee any output from Jailhouse&#39;s demo<br>
&gt;=C2=A0 =C2=A0 =C2=A0inmates<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0(e.g., tiny-demo or apic-de=
mo)?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My root node is a 4.16 kernel configured =
this<br>
&gt;=C2=A0 =C2=A0 =C2=A0way:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1. CONFIG_JAILHOUSE_GUEST is<br>
&gt;=C2=A0 =C2=A0 =C2=A0not set<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 2. CONFIG_SERIO=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 3.<br>
&gt;=C2=A0 =C2=A0 =C2=A0CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My non-root node is a 4.16 kernel configu=
red<br>
&gt;=C2=A0 =C2=A0 =C2=A0this way:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1. CONFIG_JAILHOUSE_GUEST=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 2. CONFIG_SERIO=3Dm (can&#39;t seem<br>
&gt;=C2=A0 =C2=A0 =C2=A0to disable<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; completely in my confi=
g for 4.16)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 3.<br>
&gt;=C2=A0 =C2=A0 =C2=A0CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Could you please provide a =
full .config? What branch are you<br>
&gt;=C2=A0 =C2=A0 =C2=A0exactly<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0using? Vanilla 4.16?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Please attach your system c=
onfig and your non-root linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0config as well.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0You may also want to try <a=
 href=3D"https://github.com/siemens/linux" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/siemens/linux</a> . See<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0jailhouse-enabling branches=
 for some releases.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; In general, do the ker=
nel config settings have to match between<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0the root<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; node and non-linux or =
is the above fine?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0No, they do not have to be =
the same, but they can. Still, an<br>
&gt;=C2=A0 =C2=A0 =C2=A0analysis<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0requires your .config.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; The vmlinux-4.1.16-Gue=
st bzImage is approx 7MB, and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0inmate node is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; allocated ~75MB of RAM=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I have a single UART, =
so I have configured the root cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0system config<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; to output to the virtu=
al hypervisor console:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Wait... You configured your=
 root-cell to use the hypervisor debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0console? How? It&#39;s only=
 available once the hypervisor is<br>
&gt;=C2=A0 =C2=A0 =C2=A0enabled. How<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0should this work?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0But let&#39;s have a look a=
t your configuration first.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0So you want to:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 - Have the UART (0x3=
f8) available in the non-root cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 - Use 0x3f8 as hyper=
visor debug console as well<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 - No console for roo=
t-cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Did I get this right?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; .flags =3D JAILHOUSE_S=
YS_VIRTUAL_DEBUG_CONSOLE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; .debug_console =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; .type =3D JAILHOUSE_CO=
N_TYPE_NONE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; and I have configured =
the non-root linux cell to output to<br>
&gt;=C2=A0 =C2=A0 =C2=A0the UART:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; (Added serial 0x3f8 to=
 pio bitmap for non-root linux) and<br>
&gt;=C2=A0 =C2=A0 =C2=A0started the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; node with this:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; ./tools/jailhouse cell=
 linux configs/x86/linux-x86.cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; /boot/vmlinux-4.1.16-G=
uest -c &quot;console=3DttyS0,115200&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; (Note I also tried &qu=
ot;console=3Djailhouse&quot; in the command above,<br>
&gt;=C2=A0 =C2=A0 =C2=A0and that<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; produces the same resu=
lt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I then see the followi=
ng on my hypervisor console<br>
&gt;=C2=A0 =C2=A0 =C2=A0(./tools/jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; console -f):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Created cell &quot;lin=
ux-x86-demo&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cell &quot;linux-x86-d=
emo&quot; can be loaded<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Started cell &quot;lin=
ux-x86-demo&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; After a little while I=
 do get a parked CPU error on the root<br>
&gt;=C2=A0 =C2=A0 =C2=A0node,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0looks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; like its trying to do =
something with the UART as well:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; FATAL: Invalid PIO rea=
d, port: 3fe size: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I would expect somethi=
ng to pop out on the UART from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; node first.=C2=A0 Note=
 that root node has serial 0x3f8 disabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0in its pio<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; bitmap.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I verifed that the UAR=
T is functioning by allowing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0hypervisor to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; print to it and also p=
erformed an echo test over ttyS0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I have tried several c=
onfigurations of kernel.....including your<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0current<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;queues/jailhouse=
&quot; branch head kernel for the non-root node,<br>
&gt;=C2=A0 =C2=A0 =C2=A0along<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; the kernel config for =
4.7 posted in this thread below (but I<br>
&gt;=C2=A0 =C2=A0 =C2=A0get same<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; result as above when I=
 start it, no kernel output):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0&quot;<a href=3D"https://groups.google.=
com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$20to$20boot$20jailhouse%7=
Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAAJ" rel=3D"noreferrer" =
target=3D"_blank">https://groups.google.com/forum/#!searchin/jailhouse-dev/=
Re$3A$20Failed$20to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO8=
9XFIk0/Qi40DDuMBAAJ</a>&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Any information you ca=
n provide to me will be helpful.=C2=A0 I&#39;m<br>
&gt;=C2=A0 =C2=A0 =C2=A0not sure<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; what might be going wr=
ong here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Wayne<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; You received this mess=
age because you are subscribed to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0Google<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Groups &quot;Jailhouse=
&quot; group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; To unsubscribe from th=
is group and stop receiving emails<br>
&gt;=C2=A0 =C2=A0 =C2=A0from it, send<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; an email to <a href=3D=
"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" target=3D"_blank">jai=
lhouse-dev+unsubscribe@googlegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhouse-dev%252Bunsu=
bscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2Bunsubscribe@goo=
glegroups.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:jailhouse-dev%252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhou=
se-dev%2Bunsubscribe@googlegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhouse-dev%25252Bun=
subscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%252Bunsubscribe=
@googlegroups.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"=
mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" target=3D"_blank">jail=
house-dev+unsubscribe@googlegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhouse-dev%252Bunsu=
bscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2Bunsubscribe@goo=
glegroups.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:jailhouse-dev%252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhou=
se-dev%2Bunsubscribe@googlegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhouse-dev%25252Bun=
subscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%252Bunsubscribe=
@googlegroups.com</a>&gt;&gt;&gt;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; To view this discussio=
n on the web visit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%4=
0mail.gmail.com" rel=3D"noreferrer" target=3D"_blank">https://groups.google=
.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLz=
uVZ4K3Bt5eA%40mail.gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&lt;<a href=3D"https://groups.google.com/d/ms=
gid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5=
eA%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"nore=
ferrer" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/C=
A%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com=
?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; For more options, visi=
t <a href=3D"https://groups.google.com/d/optout" rel=3D"noreferrer" target=
=3D"_blank">https://groups.google.com/d/optout</a>.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%2BKhc0FZSWvVZZyV%2B4_F0TO7dHPN70Mn3LUCmq_3M2=
fnGN4ig%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0FZSWvVZZyV%2B4_F0TO7dHPN7=
0Mn3LUCmq_3M2fnGN4ig%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--0000000000009111d5058b1040ac--
