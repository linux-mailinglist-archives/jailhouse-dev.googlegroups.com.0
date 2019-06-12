Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBZVGQXUAKGQENWSKM2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC943039
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 21:32:56 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id y3sf16347088ybp.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 12:32:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560367975; cv=pass;
        d=google.com; s=arc-20160816;
        b=ztu/fgTF21oL0j5f1Efsp2ETq03ExYReqoxZHL8ohFjHFaNtbmGUDGuKRVTP07bhcG
         12pGedm2Dsr3c8Tf+FNa4CFH6JIgz0mhaBp6sroIcMf7QOSQZR8PLCgtqZIdKA2DlHvS
         jPqk3My7RVJdL+NeoHZglOWPzgkHzJsbvbg8FbKXKe+7fGaUx8284NF2c3KOlwUYDFa9
         eJsjtSbGzQheuLfY33BfzleonNchLTcFLWQESryQEYcsZ16y8laamlIYO5+v8osdZfYA
         nhYyE+IurwDAsR6hSjPxlc7IFD4Q4TVJ1ceumlfYnUAJHjMx+YEi+9EqmdGpP1zQ6KJt
         l2iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=y9TRLeXxhgxk5cEeEwSUQgY1ibwljwgAip1LLbW6MNg=;
        b=uO64bYHMmq/lv+56lJtSR7ja+X+xAFJle54R6ZDqnVPD4RFPbhIyYfF4IL0lurv0O+
         O5kUHprvXVP0nkiSgRUjc6+BhzLCp6kKggeASJJJYbYs6eMevwftOWbPnAlbmrgCpL7V
         kziwIwY51EjA1pnlPDHoOu8hG2juTGGgpSKst28N440BNv3YEoVFYcFQ4rCgc5QhyLV+
         +NDLcMcTtR99H4iJGG3OVtrzDhLQ1paNDYQNvgSmp3aH8YvtXZXa/OzVHW+kgnt+w4OY
         oArXTVfPUf+Vb2JK8hNnRSAQ0DQh55ksoTqugwgZzxlgChGCUf/EDuQ60/5GAYMiddml
         sTWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=d6IhKQ+G;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::741 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y9TRLeXxhgxk5cEeEwSUQgY1ibwljwgAip1LLbW6MNg=;
        b=CbHWzC5CSbgUWA8kprNC4kTWi9OA6m5QRT01XPSOlia1m44mCwon4tTCLwGFfY/0tD
         TfSxf2usGq/7MccAZcVV/yVwF+KvHWCAWetXYg5E6r+MdBGVy65coWj8A6axiQk7Frq1
         YWgOpqPvGyafZzIitc70rQLPOxI6CEeOJfTl+opISIHhFY0G4f8+Ub7GwYs1ACxxkzr1
         +9Ad6wm5FYS/X6dI6HeKP/kDensll+RCvu4lvvKz6319FToTcEEObzqnUNTYdRigtG9p
         M3yT1FmrmpNvE0+P7FWKnA2HNclxgQzgcRdF3TnhyzDu29KLV2dCuWuwgt0u+TYF24Hs
         MyCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y9TRLeXxhgxk5cEeEwSUQgY1ibwljwgAip1LLbW6MNg=;
        b=o8XX5my2JzGAKWNb8JKgQGYGSmF+KibtW49sPjgh0zlq7h+Zf56oZotBNHKv7jvhq0
         MeExvlJI6pCI9BQS/uryKt3MEaGZUfpHRAjSDPQyjjGi4mdpViwL5Xf9HFCzuS+FrAsR
         QVWFt+JT3N0abMIOhCh1TC3Xg/qRn1AkLeekIgl/RGexOHY5uEsqZxI7jTE3G5+PGxOP
         sK020a4/yi0qKvBAhvwzwZSYGkDTQVkQHyGLRiLDiobqI22hhYQDcSzM6ZhfuUvtJ9n7
         2hx8ltIyxBgPwkBEen9V36nIxaZodiIrZVahC1llwq1BvYBIBvBPY9W0kNixQX8n7Pzy
         tvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y9TRLeXxhgxk5cEeEwSUQgY1ibwljwgAip1LLbW6MNg=;
        b=koWWdP2tVwKUhmAnmTqDXdw0alfzwVxaYtpgZXZ7mr4daalhlqts4YAKx4MMP/pt7X
         MHYCrk/RC14VpWMMWeKfIx9jN0ZOuOP32tx7Mh0C9JDlB7PcuyKEfwAn+Dh4NEbQuyKb
         GvBSYsWtcB5b1qabVfLyaYrPE0p9huK6lRm1euPH79A/VQ4X82QLzSkb3pWnSmVTt2Eo
         ndKY1rFDGa/jQHB3FXIHxZSXSpDrKaN2+bHEfqCTJHAAOlrChVPU7EGTLWxXlUemlTr2
         iBpmkazB0o8lDQ9VrqhjUulVOj/8i3aQuV2OlFLyQY2y8wQC1FX3F5ePFSOBWIIAJPe8
         l+Nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWrjPvLVSfZyulwckzLaBEQVRWnjwsTichzem3yfSLCkU986dtP
	furwaFe9PzrAhmKzUJMQEuc=
X-Google-Smtp-Source: APXvYqzjItMrX60IC0yzbwz/F/S5uRecJwdveqaQgKxLY7rKbFwIMelErSHxKjDsa/YdMjs1Z9uvfA==
X-Received: by 2002:a25:6889:: with SMTP id d131mr2152963ybc.101.1560367975120;
        Wed, 12 Jun 2019 12:32:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:e301:: with SMTP id m1ls469124ywe.3.gmail; Wed, 12 Jun
 2019 12:32:54 -0700 (PDT)
X-Received: by 2002:a81:79c7:: with SMTP id u190mr47083828ywc.433.1560367974370;
        Wed, 12 Jun 2019 12:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560367974; cv=none;
        d=google.com; s=arc-20160816;
        b=fA/7Q0l/pmgA/hL8E6PYv2LhOxfIZZtQHjD4TIDZ+D8iV4Q/PmQDp0g4d6WaEuZal3
         jOaUpZTAwIrVawoD/UkNuSmTKfLp/htrZn99cwMYeL+AWYwNhT3/7RmDy5NeyMhWMPv6
         eQIzDSj28WAOwCChijBQR9kamGTeRJIGNVZb5yuXCqoytmSC429cZKHc+0aPH2+Ta/VB
         Oo9f0j4u9oI2mu+S1y1KFZiLBAPdReFjfbB4Xi4lXVaMEVFWixyS+A8i+kP6WjIMruLc
         i89H9LR5JJuV9d/nbbauqm0ZD2i/piXF/HqmPOS5qwZyp79QpDGxIKg1b2TaMLks28Yh
         1TNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gWCZ7NeVPZEhaOCnV//7n3c3afxKCqn8W9pKORait4E=;
        b=Y6PUAiO4JY3XwKylZ7x1Zu/+W/k0fw1Z9eu9efh3yjkQ2opphgwMSul7aQiffzhp+Z
         +3hHZ5iYt0EdpZkoolQni9R6IPLNwxSmobjkH+EyiVsTnZThOm/DVPDT7lDs4Fz0GSKi
         wOKrj4JeJpNQx2SE2hy/n2y7+qKmNN/dd2IHWzUhb6Zi6rwjkl1acrTSH60HXP9EPBYe
         D5EO3Ne8gzyxVuDxZLWbMt5GJju1XUXOzA7achHSMSWXga55pb8/JDu0R3bmtDtrUGvT
         ZL0YoEFE8zNJTgjJJjCkXbBzEyS7tu37Kb9V+Uhi+k0OEpo0VkQeIvoJodpTukk8sxHQ
         o7Yw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=d6IhKQ+G;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::741 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com. [2607:f8b0:4864:20::741])
        by gmr-mx.google.com with ESMTPS id s12si47098ywg.0.2019.06.12.12.32.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 12:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::741 as permitted sender) client-ip=2607:f8b0:4864:20::741;
Received: by mail-qk1-x741.google.com with SMTP id w187so11112618qkb.11
        for <jailhouse-dev@googlegroups.com>; Wed, 12 Jun 2019 12:32:54 -0700 (PDT)
X-Received: by 2002:a37:aac5:: with SMTP id t188mr67110712qke.157.1560367973752;
 Wed, 12 Jun 2019 12:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de> <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de> <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de> <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
 <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
 <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de> <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
 <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de>
In-Reply-To: <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de>
From: Wayne <racedrive1503@gmail.com>
Date: Wed, 12 Jun 2019 15:32:42 -0400
Message-ID: <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
Content-Type: multipart/alternative; boundary="000000000000cb63c8058b257a6d"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=d6IhKQ+G;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::741
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

--000000000000cb63c8058b257a6d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry about the formatting.  It didn't look like that before I sent it.

I will double check my linux-x86-demo cell config again for the serial IRQ
mapping. Also I will build in the CONFIG_CRASH_CELL_ON_PANIC define for
help going forward.

Can the "jailhouse cell linux" command take an initramfs image (.img)
through the "-i option" or does it need to be an initrd?  If initrd only,
can you point me to an example x86 rootfs.cpio image?  I'm having trouble
installing Buildroot on my machine.

Thanks again,
Wayne

On Wed, Jun 12, 2019 at 1:17 PM Ralf Ramsauer <
ralf.ramsauer@oth-regensburg.de> wrote:

> Hi Wayne,
>
> On 6/12/19 3:55 PM, Wayne wrote:
> > Ralf/Jan,
> >
> >  Are you sure you remove the device from the kernel cmdline? *Yes, ther=
e
> > is no ttyS* device in my root linux cmdline*
> > - Are you sure that there doesn't spawn a tty? Check with systemctl. *N=
o
> > tty as far as I can tell, verified with "lsof | grep ttyS".  The lsof
> > command stops working after the crash though*
>
> please use plain text mails. It's getting hard to read :-)
>
> > - lsof | grep ttyS
> > - The root-cell might receive the serial device's interrupt, while its
> >   ports are assigned to the non-root cell. Does the crash happen when
> >   you type in a character to the serial line? *This is possible, do you
> > have an example of how I would accomplish assigning the interrupt (IRQ =
4
> > for ttyS0) to the non-root?  To rule out the interrupt concern.*
>
> Compare linux-x86-demo.c. The .pin_bitmap field denotes the interrupts
> that are routed to the cell. If you use the original linux-x86-demo.c,
> then interrupt 4 should already be routed to the cell.
>
> AFAICT, in linux-x86-demo.c, we assign IRQ 3 & 4. In your case, we also
> remove the other IRQ from the root cell - IRQ 3 should be commented out.
>
> BTW, a helpful debugging feature:
> echo "#define CONFIG_CRASH_CELL_ON_PANIC 1" >> include/hypervisor/config.=
h
>
> This will let the root cell print a stackdump which gives you a hint
> what codepath caused the crash.
>
> >
> >   In this case, assign the interrupt to the non-root cell. You will nee=
d
> >   it in any case there once you have a initrd and want to type in stuff=
.
> >
> > So there must be some reason why the crash happens. The hard way is to
> > add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell. *I can u=
se
> > this method for now to continue booting the non-root linux.*
> >
> >>
> >>        if I leave out the pio mapping in the non-root linux, and
> >> alolothat block in the root cell instead then the non-root linux gets =
a
> >> PIO read fault on "0x3F9" while booting.
> >>        Ralf mentioned that Linux would not try enumerate the device if
> >> its set to -1 ( [0x3f8/8 ... 0x3ff/8] =3D -1)  , but the non-root seem=
s to
> >> attempt to do something with it anyway:
> >>
> >> "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled=
"
> >> "FATAL: Invalid PIO read, port: 3f9: size 1"
> >
> > Hmm. At least that's what I thought. I don't know how enumeration of
> > platform devices works exactly, but reconsidering this, the behaviour
> > above makes sense: How would it know that a platform device is not
> > present, depending of the configuration of the pio_bitmap.   *Since I d=
o
> > technically have two serial ports, is there a way (via command line or
> > kernel config for ex) to hardcode what the non-root would enumerate for
> > the UART when its booting up?  Meaning, force it to "see" the 0x2f8
> > serial port as ttyS0 instead of 0x3f8 when booting up
> > and** CONFIG_SERIAL_8250_RUNTIME_UARTS =3D 1**.  That way if you had sa=
y
> > three serial ports and three cells (1 root, 2 non-root linux) then each
> > could have their own separate dedicated ttyS0.*
>
> Have a look at the documentation of the 8250 driver, don't know by heart.
>
> HTH,
>   Ralf
>
> > *
> > *
> > As far as just booting the non-root besides the serial concern, I
> > haven't provided an initramfs to my non-root linux yet.  I would like t=
o
> > probably boot it with a simple ramdisk if possible to get a point where
> > I can log in.
> > *
> > *
> > Thanks,
> > Wayne
> >
> > On Wed, Jun 12, 2019 at 6:43 AM Ralf Ramsauer
> > <ralf.ramsauer@oth-regensburg.de
> > <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
> >
> >     Hi,
> >
> >     On 6/11/19 11:05 PM, Wayne wrote:
> >     > Jan/Ralf,
> >     >
> >     > I was able to get past issues 1 and 3 above by using Jan's kernel
> >     config
> >     > from this thread:
> >     >
> >     >
> >
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >     >
> >     > The DMA issue was resolved by disabling kernel
> >     option CONFIG_ISA_DMA_API
> >     > as stated in another thread, and reflected in the config file
> above.
> >     >
> >     > So now I think i've almost got the non-root linux booting.  I'm
> >     stuck at
> >     > the point where its trying to mount a filesystem and since i'm no=
t
> >     > providing an initramfs it panics.
> >
> >     Perfect!
> >
> >     >
> >     > Similar to the output below:
> >     >
> >     > [ 1.080178] VFS: Cannot open root device "(null)" or
> >     unknown-block(0,0):
> >     > error -6
> >     > [ 1.087662] Please append a correct "root=3D" boot option; here a=
re
> the
> >     > available partitions:
> >     > [ 1.096013] Kernel panic - not syncing: VFS: Unable to mount root
> >     fs on
> >     > unknown-block(0,0)
> >     >
> >     > I have just a couple more questions:
> >     > 1. In general, is it true that an inmate will takeover control
> >     from the
> >     > root of any resource in the following arrays, or are there some
> cases
> >     > where they get "shared" between the root and inmate?
> >
> >     Depends.
> >
> >     >      A. ".mem_regions" -> Shared?
> >
> >     May be shared with the root cell (i.e., if the region has the flag
> >     JAILHOUSE_MEM_ROOTSHARED set).
> >
> >     >      B. ".irqchips" -> Shared?
> >
> >     Shared with whom? Only one guest runs on a CPU. This guest will hav=
e
> >     full access to the irqchip. Some accesses must be intercepted.
> >
> >     >      C. ".pio_bitmap" -> Inmate takes control of these if matchin=
g
> >     > between inmate and root
> >
> >     Exclusive control.
> >
> >     >      D. ".pci_devices" -> Inmate takes control?
> >
> >     Exclusive control.
> >
> >     >      E. ".pci_caps" -> Inmate takes control?
> >
> >     Exclusive control.
> >
> >     >
> >     > 2. Along the same lines, going back to my ttyS0 issue mentioned
> above
> >     > while trying to share it:
> >     >
> >     >        If I allocate the following to the linux non root cell (an=
d
> set
> >     > to -1 in the root)
> >
> >     BTW, there's generally no need to set -1 in the root cell -- it wil=
l
> be
> >     taken away when the non-root cell is created.
> >
> >     >      .pio_bitmap =3D {
> >     >           [0x3f8/8 ... 0x3ff/8] =3D 0x00   /* serial 2*/
> >     >        }
> >     >
> >     >        Then on the root cell I randomly get a PIO read fault on
> >     "0x3FE"
> >     > when the non-root is booting, i'm not sure what process is causin=
g
> >     this.
> >
> >     - Are you sure you remove the device from the kernel cmdline?
> >     - Are you sure that there doesn't spawn a tty? Check with systemctl=
.
> >     - lsof | grep ttyS
> >     - The root-cell might receive the serial device's interrupt, while
> its
> >       ports are assigned to the non-root cell. Does the crash happen wh=
en
> >       you type in a character to the serial line?
> >
> >       In this case, assign the interrupt to the non-root cell. You will
> need
> >       it in any case there once you have a initrd and want to type in
> stuff.
> >
> >     So there must be some reason why the crash happens. The hard way is
> to
> >     add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell.
> >
> >     >
> >     >        if I leave out the pio mapping in the non-root linux, and
> >     > alolothat block in the root cell instead then the non-root linux
> >     gets a
> >     > PIO read fault on "0x3F9" while booting.
> >     >        Ralf mentioned that Linux would not try enumerate the
> device if
> >     > its set to -1 ( [0x3f8/8 ... 0x3ff/8] =3D -1)  , but the non-root
> >     seems to
> >     > attempt to do something with it anyway:
> >     >
> >     > "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing
> >     enabled"
> >     > "FATAL: Invalid PIO read, port: 3f9: size 1"
> >
> >     Hmm. At least that's what I thought. I don't know how enumeration o=
f
> >     platform devices works exactly, but reconsidering this, the behavio=
ur
> >     above makes sense: How would it know that a platform device is not
> >     present, depending of the configuration of the pio_bitmap.
> >
> >     Anyway, 8250 drivers have some cmdline parameters that can be used =
to
> >     control initialisation (e.g., see the nr_uarts parameters above).
> >
> >     >
> >     >        Is it possible to map the same pio block in both the root
> and
> >     > non-root with a different mask?  Or does the non-root just
> >     override it?
> >     > It seems like the latter is true.
> >
> >     Exactly. That's not a) possible, and b) does not really make sense.
> >
> >       Ralf
> >
> >     >
> >     > Thanks again Jan and Ralf for your help getting to this point.
> >     >
> >     >
> >     > On Tue, Jun 11, 2019 at 2:13 PM Wayne <racedrive1503@gmail.com
> >     <mailto:racedrive1503@gmail.com>
> >     > <mailto:racedrive1503@gmail.com <mailto:racedrive1503@gmail.com>>=
>
> >     wrote:
> >     >
> >     >     Jan & Ralf:
> >     >
> >     >     I have a little good news, I have successfully gotten the
> non-root
> >     >     linux to display some startup output based on your
> suggestions.
> >     >     Also, there must have been some small difference between the
> stock
> >     >     linux-x86-demo cell config and the one I tweaked.  I went bac=
k
> to
> >     >     the original and made some minor changes and it started
> displaying
> >     >     the serial output now for the non-root node.
> >     >
> >     >     I ended up making the root cell the primary user of the ttyS0
> >     >     device, and just having the non-root linux output to the
> >     hypervisor
> >     >     virtual console (console=3Djailhouse).  In my setup, there
> >     appears to
> >     >     be some process still attempting to use the ttyS0 randomly on
> the
> >     >     root linux, and that causes the hypervisor to halt it if I
> don't
> >     >     leave it in the PIO array.  Not sure who is doing it.
> >     >
> >     >
> >     >     This is where i'm at now.  The non-root linux keeps running
> into
> >     >     points where it tries to access PIO and gets parked:
> >     >
> >     >     1. First crash:
> >     >
> >     >     [    0.424925]kworker/u6:0 (27) used greated stack depth: 146=
56
> >     >     bytes left
> >     >     [    0.425807]futex has table entries: 1024 (order: 4, 65536
> >     bytes)
> >     >     "FATAL: Invalid PIO write, port: 70: size 1"
> >     >     ...
> >     >     Parking CPU 3 (Cell: "linux-x86-demo")
> >     >
> >     >     According to /proc/ioports, 70 has to do with the Realtime
> clock
> >     >     (rtc0).  I was able to temporarily add the 70 mapping to the
> >     >     non-root linux, but should it be there at all?  I tried to
> disable
> >     >     RTC support in the guest kernel config.
> >     >
> >     >
> >     >     2. On the next attempt, I then got further with a crash tryin=
g
> to
> >     >     initialize Ser device ttyS0:
> >     >
> >     >     "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharin=
g
> >     enabled"
> >     >     "FATAL: Invalid PIO read, port: 3f9: size 1"
> >     >     ...
> >     >     Parking CPU 3 (Cell: "linux-x86-demo")
> >     >
> >     >     I can get around that if I allow the non-root access in its p=
io
> >     >     table, but then I have a problem above with the root linux
> >     randomly
> >     >     trying to use it.
> >     >
> >     >
> >     >     3. Now with the temporary adjustments to the non-root pio tab=
le
> >     >     above I get here:
> >     >
> >     >     "[    0.972399]clocksource:Switched to clocksource tsc"
> >     >     "FATAL: Invalid PIO read, port: 87: size 1"
> >     >     ...
> >     >     Parking CPU 3 (Cell: "linux-x86-demo")
> >     >
> >     >     According to proc/ioports this one has to do with "dma page
> >     >     request". It isn't mapped in my root linux PIO or non-root
> >     linux array.
> >     >
> >     >
> >     >     Aside from the serial conflict, it seems like these should
> remain
> >     >     controlled by the root linux or hypervisor.   Do you use a
> >     >     particular bare minimum x86 kernel config on your machine for
> the
> >     >     guest to get around these?  I know Jan mentioned the
> >     >     jailhouse-images project might have something, but I couldn't
> find
> >     >     it digging around quick.
> >     >
> >     >     Thanks to you both for your responses and patience.  I got th=
e
> >     root
> >     >     linux up and going on my own, but the non-root guest is
> proving to
> >     >     be more difficult.
> >     >
> >     >     Wayne
> >     >
> >     >
> >     >
> >     >     On Tue, Jun 11, 2019 at 11:31 AM Ralf Ramsauer
> >     >     <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>> wrote:
> >     >
> >     >         Hi,
> >     >
> >     >         On 6/10/19 7:45 PM, Wayne wrote:
> >     >         > Thank you for your responses Ralf and Jan.
> >     >         >
> >     >         > Yes, I have successfully gotten both the apic-demo and
> >     >         tiny-demo cells
> >     >         > to work on my system before attempting to load the
> non-root
> >     >         linux.  I
> >     >         > can see serial output from them.
> >     >         >
> >     >         > However, if I try to share the UART between root and
> inmate
> >     >         for them I
> >     >         > run into a crash on the hypervisor if the root linux
> >     attempts
> >     >         to write
> >     >         > to the UART (after creating/starting a demo).  Does the
> root
> >     >         linux lose
> >     >         > access once an inmate is created/started?  Or am I
> missing
> >     >         something
> >     >         > from my System config or tiny-demo config that allows
> >     them to
> >     >         share?  I
> >     >         > attached the crash in hypervisor_output.txt.
> >     >         >
> >     >         > Also, I noticed the tiny-demo output on the UART gets
> >     mirrored
> >     >         on the
> >     >
> >     >         Yes, according to your config,
> >     >         JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is
> >     >         set. This means that the guest will use the virtual
> >     console. The
> >     >         virtual
> >     >         console uses the hypervisor output which depends whatever
> >     is set
> >     >         in your
> >     >         system configuration. In your case the hypervisor uses 3f=
8.
> >     >
> >     >         And additionally, the inmate also a valid .console set.
> Again,
> >     >         3f8. This
> >     >         means, it will use the console *and* the hypervisor debug
> >     >         hypercall. In
> >     >         your case, both outputs are routed to the same device whi=
ch
> >     >         explains the
> >     >         mirroring.
> >     >
> >     >         > Jailhouse virtual console.  Does that mean that its
> >     writing to the
> >     >         > serial through the hypervisor and not directly accessin=
g
> >     ttyS0
> >     >         itself?
> >     >
> >     >         Exactly.
> >     >
> >     >         > If so, is there a way to create the cell to write ttyS0
> >     >         directly as a
> >     >         > test?  To see if it exhibits same behavior as the
> >     non-root linux.
> >     >
> >     >         Sure, simply align the .address field of .console, and
> allow
> >     >         access to
> >     >         that port via .pio_bitmap.
> >     >
> >     >         >
> >     >         > FYI, I create the tiny-demo like this:
> >     >         >
> >     >         > jailhouse cell create configs/x86/tiny-demo.cell
> >     >         > jailhouse cell load tiny-demo
> >     inmates/demos/x86/tiny-demo.cell
> >     >         > jailhouse cell start tiny-demo
> >     >         >
> >     >         > Going back to my original non-root linux question, I
> >     don't see any
> >     >         > output when connected over ttyS0.  Its address is 0x3f8
> >     >         ("serial 1") in
> >     >         > the PIO, and that seems to work fine for the other simp=
le
> >     >         demos, minus
> >     >         > the hypervisor crash issue above when sharing.  I know
> there
> >     >         is the
> >     >         > other "serial 2" port but I haven't tried to use that
> one.
> >     >
> >     >         I see that port on our Dell server as well. It's present,
> >     but I
> >     >         don't
> >     >         know where it's connected to.
> >     >
> >     >         Let me just summarise your issue:
> >     >
> >     >         You only have one serial line available, right? From the
> >     root-cell's
> >     >         POV, it's ttyS0 on 3f8.
> >     >
> >     >         I would propose to share ttyS0 between the hypervisor and
> >     non-root
> >     >         Linux. This means:
> >     >
> >     >           - Don't let the root-cell use ttyS0. Remove any
> >     console=3DttyS0
> >     >             parameters from you commandline. Ensure that noone
> >     else accesses
> >     >             ttyS0 (e.g., getty@ttyS0 or other friends)
> >     >
> >     >           - Set 3f8 as debug_console in your master.c (seems you
> >     already
> >     >         have)
> >     >
> >     >           - Allow 3f8 access in the linux-demo.c (already set in
> >     the default
> >     >             linux-demo
> >     >
> >     >           - Disallow 2f8 access in linux-demo.c:
> >     >         -               [ 0x2f8/8 ...  0x2ff/8] =3D 0, /* serial2=
 */
> >     >         +               [ 0x2f8/8 ...  0x2ff/8] =3D -1, /* serial=
2 */
> >     >
> >     >             I don't know how Linux enumerates serial devices, but
> this
> >     >         ensures
> >     >             that Linux won't see the unconnected serial line and
> map
> >     >         ttyS0 to
> >     >             3f8
> >     >
> >     >         >
> >     >         > non root linux launched with:
> >     >         > /tools/jailhouse cell linux configs/x86/linux-x86.cell
> >     >         > /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
> >     >
> >     >         Then, this should actually work...
> >     >
> >     >         And if not, then console=3Djailhouse0 should work.
> >     >
> >     >         >
> >     >         > I can try the 4.19 siemens kernel and "next" branch for
> >     >         jailhouse you
> >     >         > suggested.  Do you think that combination will resolve
> >     the missing
> >     >         > serial for the non-root linux?  Otherwise, did my kerne=
l
> >     >         config, system
> >     >         > config, and non-root linux cell configs look OK?
> >     >
> >     >         I didn't look at it, but we should at least - even if som=
e
> >     flags are
> >     >         still incorrect - see the "Uncompressing kernel..." thing=
.
> >     >
> >     >         Wait -- one thing you could try: Deactivate CONFIG_EFI an=
d
> >     >         especially
> >     >         CONFIG_EFI_STUBS. I'm not sure, but it could be that
> EFI_STUBS
> >     >         change
> >     >         the header format that our bootloader patches.
> >     >
> >     >         >
> >     >         > Thanks again for your help.
> >     >
> >     >         No problem. But it's not yet working. ;-)
> >     >
> >     >           Ralf
> >     >
> >     >         >
> >     >         >
> >     >         > On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsauer
> >     >         > <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >         > <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>> wrote:
> >     >         >
> >     >         >     Hi Wayne,
> >     >         >
> >     >         >     On 6/7/19 10:04 PM, Wayne wrote:
> >     >         >     > Hi Ralf,
> >     >         >     >
> >     >         >     > Thank you for your responses.  I have attached th=
e
> >     >         requested config
> >     >         >     > files.  I am now just trying to use the same
> >     bzImage for
> >     >         the root and
> >     >         >     > the non-root linux node.
> >     >         >
> >     >         >     One question that you didn't answer: do apic-demo o=
r
> >     >         tiny-demo work?
> >     >         >     They need to to have correct .console parameter set=
,
> so
> >     >         ensure that
> >     >         >     parameters are set if you run those demos in your
> >     >         linux-demo cell. Just
> >     >         >     compare it to tiny-demo.c or apic-demo.c
> >     >         >
> >     >         >     >
> >     >         >     > Yes, I am using vanilla 4.16 because the
> documentation
> >     >         indicated
> >     >         >     that it
> >     >         >     > is the first mainline release to officially suppo=
rt
> >     >         Jailhouse Guest
> >     >         >     > images.  Do you suggest that I use something else=
?
> >     >         >
> >     >         >     As Jan already wrote: Try to use Siemens' 4.19
> branch.
> >     >         >
> >     >         >     >
> >     >         >     > Right now i'm just trying to get some serial
> >     output from
> >     >         the non-root
> >     >         >     > Linux.  Hopefully, I have that configured
> correctly.
> >     >         Ideally, I would
> >     >         >     > like to share the same serial console for the Roo=
t
> >     node
> >     >         and non-root
> >     >         >     > node eventually if possible.  I have been OK with
> >     using
> >     >         the virtual
> >     >         >     > console (jailhouse console -f) for the Hypervisor
> >     output.
> >     >         >
> >     >         >     In addition to Jan's comment:
> >     >         >
> >     >         >     Currently you only have access to the jailhouse
> console
> >     >         via 'jailhouse
> >     >         >     console' from your root cell. Imagine your root cel=
l
> >     >         crashes for some
> >     >         >     reason. You will never see the fault reason, which
> makes
> >     >         things hard to
> >     >         >     debug.
> >     >         >
> >     >         >     I would suggest to configure the hypervisor to use
> the
> >     >         serial console.
> >     >         >     You can share the device with the non-root Linux,
> that's
> >     >         no problem.
> >     >         >
> >     >         >     In this case, the non-root kernel's output will
> >     always be
> >     >         printed to the
> >     >         >     serial console. Directly, if you choose
> >     console=3DttySx, and
> >     >         indirectly
> >     >         >     via the hypervisor if you choose console=3Djailhous=
e.
> >     >         >
> >     >         >     BTW: According to your config, your system is a
> >     PowerEdge,
> >     >         and the
> >     >         >     non-root cell gets both, 0x2f8 and 0x3f8. Are you
> sure
> >     >         that ttyS1 is the
> >     >         >     correct console that you are connected to?
> >     >         >
> >     >         >     Just mentioning this as we have a similar machine
> here,
> >     >         and, afair, both
> >     >         >     platform serial device are 'usable', but one ends i=
n
> the
> >     >         nirvana while
> >     >         >     it is accessible.
> >     >         >
> >     >         >     Ah, and one last thing: try to switch to the curren=
t
> >     next
> >     >         branch for
> >     >         >     jailhouse. Jan just integrated a few patches from m=
e
> >     that
> >     >         might also be
> >     >         >     relevant for your machine.
> >     >         >
> >     >         >     HTH
> >     >         >       Ralf
> >     >         >
> >     >         >     >
> >     >         >     > Wayne
> >     >         >     >
> >     >         >     > On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsauer
> >     >         >     > <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >         >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >     >         >     > <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >         >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>> wrote:
> >     >         >     >
> >     >         >     >     Hi,
> >     >         >     >
> >     >         >     >     On 6/7/19 2:28 PM, Wayne wrote:
> >     >         >     >     > Hello,
> >     >         >     >     >
> >     >         >     >     > I am new to Linux development and
> >     Jailhouse.  I have
> >     >         >     successfully
> >     >         >     >     booted
> >     >         >     >     > the Jailhouse Hypervisor and root cell on a
> bare
> >     >         metal X86 Linux
> >     >         >     >     system
> >     >         >     >     > (No QEMU).  I am now trying to load a
> non-root
> >     >         Linux cell
> >     >         >     and I have a
> >     >         >     >     > few questions.  Jailhouse accepts and start=
s
> my
> >     >         non-root
> >     >         >     linux cell
> >     >         >     >     > configuration and I see it as "running"
> >     through the
> >     >         >     "jailhouse cell
> >     >         >     >     > list" command.  However, I don't see any
> serial
> >     >         output from the
> >     >         >     >     > "non-root linux" cell booting up.  I=E2=80=
=99m not
> sure
> >     >         what the
> >     >         >     non-root node
> >     >         >     >     > is doing at this point.
> >     >         >     >
> >     >         >     >     Ok, first of all, can you see any output from
> >     >         Jailhouse's demo
> >     >         >     inmates
> >     >         >     >     (e.g., tiny-demo or apic-demo)?
> >     >         >     >
> >     >         >     >     >
> >     >         >     >     >                My root node is a 4.16 kerne=
l
> >     >         configured this
> >     >         >     way:
> >     >         >     >     >                               1.
> >     >         CONFIG_JAILHOUSE_GUEST is
> >     >         >     not set
> >     >         >     >     >                               2.
> CONFIG_SERIO=3Dy
> >     >         >     >     >                               3.
> >     >         >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> >     >         >     >     >
> >     >         >     >     >                My non-root node is a 4.16
> kernel
> >     >         configured
> >     >         >     this way:
> >     >         >     >     >                               1.
> >     >         CONFIG_JAILHOUSE_GUEST=3Dy
> >     >         >     >     >                               2.
> CONFIG_SERIO=3Dm
> >     >         (can't seem
> >     >         >     to disable
> >     >         >     >     > completely in my config for 4.16)
> >     >         >     >     >                               3.
> >     >         >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1
> >     >         >     >
> >     >         >     >     Could you please provide a full .config? What
> >     branch
> >     >         are you
> >     >         >     exactly
> >     >         >     >     using? Vanilla 4.16?
> >     >         >     >
> >     >         >     >     Please attach your system config and your
> >     non-root linux
> >     >         >     config as well.
> >     >         >     >
> >     >         >     >     You may also want to try
> >     >         https://github.com/siemens/linux . See
> >     >         >     >     jailhouse-enabling branches for some releases=
.
> >     >         >     >
> >     >         >     >     >
> >     >         >     >     > In general, do the kernel config settings
> >     have to
> >     >         match between
> >     >         >     >     the root
> >     >         >     >     > node and non-linux or is the above fine?
> >     >         >     >
> >     >         >     >     No, they do not have to be the same, but they
> can.
> >     >         Still, an
> >     >         >     analysis
> >     >         >     >     requires your .config.
> >     >         >     >
> >     >         >     >     >
> >     >         >     >     > The vmlinux-4.1.16-Guest bzImage is approx
> 7MB,
> >     >         and the
> >     >         >     inmate node is
> >     >         >     >     > allocated ~75MB of RAM.
> >     >         >     >     >
> >     >         >     >     > I have a single UART, so I have configured
> the
> >     >         root cell
> >     >         >     system config
> >     >         >     >     > to output to the virtual hypervisor console=
:
> >     >         >     >
> >     >         >     >     Wait... You configured your root-cell to use
> the
> >     >         hypervisor debug
> >     >         >     >     console? How? It's only available once the
> >     hypervisor is
> >     >         >     enabled. How
> >     >         >     >     should this work?
> >     >         >     >
> >     >         >     >     But let's have a look at your configuration
> first.
> >     >         >     >
> >     >         >     >     So you want to:
> >     >         >     >       - Have the UART (0x3f8) available in the
> >     non-root cell
> >     >=EF=BF=BD=EF=BF=BD        >     >       - Use 0x3f8 as hypervisor =
debug console as
> well
> >     >         >     >       - No console for root-cell
> >     >         >     >
> >     >         >     >     Did I get this right?
> >     >         >     >
> >     >         >     >       Ralf
> >     >         >     >
> >     >         >     >     >
> >     >         >     >     > .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONS=
OLE,
> >     >         >     >     >
> >     >         >     >     > .debug_console =3D {
> >     >         >     >     > .type =3D JAILHOUSE_CON_TYPE_NONE,
> >     >         >     >     > },
> >     >         >     >     >
> >     >         >     >     > and I have configured the non-root linux
> cell to
> >     >         output to
> >     >         >     the UART:
> >     >         >     >     >
> >     >         >     >     > (Added serial 0x3f8 to pio bitmap for
> non-root
> >     >         linux) and
> >     >         >     started the
> >     >         >     >     > node with this:
> >     >         >     >     >
> >     >         >     >     > ./tools/jailhouse cell linux
> >     >         configs/x86/linux-x86.cell
> >     >         >     >     > /boot/vmlinux-4.1.16-Guest -c
> >     "console=3DttyS0,115200"
> >     >         >     >     > (Note I also tried "console=3Djailhouse" in=
 the
> >     >         command above,
> >     >         >     and that
> >     >         >     >     > produces the same result)
> >     >         >     >     >
> >     >         >     >     > I then see the following on my hypervisor
> >     console
> >     >         >     (./tools/jailhouse
> >     >         >     >     > console -f):
> >     >         >     >     >
> >     >         >     >     > Created cell "linux-x86-demo"
> >     >         >     >     > ...
> >     >         >     >     > Cell "linux-x86-demo" can be loaded
> >     >         >     >     > Started cell "linux-x86-demo"
> >     >         >     >     >
> >     >         >     >     > After a little while I do get a parked CPU
> error
> >     >         on the root
> >     >         >     node,
> >     >         >     >     looks
> >     >         >     >     > like its trying to do something with the
> >     UART as well:
> >     >         >     >     > FATAL: Invalid PIO read, port: 3fe size: 1
> >     >         >     >     >
> >     >         >     >     > I would expect something to pop out on the
> UART
> >     >         from the
> >     >         >     non-root
> >     >         >     >     linux
> >     >         >     >     > node first.  Note that root node has serial
> >     0x3f8
> >     >         disabled
> >     >         >     in its pio
> >     >         >     >     > bitmap.
> >     >         >     >     >
> >     >         >     >     > I verifed that the UART is functioning by
> >     allowing the
> >     >         >     hypervisor to
> >     >         >     >     > print to it and also performed an echo test
> over
> >     >         ttyS0.
> >     >         >     >     >
> >     >         >     >     > I have tried several configurations of
> >     >         kernel.....including your
> >     >         >     >     current
> >     >         >     >     > "queues/jailhouse" branch head kernel for t=
he
> >     >         non-root node,
> >     >         >     along
> >     >         >     >     with
> >     >         >     >     > the kernel config for 4.7 posted in this
> thread
> >     >         below (but I
> >     >         >     get same
> >     >         >     >     > result as above when I start it, no kernel
> >     output):
> >     >         >     >     >
> >     >         >     >     >
> >     >         >     >
> >     >         >
> >     >
> >         "
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >     >         >     >     >
> >     >         >     >     > Any information you can provide to me will =
be
> >     >         helpful.  I'm
> >     >         >     not sure
> >     >         >     >     > what might be going wrong here.
> >     >         >     >     >
> >     >         >     >     > Thanks,
> >     >         >     >     > Wayne
> >     >         >     >     >
> >     >         >     >     > --
> >     >         >     >     > You received this message because you are
> >     >         subscribed to the
> >     >         >     Google
> >     >         >     >     > Groups "Jailhouse" group.
> >     >         >     >     > To unsubscribe from this group and stop
> >     receiving
> >     >         emails
> >     >         >     from it, send
> >     >         >     >     > an email to
> >     >         jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >     >         <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >     >         >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.co=
m
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
> >     >         >     >
> >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >     >         >
> >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >     >         <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>>
> >     >         >     >     >
> >     <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >     >         <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >     >         >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.co=
m
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
> >     >         >     >
> >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >     >         >
> >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >     >         <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>>>.
> >     >         >     >     > To view this discussion on the web visit
> >     >         >     >     >
> >     >         >     >
> >     >         >
> >     >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
> >     >         >     >     >
> >     >         >     >
> >     >         >
> >     >
> >        <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> >     >         >     >     > For more options, visit
> >     >         https://groups.google.com/d/optout.
> >     >         >     >
> >     >         >
> >     >
> >     > --
> >     > You received this message because you are subscribed to the Googl=
e
> >     > Groups "Jailhouse" group.
> >     > To unsubscribe from this group and stop receiving emails from it,
> send
> >     > an email to jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>>.
> >     > To view this discussion on the web visit
> >     >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Mae=
RW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com
> >     >
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Mae=
RW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> >     > For more options, visit https://groups.google.com/d/optout.
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%=
2Bgpts0DUBENqV6eFDPazfs5kR_QRGaw%40mail.gmail.com
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%=
2Bgpts0DUBENqV6eFDPazfs5kR_QRGaw%40mail.gmail.com?utm_medium=3Demail&utm_so=
urce=3Dfooter
> >.
> > For more options, visit https://groups.google.com/d/optout.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%2BKhc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA%40mai=
l.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--000000000000cb63c8058b257a6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SSYjMzk7bSBzb3JyeSBhYm91dCB0aGUgZm9ybWF0dGluZy7CoCBJdCBk
aWRuJiMzOTt0IGxvb2sgbGlrZSB0aGF0IGJlZm9yZSBJIHNlbnQgaXQuPGRpdj48YnI+PC9kaXY+
PGRpdj5JIHdpbGwgZG91YmxlIGNoZWNrIG15IGxpbnV4LXg4Ni1kZW1vIGNlbGwgY29uZmlnIGFn
YWluIGZvciB0aGUgc2VyaWFsIElSUSBtYXBwaW5nLiBBbHNvIEkgd2lsbCBidWlsZCBpbiB0aGUg
Q09ORklHX0NSQVNIX0NFTExfT05fUEFOSUMgZGVmaW5lIGZvciBoZWxwIGdvaW5nIGZvcndhcmQu
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DYW4gdGhlICZxdW90O2phaWxob3VzZSBjZWxsIGxp
bnV4JnF1b3Q7IGNvbW1hbmQgdGFrZSBhbiBpbml0cmFtZnMgaW1hZ2UgKC5pbWcpIHRocm91Z2gg
dGhlICZxdW90Oy1pIG9wdGlvbiZxdW90OyBvciBkb2VzIGl0IG5lZWQgdG8gYmUgYW4gaW5pdHJk
P8KgIElmIGluaXRyZCBvbmx5LCBjYW4geW91IHBvaW50IG1lIHRvIGFuIGV4YW1wbGUgeDg2IHJv
b3Rmcy5jcGlvIGltYWdlP8KgIEkmIzM5O20gaGF2aW5nIHRyb3VibGUgaW5zdGFsbGluZyBCdWls
ZHJvb3Qgb24gbXkgbWFjaGluZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyBhZ2Fp
biw8L2Rpdj48ZGl2PldheW5lPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCBKdW4gMTIsIDIwMTkg
YXQgMToxNyBQTSBSYWxmIFJhbXNhdWVyICZsdDs8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVl
ckBvdGgtcmVnZW5zYnVyZy5kZSI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4m
Z3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+SGkgV2F5bmUsPGJyPg0KPGJyPg0KT24gNi8xMi8x
OSAzOjU1IFBNLCBXYXluZSB3cm90ZTo8YnI+DQomZ3Q7IFJhbGYvSmFuLDxicj4NCiZndDsgPGJy
Pg0KJmd0OyDCoEFyZSB5b3Ugc3VyZSB5b3UgcmVtb3ZlIHRoZSBkZXZpY2UgZnJvbSB0aGUga2Vy
bmVsIGNtZGxpbmU/ICpZZXMsIHRoZXJlPGJyPg0KJmd0OyBpcyBubyB0dHlTKiBkZXZpY2UgaW4g
bXkgcm9vdCBsaW51eCBjbWRsaW5lKjxicj4NCiZndDsgLSBBcmUgeW91IHN1cmUgdGhhdCB0aGVy
ZSBkb2VzbiYjMzk7dCBzcGF3biBhIHR0eT8gQ2hlY2sgd2l0aCBzeXN0ZW1jdGwuICpObzxicj4N
CiZndDsgdHR5IGFzIGZhciBhcyBJIGNhbiB0ZWxsLCB2ZXJpZmllZCB3aXRoICZxdW90O2xzb2Yg
fCBncmVwIHR0eVMmcXVvdDsuwqAgVGhlIGxzb2Y8YnI+DQomZ3Q7IGNvbW1hbmQgc3RvcHMgd29y
a2luZyBhZnRlciB0aGUgY3Jhc2ggdGhvdWdoKjxicj4NCjxicj4NCnBsZWFzZSB1c2UgcGxhaW4g
dGV4dCBtYWlscy4gSXQmIzM5O3MgZ2V0dGluZyBoYXJkIHRvIHJlYWQgOi0pPGJyPg0KPGJyPg0K
Jmd0OyAtIGxzb2YgfCBncmVwIHR0eVM8YnI+DQomZ3Q7IC0gVGhlIHJvb3QtY2VsbCBtaWdodCBy
ZWNlaXZlIHRoZSBzZXJpYWwgZGV2aWNlJiMzOTtzIGludGVycnVwdCwgd2hpbGUgaXRzPGJyPg0K
Jmd0OyDCoCBwb3J0cyBhcmUgYXNzaWduZWQgdG8gdGhlIG5vbi1yb290IGNlbGwuIERvZXMgdGhl
IGNyYXNoIGhhcHBlbiB3aGVuPGJyPg0KJmd0OyDCoCB5b3UgdHlwZSBpbiBhIGNoYXJhY3RlciB0
byB0aGUgc2VyaWFsIGxpbmU/ICpUaGlzIGlzIHBvc3NpYmxlLCBkbyB5b3U8YnI+DQomZ3Q7IGhh
dmUgYW4gZXhhbXBsZSBvZiBob3cgSSB3b3VsZCBhY2NvbXBsaXNoIGFzc2lnbmluZyB0aGUgaW50
ZXJydXB0IChJUlEgNDxicj4NCiZndDsgZm9yIHR0eVMwKSB0byB0aGUgbm9uLXJvb3Q/wqAgVG8g
cnVsZSBvdXQgdGhlIGludGVycnVwdCBjb25jZXJuLio8YnI+DQo8YnI+DQpDb21wYXJlIGxpbnV4
LXg4Ni1kZW1vLmMuIFRoZSAucGluX2JpdG1hcCBmaWVsZCBkZW5vdGVzIHRoZSBpbnRlcnJ1cHRz
PGJyPg0KdGhhdCBhcmUgcm91dGVkIHRvIHRoZSBjZWxsLiBJZiB5b3UgdXNlIHRoZSBvcmlnaW5h
bCBsaW51eC14ODYtZGVtby5jLDxicj4NCnRoZW4gaW50ZXJydXB0IDQgc2hvdWxkIGFscmVhZHkg
YmUgcm91dGVkIHRvIHRoZSBjZWxsLjxicj4NCjxicj4NCkFGQUlDVCwgaW4gbGludXgteDg2LWRl
bW8uYywgd2UgYXNzaWduIElSUSAzICZhbXA7IDQuIEluIHlvdXIgY2FzZSwgd2UgYWxzbzxicj4N
CnJlbW92ZSB0aGUgb3RoZXIgSVJRIGZyb20gdGhlIHJvb3QgY2VsbCAtIElSUSAzIHNob3VsZCBi
ZSBjb21tZW50ZWQgb3V0Ljxicj4NCjxicj4NCkJUVywgYSBoZWxwZnVsIGRlYnVnZ2luZyBmZWF0
dXJlOjxicj4NCmVjaG8gJnF1b3Q7I2RlZmluZSBDT05GSUdfQ1JBU0hfQ0VMTF9PTl9QQU5JQyAx
JnF1b3Q7ICZndDsmZ3Q7IGluY2x1ZGUvaHlwZXJ2aXNvci9jb25maWcuaDxicj4NCjxicj4NClRo
aXMgd2lsbCBsZXQgdGhlIHJvb3QgY2VsbCBwcmludCBhIHN0YWNrZHVtcCB3aGljaCBnaXZlcyB5
b3UgYSBoaW50PGJyPg0Kd2hhdCBjb2RlcGF0aCBjYXVzZWQgdGhlIGNyYXNoLjxicj4NCjxicj4N
CiZndDsgPGJyPg0KJmd0OyDCoCBJbiB0aGlzIGNhc2UsIGFzc2lnbiB0aGUgaW50ZXJydXB0IHRv
IHRoZSBub24tcm9vdCBjZWxsLiBZb3Ugd2lsbCBuZWVkPGJyPg0KJmd0OyDCoCBpdCBpbiBhbnkg
Y2FzZSB0aGVyZSBvbmNlIHlvdSBoYXZlIGEgaW5pdHJkIGFuZCB3YW50IHRvIHR5cGUgaW4gc3R1
ZmYuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFNvIHRoZXJlIG11c3QgYmUgc29tZSByZWFzb24gd2h5
IHRoZSBjcmFzaCBoYXBwZW5zLiBUaGUgaGFyZCB3YXkgaXMgdG88YnI+DQomZ3Q7IGFkZCA4MjUw
Lm5yX3VhcnRzPTAgaW4geW91ciBrZXJuZWwgY21kbGluZSBvZiB0aGUgcm9vdCBjZWxsLiAqSSBj
YW4gdXNlPGJyPg0KJmd0OyB0aGlzIG1ldGhvZCBmb3Igbm93IHRvIGNvbnRpbnVlIGJvb3Rpbmcg
dGhlIG5vbi1yb290IGxpbnV4Lio8YnI+DQomZ3Q7IDxicj4NCiZndDsmZ3Q7wqA8YnI+DQomZ3Q7
Jmd0OyDCoCDCoCDCoCDCoGlmIEkgbGVhdmUgb3V0IHRoZSBwaW8gbWFwcGluZyBpbiB0aGUgbm9u
LXJvb3QgbGludXgsIGFuZDxicj4NCiZndDsmZ3Q7IGFsb2xvdGhhdCBibG9jayBpbiB0aGUgcm9v
dCBjZWxsIGluc3RlYWQgdGhlbiB0aGUgbm9uLXJvb3QgbGludXggZ2V0cyBhPGJyPg0KJmd0OyZn
dDsgUElPIHJlYWQgZmF1bHQgb24gJnF1b3Q7MHgzRjkmcXVvdDsgd2hpbGUgYm9vdGluZy7CoCDC
oCDCoCDCoDxicj4NCiZndDsmZ3Q7IMKgIMKgIMKgIMKgUmFsZiBtZW50aW9uZWQgdGhhdCBMaW51
eCB3b3VsZCBub3QgdHJ5IGVudW1lcmF0ZSB0aGUgZGV2aWNlIGlmPGJyPg0KJmd0OyZndDsgaXRz
IHNldCB0byAtMSAowqBbMHgzZjgvOCAuLi4gMHgzZmYvOF0gPSAtMSnCoCAsIGJ1dCB0aGUgbm9u
LXJvb3Qgc2VlbXMgdG88YnI+DQomZ3Q7Jmd0OyBhdHRlbXB0IHRvIGRvIHNvbWV0aGluZyB3aXRo
IGl0IGFueXdheTo8YnI+DQomZ3Q7Jmd0O8KgPGJyPg0KJmd0OyZndDsgJnF1b3Q7WyDCoCDCoDAu
OTU2MTQ2XVNlcmlhbDogODI1MC8xNjU1MCBkcml2ZXIsIDEgcG9ydHMsIElSUSBzaGFyaW5nIGVu
YWJsZWQmcXVvdDs8YnI+DQomZ3Q7Jmd0OyAmcXVvdDtGQVRBTDogSW52YWxpZCBQSU8gcmVhZCwg
cG9ydDogM2Y5OiBzaXplIDEmcXVvdDvCoMKgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IEhtbS4gQXQg
bGVhc3QgdGhhdCYjMzk7cyB3aGF0IEkgdGhvdWdodC4gSSBkb24mIzM5O3Qga25vdyBob3cgZW51
bWVyYXRpb24gb2Y8YnI+DQomZ3Q7IHBsYXRmb3JtIGRldmljZXMgd29ya3MgZXhhY3RseSwgYnV0
IHJlY29uc2lkZXJpbmcgdGhpcywgdGhlIGJlaGF2aW91cjxicj4NCiZndDsgYWJvdmUgbWFrZXMg
c2Vuc2U6IEhvdyB3b3VsZCBpdCBrbm93IHRoYXQgYSBwbGF0Zm9ybSBkZXZpY2UgaXMgbm90PGJy
Pg0KJmd0OyBwcmVzZW50LCBkZXBlbmRpbmcgb2YgdGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHBp
b19iaXRtYXAuwqAgwqAqU2luY2UgSSBkbzxicj4NCiZndDsgdGVjaG5pY2FsbHkgaGF2ZSB0d28g
c2VyaWFsIHBvcnRzLCBpcyB0aGVyZSBhIHdheSAodmlhIGNvbW1hbmQgbGluZSBvcjxicj4NCiZn
dDsga2VybmVsIGNvbmZpZyBmb3IgZXgpIHRvIGhhcmRjb2RlIHdoYXQgdGhlIG5vbi1yb290IHdv
dWxkIGVudW1lcmF0ZSBmb3I8YnI+DQomZ3Q7IHRoZSBVQVJUIHdoZW4gaXRzIGJvb3RpbmcgdXA/
wqAgTWVhbmluZywgZm9yY2UgaXQgdG8gJnF1b3Q7c2VlJnF1b3Q7IHRoZSAweDJmODxicj4NCiZn
dDsgc2VyaWFsIHBvcnQgYXMgdHR5UzAgaW5zdGVhZCBvZiAweDNmOCB3aGVuIGJvb3RpbmcgdXDC
oDxicj4NCiZndDsgYW5kKirCoENPTkZJR19TRVJJQUxfODI1MF9SVU5USU1FX1VBUlRTID0gMSoq
LsKgIFRoYXQgd2F5IGlmIHlvdSBoYWQgc2F5PGJyPg0KJmd0OyB0aHJlZSBzZXJpYWwgcG9ydHMg
YW5kIHRocmVlIGNlbGxzICgxIHJvb3QsIDIgbm9uLXJvb3QgbGludXgpIHRoZW4gZWFjaDxicj4N
CiZndDsgY291bGQgaGF2ZSB0aGVpciBvd24gc2VwYXJhdGUgZGVkaWNhdGVkIHR0eVMwLio8YnI+
DQo8YnI+DQpIYXZlIGEgbG9vayBhdCB0aGUgZG9jdW1lbnRhdGlvbiBvZiB0aGUgODI1MCBkcml2
ZXIsIGRvbiYjMzk7dCBrbm93IGJ5IGhlYXJ0Ljxicj4NCjxicj4NCkhUSCw8YnI+DQrCoCBSYWxm
PGJyPg0KPGJyPg0KJmd0OyAqPGJyPg0KJmd0OyAqPGJyPg0KJmd0OyBBcyBmYXIgYXMganVzdCBi
b290aW5nIHRoZSBub24tcm9vdCBiZXNpZGVzIHRoZSBzZXJpYWwgY29uY2VybiwgSTxicj4NCiZn
dDsgaGF2ZW4mIzM5O3QgcHJvdmlkZWQgYW4gaW5pdHJhbWZzIHRvIG15IG5vbi1yb290IGxpbnV4
IHlldC7CoCBJIHdvdWxkIGxpa2UgdG88YnI+DQomZ3Q7IHByb2JhYmx5IGJvb3QgaXQgd2l0aCBh
IHNpbXBsZSByYW1kaXNrIGlmIHBvc3NpYmxlIHRvIGdldCBhIHBvaW50IHdoZXJlPGJyPg0KJmd0
OyBJIGNhbiBsb2cgaW4uwqA8YnI+DQomZ3Q7ICo8YnI+DQomZ3Q7ICo8YnI+DQomZ3Q7IFRoYW5r
cyw8YnI+DQomZ3Q7IFdheW5lPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IE9uIFdlZCwgSnVuIDEyLCAy
MDE5IGF0IDY6NDMgQU0gUmFsZiBSYW1zYXVlcjxicj4NCiZndDsgJmx0OzxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5r
Ij5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4N
CiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgSGksPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBP
biA2LzExLzE5IDExOjA1IFBNLCBXYXluZSB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEph
bi9SYWxmLDxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEkgd2Fz
IGFibGUgdG8gZ2V0IHBhc3QgaXNzdWVzIDEgYW5kIDMgYWJvdmUgYnkgdXNpbmcgSmFuJiMzOTtz
IGtlcm5lbDxicj4NCiZndDvCoCDCoCDCoGNvbmZpZzxicj4NCiZndDvCoCDCoCDCoCZndDsgZnJv
bSB0aGlzIHRocmVhZDo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZm9y
dW0vIyFzZWFyY2hpbi9qYWlsaG91c2UtZGV2L1JlJDNBJDIwRmFpbGVkJDIwdG8kMjBib290JDIw
amFpbGhvdXNlJTdDc29ydDpyZWxldmFuY2UvamFpbGhvdXNlLWRldi9NN1VPODlYRklrMC9RaTQw
RER1TUJBQUoiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBz
Lmdvb2dsZS5jb20vZm9ydW0vIyFzZWFyY2hpbi9qYWlsaG91c2UtZGV2L1JlJDNBJDIwRmFpbGVk
JDIwdG8kMjBib290JDIwamFpbGhvdXNlJTdDc29ydDpyZWxldmFuY2UvamFpbGhvdXNlLWRldi9N
N1VPODlYRklrMC9RaTQwRER1TUJBQUo8L2E+JnF1b3Q7LsKgPGJyPg0KJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgVGhlIERNQSBpc3N1ZSB3YXMgcmVzb2x2ZWQgYnkgZGlz
YWJsaW5nIGtlcm5lbDxicj4NCiZndDvCoCDCoCDCoG9wdGlvbsKgQ09ORklHX0lTQV9ETUFfQVBJ
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBhcyBzdGF0ZWQgaW4gYW5vdGhlciB0aHJlYWQsIGFuZCBy
ZWZsZWN0ZWQgaW4gdGhlIGNvbmZpZyBmaWxlIGFib3ZlLjxicj4NCiZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFNvIG5vdyBJIHRoaW5rIGkmIzM5O3ZlIGFsbW9zdCBnb3Qg
dGhlIG5vbi1yb290IGxpbnV4IGJvb3RpbmcuwqAgSSYjMzk7bTxicj4NCiZndDvCoCDCoCDCoHN0
dWNrIGF0PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyB0aGUgcG9pbnQgd2hlcmUgaXRzIHRyeWluZyB0
byBtb3VudCBhIGZpbGVzeXN0ZW0gYW5kIHNpbmNlIGkmIzM5O20gbm90PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyBwcm92aWRpbmcgYW4gaW5pdHJhbWZzIGl0IHBhbmljcy48YnI+DQomZ3Q7IDxicj4N
CiZndDvCoCDCoCDCoFBlcmZlY3QhPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyBTaW1pbGFyIHRvIHRoZSBvdXRwdXQgYmVsb3c6PGJyPg0KJmd0
O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgWyAxLjA4MDE3OF0gVkZTOiBDYW5u
b3Qgb3BlbiByb290IGRldmljZSAmcXVvdDsobnVsbCkmcXVvdDsgb3I8YnI+DQomZ3Q7wqAgwqAg
wqB1bmtub3duLWJsb2NrKDAsMCk6PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBlcnJvciAtNjxicj4N
CiZndDvCoCDCoCDCoCZndDsgWyAxLjA4NzY2Ml0gUGxlYXNlIGFwcGVuZCBhIGNvcnJlY3QgJnF1
b3Q7cm9vdD0mcXVvdDsgYm9vdCBvcHRpb247IGhlcmUgYXJlIHRoZTxicj4NCiZndDvCoCDCoCDC
oCZndDsgYXZhaWxhYmxlIHBhcnRpdGlvbnM6PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBbIDEuMDk2
MDEzXSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogVkZTOiBVbmFibGUgdG8gbW91bnQgcm9v
dDxicj4NCiZndDvCoCDCoCDCoGZzIG9uPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyB1bmtub3duLWJs
b2NrKDAsMCk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBJIGhh
dmUganVzdCBhIGNvdXBsZSBtb3JlIHF1ZXN0aW9uczo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IDEu
IEluIGdlbmVyYWwsIGlzIGl0IHRydWUgdGhhdCBhbiBpbm1hdGUgd2lsbCB0YWtlb3ZlciBjb250
cm9sPGJyPg0KJmd0O8KgIMKgIMKgZnJvbSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IHJvb3Qg
b2YgYW55IHJlc291cmNlIGluIHRoZSBmb2xsb3dpbmcgYXJyYXlzLCBvciBhcmUgdGhlcmUgc29t
ZSBjYXNlczxicj4NCiZndDvCoCDCoCDCoCZndDsgd2hlcmUgdGhleSBnZXQgJnF1b3Q7c2hhcmVk
JnF1b3Q7IGJldHdlZW4gdGhlIHJvb3QgYW5kIGlubWF0ZT88YnI+DQomZ3Q7IDxicj4NCiZndDvC
oCDCoCDCoERlcGVuZHMuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
QS4gJnF1b3Q7Lm1lbV9yZWdpb25zJnF1b3Q7IC0mZ3Q7IFNoYXJlZD88YnI+DQomZ3Q7IDxicj4N
CiZndDvCoCDCoCDCoE1heSBiZSBzaGFyZWQgd2l0aCB0aGUgcm9vdCBjZWxsIChpLmUuLCBpZiB0
aGUgcmVnaW9uIGhhcyB0aGUgZmxhZzxicj4NCiZndDvCoCDCoCDCoEpBSUxIT1VTRV9NRU1fUk9P
VFNIQVJFRCBzZXQpLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoEIu
ICZxdW90Oy5pcnFjaGlwcyZxdW90OyAtJmd0OyBTaGFyZWQ/PGJyPg0KJmd0OyA8YnI+DQomZ3Q7
wqAgwqAgwqBTaGFyZWQgd2l0aCB3aG9tPyBPbmx5IG9uZSBndWVzdCBydW5zIG9uIGEgQ1BVLiBU
aGlzIGd1ZXN0IHdpbGwgaGF2ZTxicj4NCiZndDvCoCDCoCDCoGZ1bGwgYWNjZXNzIHRvIHRoZSBp
cnFjaGlwLiBTb21lIGFjY2Vzc2VzIG11c3QgYmUgaW50ZXJjZXB0ZWQuPGJyPg0KJmd0OyA8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgQy4gJnF1b3Q7LnBpb19iaXRtYXAmcXVvdDsgLSZn
dDsgSW5tYXRlIHRha2VzIGNvbnRyb2wgb2YgdGhlc2UgaWYgbWF0Y2hpbmc8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7IGJldHdlZW4gaW5tYXRlIGFuZCByb290PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAg
wqAgwqBFeGNsdXNpdmUgY29udHJvbC48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCZndDsg
wqAgwqAgwqBELiAmcXVvdDsucGNpX2RldmljZXMmcXVvdDsgLSZndDsgSW5tYXRlIHRha2VzIGNv
bnRyb2w/PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBFeGNsdXNpdmUgY29udHJvbC48YnI+
DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqBFLiAmcXVvdDsucGNpX2NhcHMm
cXVvdDsgLSZndDsgSW5tYXRlIHRha2VzIGNvbnRyb2w/PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAg
wqAgwqBFeGNsdXNpdmUgY29udHJvbC48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IDIuIEFsb25nIHRoZSBzYW1lIGxpbmVzLCBnb2luZyBiYWNr
IHRvIG15IHR0eVMwIGlzc3VlIG1lbnRpb25lZCBhYm92ZTxicj4NCiZndDvCoCDCoCDCoCZndDsg
d2hpbGUgdHJ5aW5nIHRvIHNoYXJlIGl0Ojxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgSWYgSSBhbGxvY2F0ZSB0aGUgZm9sbG93aW5nIHRvIHRo
ZSBsaW51eCBub24gcm9vdCBjZWxsIChhbmQgc2V0PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyB0byAt
MSBpbiB0aGUgcm9vdCk8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoEJUVywgdGhlcmUmIzM5
O3MgZ2VuZXJhbGx5IG5vIG5lZWQgdG8gc2V0IC0xIGluIHRoZSByb290IGNlbGwgLS0gaXQgd2ls
bCBiZTxicj4NCiZndDvCoCDCoCDCoHRha2VuIGF3YXkgd2hlbiB0aGUgbm9uLXJvb3QgY2VsbCBp
cyBjcmVhdGVkLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoC5waW9f
Yml0bWFwID0gezxicj4NCiZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAgWzB4M2Y4Lzgg
Li4uIDB4M2ZmLzhdID0gMHgwMMKgIMKgLyogc2VyaWFsIDIqLzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqBUaGVuIG9uIHRoZSByb290IGNlbGwgSSByYW5kb21seSBnZXQgYSBQSU8g
cmVhZCBmYXVsdCBvbjxicj4NCiZndDvCoCDCoCDCoCZxdW90OzB4M0ZFJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyB3aGVuIHRoZSBub24tcm9vdCBpcyBib290aW5nLCBpJiMzOTttIG5vdCBz
dXJlIHdoYXQgcHJvY2VzcyBpcyBjYXVzaW5nPGJyPg0KJmd0O8KgIMKgIMKgdGhpcy48YnI+DQom
Z3Q7IDxicj4NCiZndDvCoCDCoCDCoC0gQXJlIHlvdSBzdXJlIHlvdSByZW1vdmUgdGhlIGRldmlj
ZSBmcm9tIHRoZSBrZXJuZWwgY21kbGluZT88YnI+DQomZ3Q7wqAgwqAgwqAtIEFyZSB5b3Ugc3Vy
ZSB0aGF0IHRoZXJlIGRvZXNuJiMzOTt0IHNwYXduIGEgdHR5PyBDaGVjayB3aXRoIHN5c3RlbWN0
bC48YnI+DQomZ3Q7wqAgwqAgwqAtIGxzb2YgfCBncmVwIHR0eVM8YnI+DQomZ3Q7wqAgwqAgwqAt
IFRoZSByb290LWNlbGwgbWlnaHQgcmVjZWl2ZSB0aGUgc2VyaWFsIGRldmljZSYjMzk7cyBpbnRl
cnJ1cHQsIHdoaWxlIGl0czxicj4NCiZndDvCoCDCoCDCoMKgIHBvcnRzIGFyZSBhc3NpZ25lZCB0
byB0aGUgbm9uLXJvb3QgY2VsbC4gRG9lcyB0aGUgY3Jhc2ggaGFwcGVuIHdoZW48YnI+DQomZ3Q7
wqAgwqAgwqDCoCB5b3UgdHlwZSBpbiBhIGNoYXJhY3RlciB0byB0aGUgc2VyaWFsIGxpbmU/PGJy
Pg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqDCoCBJbiB0aGlzIGNhc2UsIGFzc2lnbiB0aGUgaW50
ZXJydXB0IHRvIHRoZSBub24tcm9vdCBjZWxsLiBZb3Ugd2lsbCBuZWVkPGJyPg0KJmd0O8KgIMKg
IMKgwqAgaXQgaW4gYW55IGNhc2UgdGhlcmUgb25jZSB5b3UgaGF2ZSBhIGluaXRyZCBhbmQgd2Fu
dCB0byB0eXBlIGluIHN0dWZmLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgU28gdGhlcmUg
bXVzdCBiZSBzb21lIHJlYXNvbiB3aHkgdGhlIGNyYXNoIGhhcHBlbnMuIFRoZSBoYXJkIHdheSBp
cyB0bzxicj4NCiZndDvCoCDCoCDCoGFkZCA4MjUwLm5yX3VhcnRzPTAgaW4geW91ciBrZXJuZWwg
Y21kbGluZSBvZiB0aGUgcm9vdCBjZWxsLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBpZiBJIGxlYXZlIG91dCB0aGUgcGlv
IG1hcHBpbmcgaW4gdGhlIG5vbi1yb290IGxpbnV4LCBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
IGFsb2xvdGhhdCBibG9jayBpbiB0aGUgcm9vdCBjZWxsIGluc3RlYWQgdGhlbiB0aGUgbm9uLXJv
b3QgbGludXg8YnI+DQomZ3Q7wqAgwqAgwqBnZXRzIGE8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFBJ
TyByZWFkIGZhdWx0IG9uICZxdW90OzB4M0Y5JnF1b3Q7IHdoaWxlIGJvb3RpbmcuwqAgwqAgwqAg
wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgUmFsZiBtZW50aW9uZWQgdGhhdCBM
aW51eCB3b3VsZCBub3QgdHJ5IGVudW1lcmF0ZSB0aGUgZGV2aWNlIGlmPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyBpdHMgc2V0IHRvIC0xICjCoFsweDNmOC84IC4uLiAweDNmZi84XSA9IC0xKcKgICwg
YnV0IHRoZSBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoHNlZW1zIHRvPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyBhdHRlbXB0IHRvIGRvIHNvbWV0aGluZyB3aXRoIGl0IGFueXdheTo8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAmcXVvdDtbIMKgIMKgMC45NTYxNDZd
U2VyaWFsOiA4MjUwLzE2NTUwIGRyaXZlciwgMSBwb3J0cywgSVJRIHNoYXJpbmc8YnI+DQomZ3Q7
wqAgwqAgwqBlbmFibGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAmcXVvdDtGQVRBTDog
SW52YWxpZCBQSU8gcmVhZCwgcG9ydDogM2Y5OiBzaXplIDEmcXVvdDvCoDxicj4NCiZndDsgPGJy
Pg0KJmd0O8KgIMKgIMKgSG1tLiBBdCBsZWFzdCB0aGF0JiMzOTtzIHdoYXQgSSB0aG91Z2h0LiBJ
IGRvbiYjMzk7dCBrbm93IGhvdyBlbnVtZXJhdGlvbiBvZjxicj4NCiZndDvCoCDCoCDCoHBsYXRm
b3JtIGRldmljZXMgd29ya3MgZXhhY3RseSwgYnV0IHJlY29uc2lkZXJpbmcgdGhpcywgdGhlIGJl
aGF2aW91cjxicj4NCiZndDvCoCDCoCDCoGFib3ZlIG1ha2VzIHNlbnNlOiBIb3cgd291bGQgaXQg
a25vdyB0aGF0IGEgcGxhdGZvcm0gZGV2aWNlIGlzIG5vdDxicj4NCiZndDvCoCDCoCDCoHByZXNl
bnQsIGRlcGVuZGluZyBvZiB0aGUgY29uZmlndXJhdGlvbiBvZiB0aGUgcGlvX2JpdG1hcC48YnI+
DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoEFueXdheSwgODI1MCBkcml2ZXJzIGhhdmUgc29tZSBj
bWRsaW5lIHBhcmFtZXRlcnMgdGhhdCBjYW4gYmUgdXNlZCB0bzxicj4NCiZndDvCoCDCoCDCoGNv
bnRyb2wgaW5pdGlhbGlzYXRpb24gKGUuZy4sIHNlZSB0aGUgbnJfdWFydHMgcGFyYW1ldGVycyBh
Ym92ZSkuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyDCoCDCoCDCoCDCoElzIGl0IHBvc3NpYmxlIHRvIG1hcCB0aGUgc2FtZSBwaW8gYmxvY2sg
aW4gYm90aCB0aGUgcm9vdCBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IG5vbi1yb290IHdpdGgg
YSBkaWZmZXJlbnQgbWFzaz/CoCBPciBkb2VzIHRoZSBub24tcm9vdCBqdXN0PGJyPg0KJmd0O8Kg
IMKgIMKgb3ZlcnJpZGUgaXQ/wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEl0IHNlZW1zIGxpa2Ug
dGhlIGxhdHRlciBpcyB0cnVlLsKgwqDCoDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgRXhh
Y3RseS4gVGhhdCYjMzk7cyBub3QgYSkgcG9zc2libGUsIGFuZCBiKSBkb2VzIG5vdCByZWFsbHkg
bWFrZSBzZW5zZS48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoMKgIFJhbGY8YnI+DQomZ3Q7
IDxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFRoYW5rcyBhZ2Fp
biBKYW4gYW5kIFJhbGYgZm9yIHlvdXIgaGVscCBnZXR0aW5nIHRvIHRoaXMgcG9pbnQuPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDI6MTMgUE0gV2F5bmUgJmx0OzxhIGhyZWY9Im1h
aWx0bzpyYWNlZHJpdmUxNTAzQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhY2Vkcml2ZTE1
MDNAZ21haWwuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhY2Vkcml2ZTE1MDNAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cmFjZWRyaXZlMTUw
M0BnbWFpbC5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86cmFjZWRyaXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWNl
ZHJpdmUxNTAzQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFjZWRy
aXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWNlZHJpdmUxNTAzQGdtYWlsLmNv
bTwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgSmFuICZhbXA7IFJhbGY6PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoEkgaGF2ZSBhIGxp
dHRsZSBnb29kIG5ld3MsIEkgaGF2ZSBzdWNjZXNzZnVsbHkgZ290dGVuIHRoZSBub24tcm9vdDxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGxpbnV4IHRvIGRpc3BsYXkgc29tZSBzdGFydHVw
IG91dHB1dCBiYXNlZCBvbiB5b3VyIHN1Z2dlc3Rpb25zLsKgPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgQWxzbywgdGhlcmUgbXVzdCBoYXZlIGJlZW4gc29tZSBzbWFsbCBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIHN0b2NrPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgbGludXgteDg2
LWRlbW8gY2VsbCBjb25maWcgYW5kIHRoZSBvbmUgSSB0d2Vha2VkLsKgIEkgd2VudCBiYWNrIHRv
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgdGhlIG9yaWdpbmFsIGFuZCBtYWRlIHNvbWUg
bWlub3IgY2hhbmdlcyBhbmQgaXQgc3RhcnRlZCBkaXNwbGF5aW5nPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgdGhlIHNlcmlhbCBvdXRwdXQgbm93IGZvciB0aGUgbm9uLXJvb3Qgbm9kZS48
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgSSBlbmRl
ZCB1cCBtYWtpbmcgdGhlIHJvb3QgY2VsbCB0aGUgcHJpbWFyeSB1c2VyIG9mIHRoZSB0dHlTMDxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGRldmljZSwgYW5kIGp1c3QgaGF2aW5nIHRoZSBu
b24tcm9vdCBsaW51eCBvdXRwdXQgdG8gdGhlPGJyPg0KJmd0O8KgIMKgIMKgaHlwZXJ2aXNvcjxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHZpcnR1YWwgY29uc29sZSAoY29uc29sZT1qYWls
aG91c2UpLsKgIEluIG15IHNldHVwLCB0aGVyZTxicj4NCiZndDvCoCDCoCDCoGFwcGVhcnMgdG88
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBiZSBzb21lIHByb2Nlc3Mgc3RpbGwgYXR0ZW1w
dGluZyB0byB1c2UgdGhlIHR0eVMwIHJhbmRvbWx5IG9uIHRoZTxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoHJvb3QgbGludXgsIGFuZCB0aGF0IGNhdXNlcyB0aGUgaHlwZXJ2aXNvciB0byBo
YWx0IGl0IGlmIEkgZG9uJiMzOTt0PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgbGVhdmUg
aXQgaW4gdGhlIFBJTyBhcnJheS7CoCBOb3Qgc3VyZSB3aG8gaXMgZG9pbmcgaXQuPGJyPg0KJmd0
O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqBUaGlzIGlzIHdoZXJlIGkmIzM5O20gYXQgbm93LsKgIFRoZSBub24tcm9vdCBsaW51
eCBrZWVwcyBydW5uaW5nIGludG88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBwb2ludHMg
d2hlcmUgaXQgdHJpZXMgdG8gYWNjZXNzIFBJTyBhbmQgZ2V0cyBwYXJrZWQ6PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoDEuIEZpcnN0IGNyYXNoOjxi
cj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBbIMKgIMKg
MC40MjQ5MjVda3dvcmtlci91NjowICgyNykgdXNlZCBncmVhdGVkIHN0YWNrIGRlcHRoOiAxNDY1
Njxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGJ5dGVzIGxlZnQ8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqBbIMKgIMKgMC40MjU4MDddZnV0ZXggaGFzIHRhYmxlIGVudHJpZXM6IDEw
MjQgKG9yZGVyOiA0LCA2NTUzNjxicj4NCiZndDvCoCDCoCDCoGJ5dGVzKTxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZxdW90O0ZBVEFMOiBJbnZhbGlkIFBJTyB3cml0ZSwgcG9ydDogNzA6
IHNpemUgMSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoC4uLjxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoFBhcmtpbmcgQ1BVIDMgKENlbGw6ICZxdW90O2xpbnV4LXg4Ni1k
ZW1vJnF1b3Q7KTxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqBBY2NvcmRpbmcgdG8gL3Byb2MvaW9wb3J0cywgNzAgaGFzIHRvIGRvIHdpdGggdGhlIFJl
YWx0aW1lIGNsb2NrPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgKHJ0YzApLsKgIEkgd2Fz
IGFibGUgdG8gdGVtcG9yYXJpbHkgYWRkIHRoZSA3MCBtYXBwaW5nIHRvIHRoZTxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoG5vbi1yb290IGxpbnV4LCBidXQgc2hvdWxkIGl0IGJlIHRoZXJl
IGF0IGFsbD/CoCBJIHRyaWVkIHRvIGRpc2FibGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqBSVEMgc3VwcG9ydCBpbiB0aGUgZ3Vlc3Qga2VybmVsIGNvbmZpZy48YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oDIuIE9uIHRoZSBuZXh0IGF0dGVtcHQsIEkgdGhlbiBnb3QgZnVydGhlciB3aXRoIGEgY3Jhc2gg
dHJ5aW5nIHRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgaW5pdGlhbGl6ZSBTZXIgZGV2
aWNlIHR0eVMwOjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmcXVvdDtbIMKgIMKgMC45NTYxNDZdU2VyaWFsOiA4MjUwLzE2NTUwIGRyaXZlciwgMSBw
b3J0cywgSVJRIHNoYXJpbmc8YnI+DQomZ3Q7wqAgwqAgwqBlbmFibGVkJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJnF1b3Q7RkFUQUw6IEludmFsaWQgUElPIHJlYWQsIHBvcnQ6
IDNmOTogc2l6ZSAxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgLi4uPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgUGFya2luZyBDUFUgMyAoQ2VsbDogJnF1b3Q7bGludXgt
eDg2LWRlbW8mcXVvdDspPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoEkgY2FuIGdldCBhcm91bmQgdGhhdCBpZiBJIGFsbG93IHRoZSBub24tcm9vdCBh
Y2Nlc3MgaW4gaXRzIHBpbzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHRhYmxlLCBidXQg
dGhlbiBJIGhhdmUgYSBwcm9ibGVtIGFib3ZlIHdpdGggdGhlIHJvb3QgbGludXg8YnI+DQomZ3Q7
wqAgwqAgwqByYW5kb21seTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHRyeWluZyB0byB1
c2UgaXQuPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAzLiBOb3cgd2l0aCB0aGUgdGVtcG9yYXJ5IGFkanVzdG1l
bnRzIHRvIHRoZSBub24tcm9vdCBwaW8gdGFibGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqBhYm92ZSBJIGdldCBoZXJlOjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmcXVvdDtbIMKgIMKgMC45NzIzOTldY2xvY2tzb3VyY2U6U3dpdGNoZWQg
dG8gY2xvY2tzb3VyY2UgdHNjJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJnF1
b3Q7RkFUQUw6IEludmFsaWQgUElPIHJlYWQsIHBvcnQ6IDg3OiBzaXplIDEmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAuLi48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBQ
YXJraW5nIENQVSAzIChDZWxsOiAmcXVvdDtsaW51eC14ODYtZGVtbyZxdW90Oyk8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgQWNjb3JkaW5nIHRvIHBy
b2MvaW9wb3J0cyB0aGlzIG9uZSBoYXMgdG8gZG8gd2l0aCAmcXVvdDtkbWEgcGFnZTxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoHJlcXVlc3QmcXVvdDsuIEl0IGlzbiYjMzk7dCBtYXBwZWQg
aW4gbXkgcm9vdCBsaW51eCBQSU8gb3Igbm9uLXJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqBsaW51eCBh
cnJheS48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoEFzaWRlIGZyb20gdGhlIHNlcmlhbCBjb25mbGljdCwgaXQg
c2VlbXMgbGlrZSB0aGVzZSBzaG91bGQgcmVtYWluPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgY29udHJvbGxlZCBieSB0aGUgcm9vdCBsaW51eCBvciBoeXBlcnZpc29yLsKgIMKgRG8geW91
IHVzZSBhPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgcGFydGljdWxhciBiYXJlIG1pbmlt
dW0geDg2IGtlcm5lbCBjb25maWcgb24geW91ciBtYWNoaW5lIGZvciB0aGU8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqBndWVzdCB0byBnZXQgYXJvdW5kIHRoZXNlP8KgIEkga25vdyBKYW4g
bWVudGlvbmVkIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGphaWxob3VzZS1pbWFn
ZXMgcHJvamVjdCBtaWdodCBoYXZlIHNvbWV0aGluZywgYnV0IEkgY291bGRuJiMzOTt0IGZpbmQ8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBpdCBkaWdnaW5nIGFyb3VuZCBxdWljay48YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgVGhhbmtzIHRv
IHlvdSBib3RoIGZvciB5b3VyIHJlc3BvbnNlcyBhbmQgcGF0aWVuY2UuwqAgSSBnb3QgdGhlPGJy
Pg0KJmd0O8KgIMKgIMKgcm9vdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGxpbnV4IHVw
IGFuZCBnb2luZyBvbiBteSBvd24sIGJ1dCB0aGUgbm9uLXJvb3QgZ3Vlc3QgaXMgcHJvdmluZyB0
bzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGJlIG1vcmUgZGlmZmljdWx0Ljxicj4NCiZn
dDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBXYXluZTxicj4NCiZn
dDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDEx
OjMxIEFNIFJhbGYgUmFtc2F1ZXI8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2Js
YW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9
Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0OyZndDsg
d3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoEhpLDxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBPbiA2LzEwLzE5IDc6NDUgUE0sIFdheW5lIHdyb3RlOjxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgVGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlcyBS
YWxmIGFuZCBKYW4uPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgWWVzLCBJIGhhdmUgc3VjY2Vzc2Z1
bGx5IGdvdHRlbiBib3RoIHRoZSBhcGljLWRlbW8gYW5kPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgdGlueS1kZW1vIGNlbGxzPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0OyB0byB3b3JrIG9uIG15IHN5c3RlbSBiZWZvcmUgYXR0ZW1wdGluZyB0byBsb2Fk
IHRoZSBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGxpbnV4LsKg
IEk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IGNhbiBzZWUgc2VyaWFs
IG91dHB1dCBmcm9tIHRoZW0uPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgSG93ZXZlciwgaWYgSSB0
cnkgdG8gc2hhcmUgdGhlIFVBUlQgYmV0d2VlbiByb290IGFuZCBpbm1hdGU8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBmb3IgdGhlbSBJPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0OyBydW4gaW50byBhIGNyYXNoIG9uIHRoZSBoeXBlcnZpc29yIGlmIHRo
ZSByb290IGxpbnV4PGJyPg0KJmd0O8KgIMKgIMKgYXR0ZW1wdHM8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqB0byB3cml0ZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDsgdG8gdGhlIFVBUlQgKGFmdGVyIGNyZWF0aW5nL3N0YXJ0aW5nIGEgZGVtbykuwqAg
RG9lcyB0aGUgcm9vdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGxpbnV4IGxv
c2U8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IGFjY2VzcyBvbmNlIGFu
IGlubWF0ZSBpcyBjcmVhdGVkL3N0YXJ0ZWQ/wqAgT3IgYW0gSSBtaXNzaW5nPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgc29tZXRoaW5nPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0OyBmcm9tIG15IFN5c3RlbSBjb25maWcgb3IgdGlueS1kZW1vIGNvbmZp
ZyB0aGF0IGFsbG93czxicj4NCiZndDvCoCDCoCDCoHRoZW0gdG88YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqBzaGFyZT/CoCBJPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0OyBhdHRhY2hlZCB0aGUgY3Jhc2ggaW4gaHlwZXJ2aXNvcl9vdXRwdXQudHh0Ljxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IEFsc28sIEkgbm90aWNlZCB0aGUgdGlueS1kZW1vIG91dHB1
dCBvbiB0aGUgVUFSVCBnZXRzPGJyPg0KJmd0O8KgIMKgIMKgbWlycm9yZWQ8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBvbiB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgWWVzLCBhY2NvcmRpbmcgdG8geW91ciBjb25m
aWcsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgSkFJTEhPVVNFX0NFTExfVklS
VFVBTF9DT05TT0xFX0FDVElWRSBpczxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oHNldC4gVGhpcyBtZWFucyB0aGF0IHRoZSBndWVzdCB3aWxsIHVzZSB0aGUgdmlydHVhbDxicj4N
CiZndDvCoCDCoCDCoGNvbnNvbGUuIFRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoHZpcnR1YWw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjb25zb2xlIHVz
ZXMgdGhlIGh5cGVydmlzb3Igb3V0cHV0IHdoaWNoIGRlcGVuZHMgd2hhdGV2ZXI8YnI+DQomZ3Q7
wqAgwqAgwqBpcyBzZXQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBpbiB5b3Vy
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgc3lzdGVtIGNvbmZpZ3VyYXRpb24u
IEluIHlvdXIgY2FzZSB0aGUgaHlwZXJ2aXNvciB1c2VzIDNmOC48YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgQW5kIGFkZGl0aW9uYWxseSwg
dGhlIGlubWF0ZSBhbHNvIGEgdmFsaWQgLmNvbnNvbGUgc2V0LiBBZ2Fpbiw8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAzZjguIFRoaXM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBtZWFucywgaXQgd2lsbCB1c2UgdGhlIGNvbnNvbGUgKmFuZCogdGhlIGh5cGVy
dmlzb3IgZGVidWc8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBoeXBlcmNhbGwu
IEluPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgeW91ciBjYXNlLCBib3RoIG91
dHB1dHMgYXJlIHJvdXRlZCB0byB0aGUgc2FtZSBkZXZpY2Ugd2hpY2g8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqBleHBsYWlucyB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBtaXJyb3JpbmcuPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgSmFpbGhvdXNlIHZpcnR1YWwgY29uc29sZS7CoCBE
b2VzIHRoYXQgbWVhbiB0aGF0IGl0czxicj4NCiZndDvCoCDCoCDCoHdyaXRpbmcgdG8gdGhlPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBzZXJpYWwgdGhyb3VnaCB0aGUg
aHlwZXJ2aXNvciBhbmQgbm90IGRpcmVjdGx5IGFjY2Vzc2luZzxicj4NCiZndDvCoCDCoCDCoHR0
eVMwPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgaXRzZWxmPzxicj4NCiZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBFeGFjdGx5Ljxi
cj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7IElmIHNvLCBpcyB0aGVyZSBhIHdheSB0byBjcmVhdGUgdGhlIGNlbGwgdG8gd3JpdGUgdHR5
UzA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBkaXJlY3RseSBhcyBhPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyB0ZXN0P8KgIFRvIHNlZSBpZiBpdCBl
eGhpYml0cyBzYW1lIGJlaGF2aW9yIGFzIHRoZTxicj4NCiZndDvCoCDCoCDCoG5vbi1yb290IGxp
bnV4Ljxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqBTdXJlLCBzaW1wbHkgYWxpZ24gdGhlIC5hZGRyZXNzIGZpZWxkIG9mIC5jb25zb2xlLCBh
bmQgYWxsb3c8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBhY2Nlc3MgdG88YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB0aGF0IHBvcnQgdmlhIC5waW9fYml0bWFw
Ljxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBGWUksIEkgY3Jl
YXRlIHRoZSB0aW55LWRlbW8gbGlrZSB0aGlzOjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IGphaWxo
b3VzZSBjZWxsIGNyZWF0ZSBjb25maWdzL3g4Ni90aW55LWRlbW8uY2VsbDxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgamFpbGhvdXNlIGNlbGwgbG9hZCB0aW55LWRlbW88
YnI+DQomZ3Q7wqAgwqAgwqBpbm1hdGVzL2RlbW9zL3g4Ni90aW55LWRlbW8uY2VsbCDCoDxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgamFpbGhvdXNlIGNlbGwgc3RhcnQg
dGlueS1kZW1vPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgR29pbmcgYmFjayB0byBteSBvcmlnaW5h
bCBub24tcm9vdCBsaW51eCBxdWVzdGlvbiwgSTxicj4NCiZndDvCoCDCoCDCoGRvbiYjMzk7dCBz
ZWUgYW55PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBvdXRwdXQgd2hl
biBjb25uZWN0ZWQgb3ZlciB0dHlTMC7CoCBJdHMgYWRkcmVzcyBpcyAweDNmODxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCgmcXVvdDtzZXJpYWwgMSZxdW90OykgaW48YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IHRoZSBQSU8sIGFuZCB0aGF0IHNlZW1z
IHRvIHdvcmsgZmluZSBmb3IgdGhlIG90aGVyIHNpbXBsZTxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoGRlbW9zLCBtaW51czxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDsgdGhlIGh5cGVydmlzb3IgY3Jhc2ggaXNzdWUgYWJvdmUgd2hlbiBzaGFyaW5nLsKg
IEkga25vdyB0aGVyZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGlzIHRoZTxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgb3RoZXIgJnF1b3Q7c2VyaWFs
IDImcXVvdDsgcG9ydCBidXQgSSBoYXZlbiYjMzk7dCB0cmllZCB0byB1c2UgdGhhdCBvbmUuPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoEkg
c2VlIHRoYXQgcG9ydCBvbiBvdXIgRGVsbCBzZXJ2ZXIgYXMgd2VsbC4gSXQmIzM5O3MgcHJlc2Vu
dCw8YnI+DQomZ3Q7wqAgwqAgwqBidXQgSTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoGRvbiYjMzk7dDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGtub3cgd2hl
cmUgaXQmIzM5O3MgY29ubmVjdGVkIHRvLjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBMZXQgbWUganVzdCBzdW1tYXJpc2UgeW91ciBpc3N1
ZTo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgWW91IG9ubHkgaGF2ZSBvbmUgc2VyaWFsIGxpbmUgYXZhaWxhYmxlLCByaWdodD8gRnJvbSB0
aGU8YnI+DQomZ3Q7wqAgwqAgwqByb290LWNlbGwmIzM5O3M8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqBQT1YsIGl0JiMzOTtzIHR0eVMwIG9uIDNmOC48YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgSSB3b3VsZCBwcm9wb3Nl
IHRvIHNoYXJlIHR0eVMwIGJldHdlZW4gdGhlIGh5cGVydmlzb3IgYW5kPGJyPg0KJmd0O8KgIMKg
IMKgbm9uLXJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBMaW51eC4gVGhp
cyBtZWFuczo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgwqAgLSBEb24mIzM5O3QgbGV0IHRoZSByb290LWNlbGwgdXNlIHR0eVMwLiBSZW1v
dmUgYW55PGJyPg0KJmd0O8KgIMKgIMKgY29uc29sZT10dHlTMDxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoMKgIMKgIHBhcmFtZXRlcnMgZnJvbSB5b3UgY29tbWFuZGxpbmUuIEVu
c3VyZSB0aGF0IG5vb25lPGJyPg0KJmd0O8KgIMKgIMKgZWxzZSBhY2Nlc3Nlczxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoMKgIMKgIHR0eVMwIChlLmcuLCBnZXR0eUB0dHlTMCBv
ciBvdGhlciBmcmllbmRzKTxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqDCoCAtIFNldCAzZjggYXMgZGVidWdfY29uc29sZSBpbiB5b3VyIG1h
c3Rlci5jIChzZWVtcyB5b3U8YnI+DQomZ3Q7wqAgwqAgwqBhbHJlYWR5PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgaGF2ZSk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgwqAgLSBBbGxvdyAzZjggYWNjZXNzIGluIHRoZSBs
aW51eC1kZW1vLmMgKGFscmVhZHkgc2V0IGluPGJyPg0KJmd0O8KgIMKgIMKgdGhlIGRlZmF1bHQ8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqDCoCDCoCBsaW51eC1kZW1vPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoMKgIC0g
RGlzYWxsb3cgMmY4IGFjY2VzcyBpbiBsaW51eC1kZW1vLmM6PGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgWyAweDJmOC84IC4uLsKgIDB4
MmZmLzhdID0gMCwgLyogc2VyaWFsMiAqLzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFsgMHgyZjgvOCAuLi7CoCAweDJmZi84XSA9IC0x
LCAvKiBzZXJpYWwyICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoMKgIMKgIEkgZG9uJiMzOTt0IGtub3cgaG93IExpbnV4IGVudW1lcmF0
ZXMgc2VyaWFsIGRldmljZXMsIGJ1dCB0aGlzPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgZW5zdXJlczxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoMKgIMKgIHRo
YXQgTGludXggd29uJiMzOTt0IHNlZSB0aGUgdW5jb25uZWN0ZWQgc2VyaWFsIGxpbmUgYW5kIG1h
cDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHR0eVMwIHRvPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgwqAgwqAgM2Y4PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IG5vbiByb290IGxpbnV4IGxhdW5jaGVkIHdpdGg6PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyAvdG9vbHMvamFpbGhvdXNlIGNlbGwg
bGludXggY29uZmlncy94ODYvbGludXgteDg2LmNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7IC9ib290L3ZtbGludXgtNC4xLjE2LUd1ZXN0IC1jICZxdW90O2NvbnNv
bGU9dHR5UzAsMTE1MjAwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoFRoZW4sIHRoaXMgc2hvdWxkIGFjdHVhbGx5IHdvcmsuLi48
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
QW5kIGlmIG5vdCwgdGhlbiBjb25zb2xlPWphaWxob3VzZTAgc2hvdWxkIHdvcmsuPGJyPg0KJmd0
O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IEkgY2FuIHRyeSB0aGUgNC4xOSBz
aWVtZW5zIGtlcm5lbCBhbmQgJnF1b3Q7bmV4dCZxdW90OyBicmFuY2ggZm9yPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgamFpbGhvdXNlIHlvdTxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDsgc3VnZ2VzdGVkLsKgIERvIHlvdSB0aGluayB0aGF0IGNvbWJp
bmF0aW9uIHdpbGwgcmVzb2x2ZTxicj4NCiZndDvCoCDCoCDCoHRoZSBtaXNzaW5nPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBzZXJpYWwgZm9yIHRoZSBub24tcm9vdCBs
aW51eD/CoCBPdGhlcndpc2UsIGRpZCBteSBrZXJuZWw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBjb25maWcsIHN5c3RlbTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDsgY29uZmlnLCBhbmQgbm9uLXJvb3QgbGludXggY2VsbCBjb25maWdzIGxvb2sgT0s/
PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oEkgZGlkbiYjMzk7dCBsb29rIGF0IGl0LCBidXQgd2Ugc2hvdWxkIGF0IGxlYXN0IC0gZXZlbiBp
ZiBzb21lPGJyPg0KJmd0O8KgIMKgIMKgZmxhZ3MgYXJlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgc3RpbGwgaW5jb3JyZWN0IC0gc2VlIHRoZSAmcXVvdDtVbmNvbXByZXNzaW5n
IGtlcm5lbC4uLiZxdW90OyB0aGluZy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgV2FpdCAtLSBvbmUgdGhpbmcgeW91IGNvdWxkIHRyeTog
RGVhY3RpdmF0ZSBDT05GSUdfRUZJIGFuZDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoGVzcGVjaWFsbHk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBDT05GSUdf
RUZJX1NUVUJTLiBJJiMzOTttIG5vdCBzdXJlLCBidXQgaXQgY291bGQgYmUgdGhhdCBFRklfU1RV
QlM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjaGFuZ2U8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB0aGUgaGVhZGVyIGZvcm1hdCB0aGF0IG91ciBib290bG9h
ZGVyIHBhdGNoZXMuPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
IFRoYW5rcyBhZ2FpbiBmb3IgeW91ciBoZWxwLjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBObyBwcm9ibGVtLiBCdXQgaXQmIzM5O3Mgbm90
IHlldCB3b3JraW5nLiA7LSk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgwqAgUmFsZjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgT24g
RnJpLCBKdW4gNywgMjAxOSBhdCA1OjMwIFBNIFJhbGYgUmFtc2F1ZXI8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVl
ckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJl
Z2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYu
cmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3Ro
LXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNi
dXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJh
bGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNh
dWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVy
QG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgt
cmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1
cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFs
Zi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0OyZndDsmZ3Q7Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgSGkgV2F5bmUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoE9uIDYvNy8xOSAxMDowNCBQTSwgV2F5bmUgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBIaSBSYWxmLDxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFRoYW5rIHlvdSBmb3IgeW91ciByZXNwb25z
ZXMuwqAgSSBoYXZlIGF0dGFjaGVkIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoHJlcXVlc3RlZCBjb25maWc8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7IGZpbGVzLsKgIEkgYW0gbm93IGp1c3QgdHJ5aW5nIHRvIHVzZSB0aGUg
c2FtZTxicj4NCiZndDvCoCDCoCDCoGJ6SW1hZ2UgZm9yPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgdGhlIHJvb3QgYW5kPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0OyB0aGUgbm9uLXJvb3QgbGludXggbm9kZS48YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgT25lIHF1ZXN0aW9uIHRoYXQgeW91IGRpZG4mIzM5O3QgYW5zd2Vy
OiBkbyBhcGljLWRlbW8gb3I8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB0aW55
LWRlbW8gd29yaz88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqBUaGV5IG5lZWQgdG8gdG8gaGF2ZSBjb3JyZWN0IC5jb25zb2xlIHBhcmFtZXRlciBzZXQsIHNv
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgZW5zdXJlIHRoYXQ8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBwYXJhbWV0ZXJzIGFyZSBzZXQg
aWYgeW91IHJ1biB0aG9zZSBkZW1vcyBpbiB5b3VyPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgbGludXgtZGVtbyBjZWxsLiBKdXN0PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgY29tcGFyZSBpdCB0byB0aW55LWRlbW8uYyBvciBhcGljLWRl
bW8uYzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBZZXMsIEkgYW0gdXNpbmcgdmFuaWxs
YSA0LjE2IGJlY2F1c2UgdGhlIGRvY3VtZW50YXRpb248YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBpbmRpY2F0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqB0aGF0IGl0PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0OyBpcyB0aGUgZmlyc3QgbWFpbmxpbmUgcmVsZWFzZSB0byBvZmZpY2lhbGx5
IHN1cHBvcnQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBKYWlsaG91c2UgR3Vl
c3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGlt
YWdlcy7CoCBEbyB5b3Ugc3VnZ2VzdCB0aGF0IEkgdXNlIHNvbWV0aGluZyBlbHNlPzxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBBcyBKYW4gYWxyZWFkeSB3cm90ZTogVHJ5IHRvIHVzZSBT
aWVtZW5zJiMzOTsgNC4xOSBicmFuY2guPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFJp
Z2h0IG5vdyBpJiMzOTttIGp1c3QgdHJ5aW5nIHRvIGdldCBzb21lIHNlcmlhbDxicj4NCiZndDvC
oCDCoCDCoG91dHB1dCBmcm9tPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgdGhl
IG5vbi1yb290PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0OyBMaW51eC7CoCBIb3BlZnVsbHksIEkgaGF2ZSB0aGF0IGNvbmZpZ3VyZWQgY29ycmVjdGx5
LsKgPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgSWRlYWxseSwgSSB3b3VsZDxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgbGlrZSB0
byBzaGFyZSB0aGUgc2FtZSBzZXJpYWwgY29uc29sZSBmb3IgdGhlIFJvb3Q8YnI+DQomZ3Q7wqAg
wqAgwqBub2RlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgYW5kIG5vbi1yb290
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBub2Rl
IGV2ZW50dWFsbHkgaWYgcG9zc2libGUuwqAgSSBoYXZlIGJlZW4gT0sgd2l0aDxicj4NCiZndDvC
oCDCoCDCoHVzaW5nPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgdGhlIHZpcnR1
YWw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGNv
bnNvbGUgKGphaWxob3VzZSBjb25zb2xlIC1mKSBmb3IgdGhlIEh5cGVydmlzb3I8YnI+DQomZ3Q7
wqAgwqAgwqBvdXRwdXQuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoEluIGFkZGl0aW9u
IHRvIEphbiYjMzk7cyBjb21tZW50Ojxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBDdXJy
ZW50bHkgeW91IG9ubHkgaGF2ZSBhY2Nlc3MgdG8gdGhlIGphaWxob3VzZSBjb25zb2xlPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgdmlhICYjMzk7amFpbGhvdXNlPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgY29uc29sZSYjMzk7IGZyb20g
eW91ciByb290IGNlbGwuIEltYWdpbmUgeW91ciByb290IGNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqBjcmFzaGVzIGZvciBzb21lPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgcmVhc29uLiBZb3Ugd2lsbCBuZXZlciBzZWUgdGhlIGZh
dWx0IHJlYXNvbiwgd2hpY2ggbWFrZXM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqB0aGluZ3MgaGFyZCB0bzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoGRlYnVnLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBJIHdvdWxkIHN1Z2dl
c3QgdG8gY29uZmlndXJlIHRoZSBoeXBlcnZpc29yIHRvIHVzZSB0aGU8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqBzZXJpYWwgY29uc29sZS48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBZb3UgY2FuIHNoYXJlIHRoZSBkZXZpY2Ugd2l0aCB0
aGUgbm9uLXJvb3QgTGludXgsIHRoYXQmIzM5O3M8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqBubyBwcm9ibGVtLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBJbiB0aGlz
IGNhc2UsIHRoZSBub24tcm9vdCBrZXJuZWwmIzM5O3Mgb3V0cHV0IHdpbGw8YnI+DQomZ3Q7wqAg
wqAgwqBhbHdheXMgYmU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBwcmludGVk
IHRvIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoHNl
cmlhbCBjb25zb2xlLiBEaXJlY3RseSwgaWYgeW91IGNob29zZTxicj4NCiZndDvCoCDCoCDCoGNv
bnNvbGU9dHR5U3gsIGFuZDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGluZGly
ZWN0bHk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqB2aWEg
dGhlIGh5cGVydmlzb3IgaWYgeW91IGNob29zZSBjb25zb2xlPWphaWxob3VzZS48YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgQlRXOiBBY2NvcmRpbmcgdG8geW91ciBjb25maWcsIHlvdXIg
c3lzdGVtIGlzIGE8YnI+DQomZ3Q7wqAgwqAgwqBQb3dlckVkZ2UsPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgYW5kIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoG5vbi1yb290IGNlbGwgZ2V0cyBib3RoLCAweDJmOCBhbmQgMHgzZjgu
IEFyZSB5b3Ugc3VyZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHRoYXQgdHR5
UzEgaXMgdGhlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
Y29ycmVjdCBjb25zb2xlIHRoYXQgeW91IGFyZSBjb25uZWN0ZWQgdG8/PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoEp1c3QgbWVudGlvbmluZyB0aGlzIGFzIHdlIGhhdmUgYSBzaW1pbGFy
IG1hY2hpbmUgaGVyZSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBhbmQsIGFm
YWlyLCBib3RoPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
cGxhdGZvcm0gc2VyaWFsIGRldmljZSBhcmUgJiMzOTt1c2FibGUmIzM5OywgYnV0IG9uZSBlbmRz
IGluIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoG5pcnZhbmEgd2hpbGU8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBpdCBpcyBhY2Nl
c3NpYmxlLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBBaCwgYW5kIG9uZSBsYXN0IHRo
aW5nOiB0cnkgdG8gc3dpdGNoIHRvIHRoZSBjdXJyZW50PGJyPg0KJmd0O8KgIMKgIMKgbmV4dDxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGJyYW5jaCBmb3I8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBqYWlsaG91c2UuIEphbiBqdXN0IGlu
dGVncmF0ZWQgYSBmZXcgcGF0Y2hlcyBmcm9tIG1lPGJyPg0KJmd0O8KgIMKgIMKgdGhhdDxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoG1pZ2h0IGFsc28gYmU8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqByZWxldmFudCBmb3IgeW91ciBtYWNo
aW5lLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBIVEg8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqDCoCBSYWxmPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7IFdheW5lPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDsgT24gRnJpLCBKdW4gNywgMjAxOSBhdCA5OjEwIEFNIFJhbGYgUmFtc2F1ZXI8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7ICZsdDs8YSBocmVm
PSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsi
PnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIg
dGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxm
LnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdl
dD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJf
YmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVy
Zy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5r
Ij5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUi
IHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsm
Z3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVy
Zy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVl
ckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJl
Z2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUi
IHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4N
CiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3Ro
LXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNi
dXJnLmRlPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1
cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1y
ZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBIaSw8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgT24gNi83LzE5IDI6Mjgg
UE0sIFdheW5lIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDsgSGVsbG8sPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgSSBhbSBuZXcgdG8g
TGludXggZGV2ZWxvcG1lbnQgYW5kPGJyPg0KJmd0O8KgIMKgIMKgSmFpbGhvdXNlLsKgIEkgaGF2
ZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoHN1Y2Nlc3Nm
dWxseTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoGJvb3RlZDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDsgdGhlIEphaWxob3VzZSBIeXBlcnZpc29yIGFuZCByb290IGNl
bGwgb24gYSBiYXJlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgbWV0YWwgWDg2
IExpbnV4PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgc3lzdGVtPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAoTm8gUUVNVSkuwqAgSSBhbSBub3cgdHJ5aW5nIHRvIGxv
YWQgYSBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoExpbnV4IGNl
bGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBhbmQgSSBo
YXZlIGE8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7IGZldyBxdWVzdGlvbnMuwqAgSmFpbGhvdXNlIGFjY2VwdHMgYW5kIHN0YXJ0
cyBteTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoG5vbi1yb290PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgbGludXggY2VsbDxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsg
Y29uZmlndXJhdGlvbiBhbmQgSSBzZWUgaXQgYXMgJnF1b3Q7cnVubmluZyZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoHRocm91Z2ggdGhlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgJnF1b3Q7amFpbGhvdXNlIGNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGxpc3QmcXVvdDsgY29tbWFu
ZC7CoCBIb3dldmVyLCBJIGRvbiYjMzk7dCBzZWUgYW55IHNlcmlhbDxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoG91dHB1dCBmcm9tIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgJnF1b3Q7bm9uLXJvb3Qg
bGludXgmcXVvdDsgY2VsbCBib290aW5nIHVwLsKgIEnigJltIG5vdCBzdXJlPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgd2hhdCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBub24tcm9vdCBub2RlPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBpcyBkb2luZyBhdCB0
aGlzIHBvaW50Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqBPaywgZmlyc3Qgb2YgYWxsLCBjYW4geW91IHNlZSBhbnkgb3V0cHV0IGZyb208YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBKYWlsaG91c2UmIzM5O3MgZGVtbzxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGlubWF0ZXM8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAoZS5n
LiwgdGlueS1kZW1vIG9yIGFwaWMtZGVtbyk/PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgTXkgcm9vdCBub2RlIGlzIGEgNC4xNiBrZXJuZWw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBjb25maWd1cmVkIHRoaXM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqB3YXk6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAxLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoENP
TkZJR19KQUlMSE9VU0VfR1VFU1QgaXM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqBub3Qgc2V0PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAyLiBDT05GSUdfU0VSSU89eTxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBDT05GSUdfU0VSSUFMXzgyNTBfUlVOVElNRV9VQVJUUz00
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNeSBub24tcm9vdCBub2RlIGlz
IGEgNC4xNiBrZXJuZWw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjb25maWd1
cmVkPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgdGhpcyB3
YXk6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAx
Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoENPTkZJR19KQUlMSE9VU0VfR1VF
U1Q9eTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Mi4gQ09ORklHX1NFUklPPW08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAoY2Fu
JiMzOTt0IHNlZW08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqB0byBkaXNhYmxlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0OyBjb21wbGV0ZWx5IGluIG15IGNvbmZpZyBmb3IgNC4xNik8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDMuPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgQ09ORklHX1NFUklBTF84
MjUwX1JVTlRJTUVfVUFSVFM9MTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgYSBmdWxsIC5jb25maWc/
IFdoYXQ8YnI+DQomZ3Q7wqAgwqAgwqBicmFuY2g8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqBhcmUgeW91PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgZXhhY3RseTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoHVzaW5nPyBWYW5pbGxhIDQuMTY/PGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFBsZWFzZSBhdHRhY2ggeW91ciBzeXN0
ZW0gY29uZmlnIGFuZCB5b3VyPGJyPg0KJmd0O8KgIMKgIMKgbm9uLXJvb3QgbGludXg8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBjb25maWcgYXMgd2VsbC48
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgWW91
IG1heSBhbHNvIHdhbnQgdG8gdHJ5PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3NpZW1lbnMvbGludXgiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9zaWVtZW5zL2xpbnV4PC9hPiAu
IFNlZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoGphaWxob3VzZS1lbmFibGluZyBicmFuY2hlcyBmb3Igc29tZSByZWxlYXNlcy48YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDsgSW4gZ2VuZXJhbCwgZG8gdGhlIGtlcm5lbCBjb25maWcgc2V0dGluZ3M8YnI+DQomZ3Q7
wqAgwqAgwqBoYXZlIHRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgbWF0Y2gg
YmV0d2Vlbjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoHRoZSByb290PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBub2RlIGFuZCBub24tbGludXggb3IgaXMgdGhlIGFi
b3ZlIGZpbmU/PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoE5vLCB0aGV5IGRvIG5vdCBoYXZlIHRvIGJlIHRoZSBzYW1lLCBidXQgdGhleSBjYW4u
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgU3RpbGwsIGFuPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgYW5hbHlzaXM8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqByZXF1aXJlcyB5
b3VyIC5jb25maWcuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFRoZSB2bWxpbnV4LTQuMS4xNi1HdWVzdCBiekltYWdlIGlz
IGFwcHJveCA3TUIsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgYW5kIHRoZTxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGlubWF0ZSBub2Rl
IGlzPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyBhbGxvY2F0ZWQgfjc1TUIgb2YgUkFNLjxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IEkgaGF2ZSBh
IHNpbmdsZSBVQVJULCBzbyBJIGhhdmUgY29uZmlndXJlZCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqByb290IGNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqBzeXN0ZW0gY29uZmlnPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB0byBvdXRwdXQgdG8gdGhlIHZp
cnR1YWwgaHlwZXJ2aXNvciBjb25zb2xlOjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBXYWl0Li4uIFlvdSBjb25maWd1cmVkIHlvdXIgcm9vdC1j
ZWxsIHRvIHVzZSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBoeXBlcnZp
c29yIGRlYnVnPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgY29uc29sZT8gSG93PyBJdCYjMzk7cyBvbmx5IGF2YWlsYWJsZSBvbmNlIHRo
ZTxicj4NCiZndDvCoCDCoCDCoGh5cGVydmlzb3IgaXM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBlbmFibGVkLiBIb3c8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBzaG91bGQgdGhpcyB3b3JrPzxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBCdXQg
bGV0JiMzOTtzIGhhdmUgYSBsb29rIGF0IHlvdXIgY29uZmlndXJhdGlvbiBmaXJzdC48YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgU28geW91IHdh
bnQgdG86PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgwqAgLSBIYXZlIHRoZSBVQVJUICgweDNmOCkgYXZhaWxhYmxlIGluIHRoZTxicj4N
CiZndDvCoCDCoCDCoG5vbi1yb290IGNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q777+977+9IMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgwqAgLSBVc2UgMHgzZjggYXMgaHlwZXJ2
aXNvciBkZWJ1ZyBjb25zb2xlIGFzIHdlbGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqDCoCAtIE5vIGNvbnNvbGUgZm9yIHJvb3QtY2Vs
bDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBE
aWQgSSBnZXQgdGhpcyByaWdodD88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgwqAgUmFsZjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAuZmxhZ3MgPSBKQUlMSE9VU0VfU1lT
X1ZJUlRVQUxfREVCVUdfQ09OU09MRSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAuZGVidWdfY29uc29sZSA9IHs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7IC50eXBlID0gSkFJTEhPVVNFX0NPTl9UWVBFX05PTkUsPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB9LDxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7IGFuZCBJIGhhdmUgY29uZmlndXJlZCB0aGUgbm9uLXJvb3QgbGludXggY2VsbCB0bzxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoG91dHB1dCB0bzxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoHRoZSBVQVJUOjxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
IChBZGRlZCBzZXJpYWwgMHgzZjggdG8gcGlvIGJpdG1hcCBmb3Igbm9uLXJvb3Q8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBsaW51eCkgYW5kPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgc3RhcnRlZCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IG5vZGUgd2l0aCB0
aGlzOjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7IC4vdG9vbHMvamFpbGhvdXNlIGNlbGwgbGludXg8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjb25maWdzL3g4Ni9saW51eC14ODYuY2VsbDxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgL2Jvb3Qvdm1saW51eC00LjEuMTYtR3Vlc3QgLWM8YnI+DQomZ3Q7wqAgwqAgwqAmcXVvdDtj
b25zb2xlPXR0eVMwLDExNTIwMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgKE5vdGUgSSBhbHNvIHRyaWVkICZxdW90
O2NvbnNvbGU9amFpbGhvdXNlJnF1b3Q7IGluIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoGNvbW1hbmQgYWJvdmUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgYW5kIHRoYXQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHByb2R1Y2VzIHRoZSBzYW1lIHJlc3VsdCk8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0OyBJIHRoZW4gc2VlIHRoZSBmb2xsb3dpbmcgb24gbXkgaHlwZXJ2aXNvcjxi
cj4NCiZndDvCoCDCoCDCoGNvbnNvbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAoLi90b29scy9qYWlsaG91c2U8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGNvbnNvbGUgLWYpOjxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7IENyZWF0ZWQgY2VsbCAmcXVvdDtsaW51eC14ODYtZGVtbyZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsg
Li4uPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyBDZWxsICZxdW90O2xpbnV4LXg4Ni1kZW1vJnF1b3Q7IGNhbiBiZSBsb2FkZWQ8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7IFN0YXJ0ZWQgY2VsbCAmcXVvdDtsaW51eC14ODYtZGVtbyZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7IEFmdGVyIGEgbGl0dGxlIHdoaWxlIEkgZG8gZ2V0IGEgcGFya2VkIENQVSBlcnJvcjxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoG9uIHRoZSByb290PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgbm9kZSw8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBsb29rczxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgbGlr
ZSBpdHMgdHJ5aW5nIHRvIGRvIHNvbWV0aGluZyB3aXRoIHRoZTxicj4NCiZndDvCoCDCoCDCoFVB
UlQgYXMgd2VsbDo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7IEZBVEFMOiBJbnZhbGlkIFBJTyByZWFkLCBwb3J0OiAzZmUgc2l6
ZTogMTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7IEkgd291bGQgZXhwZWN0IHNvbWV0aGluZyB0byBwb3Agb3V0IG9u
IHRoZSBVQVJUPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgZnJvbSB0aGU8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBub24tcm9vdDxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGxp
bnV4PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyBub2RlIGZpcnN0LsKgIE5vdGUgdGhhdCByb290IG5vZGUgaGFzIHNlcmlhbDxi
cj4NCiZndDvCoCDCoCDCoDB4M2Y4PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
ZGlzYWJsZWQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBp
biBpdHMgcGlvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0OyBiaXRtYXAuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgSSB2ZXJpZmVkIHRoYXQgdGhl
IFVBUlQgaXMgZnVuY3Rpb25pbmcgYnk8YnI+DQomZ3Q7wqAgwqAgwqBhbGxvd2luZyB0aGU8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBoeXBlcnZpc29yIHRv
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0OyBwcmludCB0byBpdCBhbmQgYWxzbyBwZXJmb3JtZWQgYW4gZWNobyB0ZXN0IG92ZXI8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB0dHlTMC48YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBJ
IGhhdmUgdHJpZWQgc2V2ZXJhbCBjb25maWd1cmF0aW9ucyBvZjxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoGtlcm5lbC4uLi4uaW5jbHVkaW5nIHlvdXI8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBjdXJyZW50PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
OyAmcXVvdDtxdWV1ZXMvamFpbGhvdXNlJnF1b3Q7IGJyYW5jaCBoZWFkIGtlcm5lbCBmb3IgdGhl
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgbm9uLXJvb3Qgbm9kZSw8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBhbG9uZzxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHdpdGg8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7IHRoZSBrZXJuZWwgY29uZmlnIGZvciA0LjcgcG9zdGVkIGluIHRoaXMgdGhyZWFkPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgYmVsb3cgKGJ1dCBJPGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgZ2V0IHNhbWU8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHJlc3VsdCBh
cyBhYm92ZSB3aGVuIEkgc3RhcnQgaXQsIG5vIGtlcm5lbDxicj4NCiZndDvCoCDCoCDCoG91dHB1
dCk6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqA8YnI+DQomZ3Q7wqAgwqAgwqDCoMKgwqDCoCZxdW90OzxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBz
Lmdvb2dsZS5jb20vZm9ydW0vIyFzZWFyY2hpbi9qYWlsaG91c2UtZGV2L1JlJDNBJDIwRmFpbGVk
JDIwdG8kMjBib290JDIwamFpbGhvdXNlJTdDc29ydDpyZWxldmFuY2UvamFpbGhvdXNlLWRldi9N
N1VPODlYRklrMC9RaTQwRER1TUJBQUoiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZm9ydW0vIyFzZWFyY2hpbi9qYWlsaG91c2UtZGV2
L1JlJDNBJDIwRmFpbGVkJDIwdG8kMjBib290JDIwamFpbGhvdXNlJTdDc29ydDpyZWxldmFuY2Uv
amFpbGhvdXNlLWRldi9NN1VPODlYRklrMC9RaTQwRER1TUJBQUo8L2E+JnF1b3Q7Ljxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7IEFueSBpbmZvcm1hdGlvbiB5b3UgY2FuIHByb3ZpZGUgdG8gbWUgd2lsbCBiZTxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGhlbHBmdWwuwqAgSSYjMzk7bTxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoG5vdCBzdXJlPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB3
aGF0IG1pZ2h0IGJlIGdvaW5nIHdyb25nIGhlcmUuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgVGhhbmtzLDxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgV2F5bmU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAtLTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgWW91IHJlY2VpdmVkIHRoaXMgbWVzc2Fn
ZSBiZWNhdXNlIHlvdSBhcmU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBzdWJz
Y3JpYmVkIHRvIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoEdvb2dsZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDsgR3JvdXBzICZxdW90O0phaWxob3VzZSZxdW90OyBncm91cC48YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcDxicj4NCiZndDvCoCDC
oCDCoHJlY2VpdmluZzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGVtYWlsczxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGZyb20gaXQsIHNl
bmQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7IGFuIGVtYWlsIHRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmph
aWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2Js
YW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29t
PC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3Vz
ZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVn
cm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0
YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVn
cm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdl
dD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29t
PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0
YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWls
aG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2Js
YW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYl
MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFp
bGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWls
aG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9
Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5j
b208L2E+Jmd0OyZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpq
YWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRh
cmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91
c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5r
Ij5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMkJ1bnN1YnNjcmliZUBn
b29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5j
b20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb208L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29v
Z2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoDxicj4NCiZndDvCoCDCoCDCoMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmph
aWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRh
cmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tPC9hPiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgVG8gdmlldyB0aGlzIGRpc2N1c3Np
b24gb24gdGhlIHdlYiB2aXNpdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7
wqAgwqAgwqDCoMKgwqA8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQv
amFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzJpS2sxSjYlMkIwaHVoNV9fZFM0SHl1alh6VjlyJTJC
TGJLTHp1Vlo0SzNCdDVlQSU0MG1haWwuZ21haWwuY29tIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRl
di9DQSUyQiUyQktoYzJpS2sxSjYlMkIwaHVoNV9fZFM0SHl1alh6VjlyJTJCTGJLTHp1Vlo0SzNC
dDVlQSU0MG1haWwuZ21haWwuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8YnI+
DQomZ3Q7wqAgwqAgwqDCoMKgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNv
bS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0ElMkIlMkJLaGMyaUtrMUo2JTJCMGh1aDVfX2RTNEh5
dWpYelY5ciUyQkxiS0x6dVZaNEszQnQ1ZUElNDBtYWlsLmdtYWlsLmNvbT91dG1fbWVkaXVtPWVt
YWlsJmFtcDt1dG1fc291cmNlPWZvb3RlciIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0ElMkIl
MkJLaGMyaUtrMUo2JTJCMGh1aDVfX2RTNEh5dWpYelY5ciUyQkxiS0x6dVZaNEszQnQ1ZUElNDBt
YWlsLmdtYWlsLmNvbT91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWZvb3RlcjwvYT4m
Z3Q7Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDsgRm9yIG1vcmUgb3B0aW9ucywgdmlzaXQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqA8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2Qvb3B0b3V0
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dyb3Vwcy5nb29nbGUu
Y29tL2Qvb3B0b3V0PC9hPi48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IC0tPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyBZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3Jp
YmVkIHRvIHRoZSBHb29nbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEdyb3VwcyAmcXVvdDtKYWls
aG91c2UmcXVvdDsgZ3JvdXAuPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBUbyB1bnN1YnNjcmliZSBm
cm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0LCBzZW5kPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86amFpbGhvdXNl
LWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMkJ1bnN1
YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29n
bGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBn
b29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRh
cmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bTwvYT4mZ3Q7Jmd0Oy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFRvIHZpZXcgdGhpcyBkaXNjdXNz
aW9uIG9uIHRoZSB3ZWIgdmlzaXQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgPGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1k
ZXYvQ0ElMkIlMkJLaGMwTzJ6U2V1TExZM01hZVJXN2NRcldicS02WTJCSEpnJTJCeF9qNm5rJTNE
RUNhX0ElNDBtYWlsLmdtYWlsLmNvbSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0ElMkIlMkJL
aGMwTzJ6U2V1TExZM01hZVJXN2NRcldicS02WTJCSEpnJTJCeF9qNm5rJTNERUNhX0ElNDBtYWls
LmdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2
L0NBJTJCJTJCS2hjME8yelNldUxMWTNNYWVSVzdjUXJXYnEtNlkyQkhKZyUyQnhfajZuayUzREVD
YV9BJTQwbWFpbC5nbWFpbC5jb20/dXRtX21lZGl1bT1lbWFpbCZhbXA7dXRtX3NvdXJjZT1mb290
ZXIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBzLmdvb2ds
ZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjME8yelNldUxMWTNNYWVSVzdj
UXJXYnEtNlkyQkhKZyUyQnhfajZuayUzREVDYV9BJTQwbWFpbC5nbWFpbC5jb20/dXRtX21lZGl1
bT1lbWFpbCZhbXA7dXRtX3NvdXJjZT1mb290ZXI8L2E+Jmd0Oy48YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7IEZvciBtb3JlIG9wdGlvbnMsIHZpc2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2ds
ZS5jb20vZC9vcHRvdXQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
Z3JvdXBzLmdvb2dsZS5jb20vZC9vcHRvdXQ8L2E+Ljxicj4NCiZndDsgPGJyPg0KJmd0OyAtLSA8
YnI+DQomZ3Q7IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNj
cmliZWQgdG8gdGhlIEdvb2dsZTxicj4NCiZndDsgR3JvdXBzICZxdW90O0phaWxob3VzZSZxdW90
OyBncm91cC48YnI+DQomZ3Q7IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3Rv
cCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQ8YnI+DQomZ3Q7IGFuIGVtYWlsIHRvIDxh
IGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1k
ZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhv
dXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsuPGJyPg0KJmd0OyBU
byB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0PGJyPg0KJmd0OyA8YSBocmVm
PSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUy
QktoYzM2c1A3QUJFc1I1QnAlMkJncHRzMERVQkVOcVY2ZUZEUGF6ZnM1a1JfUVJHYXclNDBtYWls
LmdtYWlsLmNvbSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9ncm91
cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0ElMkIlMkJLaGMzNnNQN0FCRXNS
NUJwJTJCZ3B0czBEVUJFTnFWNmVGRFBhemZzNWtSX1FSR2F3JTQwbWFpbC5nbWFpbC5jb208L2E+
PGJyPg0KJmd0OyAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lk
L2phaWxob3VzZS1kZXYvQ0ElMkIlMkJLaGMzNnNQN0FCRXNSNUJwJTJCZ3B0czBEVUJFTnFWNmVG
RFBhemZzNWtSX1FSR2F3JTQwbWFpbC5nbWFpbC5jb20/dXRtX21lZGl1bT1lbWFpbCZhbXA7dXRt
X3NvdXJjZT1mb290ZXIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
Z3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjMzZzUDdB
QkVzUjVCcCUyQmdwdHMwRFVCRU5xVjZlRkRQYXpmczVrUl9RUkdhdyU0MG1haWwuZ21haWwuY29t
P3V0bV9tZWRpdW09ZW1haWwmYW1wO3V0bV9zb3VyY2U9Zm9vdGVyPC9hPiZndDsuPGJyPg0KJmd0
OyBGb3IgbW9yZSBvcHRpb25zLCB2aXNpdCA8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUu
Y29tL2Qvb3B0b3V0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dy
b3Vwcy5nb29nbGUuY29tL2Qvb3B0b3V0PC9hPi48YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQoN
CjxwPjwvcD4KCi0tIDxiciAvPgpZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91
IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICZxdW90O0phaWxob3VzZSZxdW90
OyBncm91cC48YnIgLz4KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJl
Y2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86
amFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIj5qYWlsaG91c2UtZGV2
K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+LjxiciAvPgpUbyB2aWV3IHRoaXMgZGlz
Y3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5j
b20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjMTNudWFoYm9nX1dWRC1CSmkwYXNI
RWE4VHhNQXZCNU01ZGFtSkdKXzVpbkElNDBtYWlsLmdtYWlsLmNvbT91dG1fbWVkaXVtPWVtYWls
JnV0bV9zb3VyY2U9Zm9vdGVyIj5odHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFp
bGhvdXNlLWRldi9DQSUyQiUyQktoYzEzbnVhaGJvZ19XVkQtQkppMGFzSEVhOFR4TUF2QjVNNWRh
bUpHSl81aW5BJTQwbWFpbC5nbWFpbC5jb208L2E+LjxiciAvPgpGb3IgbW9yZSBvcHRpb25zLCB2
aXNpdCA8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2Qvb3B0b3V0Ij5odHRwczov
L2dyb3Vwcy5nb29nbGUuY29tL2Qvb3B0b3V0PC9hPi48YnIgLz4K
--000000000000cb63c8058b257a6d--
