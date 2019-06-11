Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBNFPQDUAKGQE37WWMSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3d.google.com (mail-vs1-xe3d.google.com [IPv6:2607:f8b0:4864:20::e3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD6541695
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 23:05:58 +0200 (CEST)
Received: by mail-vs1-xe3d.google.com with SMTP id w76sf4692482vsw.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 14:05:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560287157; cv=pass;
        d=google.com; s=arc-20160816;
        b=B2O07IY+S6iIijB2TTMFp3vRPEhX7ncet3rZqSjBfAp2LQN7Uyun5NFeiXZgHdsRNN
         9O80CWyVwAA8zMtonnKyTMZcm+4Fmpy+8mAYRoXXjx6939W6ziPYeGvvxF1AYQiuCx7w
         8vDxstA6jTtgA9x15fBDIrAzyguuCBF3JC5xsZrs+GceCYoF5mrgtx2M6pXuqPvwwo9K
         Rr0E4sSXarQGSPAnP8n4sPQDP7Cps0s42jnxAAZvV9uW3/q9O24xLiHxp5EqT7n3cxik
         Y+/US1U36qklFkAmskmJJpph/9KAHGZN+oHrUnZgTZ8BCMri+AgGGQER8HxzJI7oe+5v
         NaGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=hTeh5sAxVYTciqmQ7RG4TNvltGRk/caV6sTGC8Z3k2g=;
        b=dQWjFwj30wPAlqv6SsVUq28W9YadevZWhdNldJENGCqHKWfEbbsuIVvaA+vNYOy1BW
         p5NDZ8v0xanEFjCmhTGPoF8s0f6oB9zy9wiigxF8PArsUXCc2ITykcWYNDeCL/TKu+2a
         yNC5/PJlQaSS97THRMxzdAE4gRT26SPqZaLFXJIR1mPVWcjOydJzOPJ6o0vJ9NGb569Y
         iqfASkQhk+TGngXbmAgwQI5jjF2xomYwhe2ZV/oLwdqbVWEpuwfPED3qs+rLf67cvB/Y
         k0ez7NjL/re1CrrCmF54zLIVRESM499PFJfVyOxeFDPwfJTc+7BdjGBQQPeJP1DlhAIx
         7RCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cO2p2gaq;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::72a as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hTeh5sAxVYTciqmQ7RG4TNvltGRk/caV6sTGC8Z3k2g=;
        b=cqhAVf48APAZxWUCxU04cOoAcGcrV37QnhfVn55LDWcioTVrXGf06HlpxfbHQzcK3j
         nQI74SjKft+Uu5bW++A2gxn6v9LxfoloVRutigINd722WZ+4vHAsGu6apnqBOvdOa6Ge
         Wfxtja4Dfyb2OlVPZtBM/IlxwYmkQ765XzRC4FS13ev/tgU5iBCET2ARfxg0a4z0dCZw
         FvepW7Y/bA8O0j/0DiIRFa9aCb8xA9fruNoa6sqvaKPlacoftkXqzp5fJn41BXoAuYBq
         kaDnwALg6MdGRgWwUNaJ8QKu9XaGvrtiZPNANtOZaMdFOcmZqyiAMGFvmmE6tv/DBWde
         Qq2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hTeh5sAxVYTciqmQ7RG4TNvltGRk/caV6sTGC8Z3k2g=;
        b=pHw/xaDbaYOWqj8gaWk7TvuPAqXNgiHmFp1BRXb1Y/Q5RDl7JyG6atsshTU0/KBWck
         GsVEn6nC2vZYGS8BZkSnIjnuoUGj5+CkonNuFgVnMawwZvzJuFD0C0DiWa4+IC+FSH9m
         PkK0CMPln5cbEbvAMZnQkmxasN7/m/8jRUGc7xbjyg6/zcxwE04zItKPyytsOdVmimnf
         MZdhxS2uXTBGyq/kXa07Ll2c0AgUbwt0OsKsZTCA0ujKErfocCMNgmEqbmKLhYWq6k5H
         Crc0ZJ9qErm7dzCdgGgRwxbff0yQHLR6s3T2FFZPHiEDcWcXud0bOznQ2jRo9GJOv0TH
         8z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hTeh5sAxVYTciqmQ7RG4TNvltGRk/caV6sTGC8Z3k2g=;
        b=UkFzQfg2W9F2dKI43oecgm6LvqTtZCGo10eDkMn6O3eLwV5qr/+MCd1bIwA0n5+Z7l
         oBZ19086bmfkJRlUpK7snpPqXd+3eldqe+pyoWfzu0FG3sgrfoyQmFKAe3GOkRRS5+3T
         mwi+OPla/U8p2GpxuJnxAOfifQdPaUGY7adNptojuZ7QSpH+6AsjRFz9g74MANv1gcsZ
         jzMGR7OQKRdsws1eyQLiSJFU0PeKwstAr/cWNTRRT79xho8h69Hlo7iiq3ukdTXvS6yO
         WOkQnScbzX24FaXeIXU/p+WUAbU72IfUaHE6yRJoV6F1mksw89LHDf8Zilisn+aa2Vx+
         Hqkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXDyEkt3tHCUu9VOoLyrbRARogj6NArFrMAEEiWRvIUgN9ICqsv
	b3xbe2Of/2eFhXS0GUVu5J8=
X-Google-Smtp-Source: APXvYqwMAYiG26OSOSOgY6aXCbV/Mp4B66MCqQy1BVntBE4Lq5/7QQxlYfZvXcQL3ePoBfQqDIWdug==
X-Received: by 2002:ab0:3109:: with SMTP id e9mr8484170ual.66.1560287157030;
        Tue, 11 Jun 2019 14:05:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:eec4:: with SMTP id o4ls3318vsp.11.gmail; Tue, 11 Jun
 2019 14:05:56 -0700 (PDT)
X-Received: by 2002:a67:ee5b:: with SMTP id g27mr8751177vsp.165.1560287156550;
        Tue, 11 Jun 2019 14:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560287156; cv=none;
        d=google.com; s=arc-20160816;
        b=VptEDZyC8WrCON5d6uSqRqiAc4hiT11JTO3SFf3/QyuYBn+k2/ewfr+R0LFidihRxA
         Y391F2Un73JCkMcEa60zmD8hrCC7P4jkJcLxeTJU+s+Ba+lZTqJ1i8HQBJ5fIfdGvZ6T
         5KX7V+nqTm0bHEXFhPVdGudxwc15JtAl8vP5/8pcg79briQOMrtosp+QZaQRaAE17M/L
         R9GdRKd8JPS9F6OxsOCCpG3/gEIS7m5tffqwip5PEQcoBW6R6S8oAidHE2HexBETle5w
         c5VqxPFm3pRmbbOFXiysa4ga+ir6nbwNsIHguofUoR8ml0BjdqYRDSQ18ILc+00ew3e9
         9tAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DFIbA9Te08/HlfDKwiGWomxLuXuSFuTqwES5sWtTBzA=;
        b=pxgY0O9/KF3htabZ/PbVdhVI+Nl/zIBZn83ir3UGc2hPOOgep1gx4ktlWUrZkOYyXh
         hwxxgT3O4WyhzKLC7Zdxo7QE+Pmb+fuLI55qM/6at17LuyBxiADSGtxBbSSKUWWb7ig5
         W6YuwrugHcPKzpsFxSAtReHBcv6UXQ+MkZaW7LpUU2yaKT80Cgla4vPmW28ZPiQmzoTv
         ue0sOIsrNocJMsPNOQEemiPHEoGDmGEZbFScejh5VO4dA8EUmL0T5NFmZo80hJkVBj3j
         VbFjrIeh7yysieR0Vf2v/1WdkPk4HzAkW/OGRuQxgj0HY7vdNxGyvFL9XJV+bI/TwFwI
         6YUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cO2p2gaq;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::72a as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com. [2607:f8b0:4864:20::72a])
        by gmr-mx.google.com with ESMTPS id 8si738774vkj.4.2019.06.11.14.05.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 14:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::72a as permitted sender) client-ip=2607:f8b0:4864:20::72a;
Received: by mail-qk1-x72a.google.com with SMTP id l128so8624837qke.2
        for <jailhouse-dev@googlegroups.com>; Tue, 11 Jun 2019 14:05:56 -0700 (PDT)
X-Received: by 2002:a37:4b56:: with SMTP id y83mr19010017qka.338.1560287156173;
 Tue, 11 Jun 2019 14:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de> <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de> <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de> <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
In-Reply-To: <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
From: Wayne <racedrive1503@gmail.com>
Date: Tue, 11 Jun 2019 17:05:44 -0400
Message-ID: <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
Content-Type: multipart/alternative; boundary="000000000000b100e2058b12a93f"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=cO2p2gaq;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::72a
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

--000000000000b100e2058b12a93f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jan/Ralf,

I was able to get past issues 1 and 3 above by using Jan's kernel config
from this thread:

https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$20t=
o$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAA=
J
".

The DMA issue was resolved by disabling kernel option CONFIG_ISA_DMA_API as
stated in another thread, and reflected in the config file above.

So now I think i've almost got the non-root linux booting.  I'm stuck at
the point where its trying to mount a filesystem and since i'm not
providing an initramfs it panics.

Similar to the output below:

[ 1.080178] VFS: Cannot open root device "(null)" or unknown-block(0,0):
error -6
[ 1.087662] Please append a correct "root=3D" boot option; here are the
available partitions:
[ 1.096013] Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

I have just a couple more questions:
1. In general, is it true that an inmate will takeover control from the
root of any resource in the following arrays, or are there some cases where
they get "shared" between the root and inmate?
     A. ".mem_regions" -> Shared?
     B. ".irqchips" -> Shared?
     C. ".pio_bitmap" -> Inmate takes control of these if matching between
inmate and root
     D. ".pci_devices" -> Inmate takes control?
     E. ".pci_caps" -> Inmate takes control?

2. Along the same lines, going back to my ttyS0 issue mentioned above while
trying to share it:

       If I allocate the following to the linux non root cell (and set to
-1 in the root)
     .pio_bitmap =3D {
          [0x3f8/8 ... 0x3ff/8] =3D 0x00   /* serial 2*/
       }

       Then on the root cell I randomly get a PIO read fault on "0x3FE"
when the non-root is booting, i'm not sure what process is causing this.

       if I leave out the pio mapping in the non-root linux, and alolothat
block in the root cell instead then the non-root linux gets a PIO read
fault on "0x3F9" while booting.
       Ralf mentioned that Linux would not try enumerate the device if its
set to -1 ( [0x3f8/8 ... 0x3ff/8] =3D -1)  , but the non-root seems to
attempt to do something with it anyway:

"[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled"
"FATAL: Invalid PIO read, port: 3f9: size 1"

       Is it possible to map the same pio block in both the root and
non-root with a different mask?  Or does the non-root just override it?  It
seems like the latter is true.

Thanks again Jan and Ralf for your help getting to this point.


On Tue, Jun 11, 2019 at 2:13 PM Wayne <racedrive1503@gmail.com> wrote:

> Jan & Ralf:
>
> I have a little good news, I have successfully gotten the non-root linux
> to display some startup output based on your suggestions.  Also, there mu=
st
> have been some small difference between the stock linux-x86-demo cell
> config and the one I tweaked.  I went back to the original and made some
> minor changes and it started displaying the serial output now for the
> non-root node.
>
> I ended up making the root cell the primary user of the ttyS0 device, and
> just having the non-root linux output to the hypervisor virtual console
> (console=3Djailhouse).  In my setup, there appears to be some process sti=
ll
> attempting to use the ttyS0 randomly on the root linux, and that causes t=
he
> hypervisor to halt it if I don't leave it in the PIO array.  Not sure who
> is doing it.
>
>
> This is where i'm at now.  The non-root linux keeps running into points
> where it tries to access PIO and gets parked:
>
> 1. First crash:
>
> [    0.424925]kworker/u6:0 (27) used greated stack depth: 14656 bytes lef=
t
> [    0.425807]futex has table entries: 1024 (order: 4, 65536 bytes)
> "FATAL: Invalid PIO write, port: 70: size 1"
> ...
> Parking CPU 3 (Cell: "linux-x86-demo")
>
> According to /proc/ioports, 70 has to do with the Realtime clock (rtc0).
> I was able to temporarily add the 70 mapping to the non-root linux, but
> should it be there at all?  I tried to disable RTC support in the guest
> kernel config.
>
>
> 2. On the next attempt, I then got further with a crash trying to
> initialize Ser device ttyS0:
>
> "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled"
> "FATAL: Invalid PIO read, port: 3f9: size 1"
> ...
> Parking CPU 3 (Cell: "linux-x86-demo")
>
> I can get around that if I allow the non-root access in its pio table, bu=
t
> then I have a problem above with the root linux randomly trying to use it=
.
>
>
> 3. Now with the temporary adjustments to the non-root pio table above I
> get here:
>
> "[    0.972399]clocksource:Switched to clocksource tsc"
> "FATAL: Invalid PIO read, port: 87: size 1"
> ...
> Parking CPU 3 (Cell: "linux-x86-demo")
>
> According to proc/ioports this one has to do with "dma page request". It
> isn't mapped in my root linux PIO or non-root linux array.
>
>
> Aside from the serial conflict, it seems like these should remain
> controlled by the root linux or hypervisor.   Do you use a particular bar=
e
> minimum x86 kernel config on your machine for the guest to get around
> these?  I know Jan mentioned the jailhouse-images project might have
> something, but I couldn't find it digging around quick.
>
> Thanks to you both for your responses and patience.  I got the root linux
> up and going on my own, but the non-root guest is proving to be more
> difficult.
>
> Wayne
>
>
>
> On Tue, Jun 11, 2019 at 11:31 AM Ralf Ramsauer <
> ralf.ramsauer@oth-regensburg.de> wrote:
>
>> Hi,
>>
>> On 6/10/19 7:45 PM, Wayne wrote:
>> > Thank you for your responses Ralf and Jan.
>> >
>> > Yes, I have successfully gotten both the apic-demo and tiny-demo cells
>> > to work on my system before attempting to load the non-root linux.  I
>> > can see serial output from them.
>> >
>> > However, if I try to share the UART between root and inmate for them I
>> > run into a crash on the hypervisor if the root linux attempts to write
>> > to the UART (after creating/starting a demo).  Does the root linux los=
e
>> > access once an inmate is created/started?  Or am I missing something
>> > from my System config or tiny-demo config that allows them to share?  =
I
>> > attached the crash in hypervisor_output.txt.
>> >
>> > Also, I noticed the tiny-demo output on the UART gets mirrored on the
>>
>> Yes, according to your config, JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is
>> set. This means that the guest will use the virtual console. The virtual
>> console uses the hypervisor output which depends whatever is set in your
>> system configuration. In your case the hypervisor uses 3f8.
>>
>> And additionally, the inmate also a valid .console set. Again, 3f8. This
>> means, it will use the console *and* the hypervisor debug hypercall. In
>> your case, both outputs are routed to the same device which explains the
>> mirroring.
>>
>> > Jailhouse virtual console.  Does that mean that its writing to the
>> > serial through the hypervisor and not directly accessing ttyS0 itself?
>>
>> Exactly.
>>
>> > If so, is there a way to create the cell to write ttyS0 directly as a
>> > test?  To see if it exhibits same behavior as the non-root linux.
>>
>> Sure, simply align the .address field of .console, and allow access to
>> that port via .pio_bitmap.
>>
>> >
>> > FYI, I create the tiny-demo like this:
>> >
>> > jailhouse cell create configs/x86/tiny-demo.cell
>> > jailhouse cell load tiny-demo inmates/demos/x86/tiny-demo.cell
>> > jailhouse cell start tiny-demo
>> >
>> > Going back to my original non-root linux question, I don't see any
>> > output when connected over ttyS0.  Its address is 0x3f8 ("serial 1") i=
n
>> > the PIO, and that seems to work fine for the other simple demos, minus
>> > the hypervisor crash issue above when sharing.  I know there is the
>> > other "serial 2" port but I haven't tried to use that one.
>>
>> I see that port on our Dell server as well. It's present, but I don't
>> know where it's connected to.
>>
>> Let me just summarise your issue:
>>
>> You only have one serial line available, right? From the root-cell's
>> POV, it's ttyS0 on 3f8.
>>
>> I would propose to share ttyS0 between the hypervisor and non-root
>> Linux. This means:
>>
>>   - Don't let the root-cell use ttyS0. Remove any console=3DttyS0
>>     parameters from you commandline. Ensure that noone else accesses
>>     ttyS0 (e.g., getty@ttyS0 or other friends)
>>
>>   - Set 3f8 as debug_console in your master.c (seems you already have)
>>
>>   - Allow 3f8 access in the linux-demo.c (already set in the default
>>     linux-demo
>>
>>   - Disallow 2f8 access in linux-demo.c:
>> -               [ 0x2f8/8 ...  0x2ff/8] =3D 0, /* serial2 */
>> +               [ 0x2f8/8 ...  0x2ff/8] =3D -1, /* serial2 */
>>
>>     I don't know how Linux enumerates serial devices, but this ensures
>>     that Linux won't see the unconnected serial line and map ttyS0 to
>>     3f8
>>
>> >
>> > non root linux launched with:
>> > /tools/jailhouse cell linux configs/x86/linux-x86.cell
>> > /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
>>
>> Then, this should actually work...
>>
>> And if not, then console=3Djailhouse0 should work.
>>
>> >
>> > I can try the 4.19 siemens kernel and "next" branch for jailhouse you
>> > suggested.  Do you think that combination will resolve the missing
>> > serial for the non-root linux?  Otherwise, did my kernel config, syste=
m
>> > config, and non-root linux cell configs look OK?
>>
>> I didn't look at it, but we should at least - even if some flags are
>> still incorrect - see the "Uncompressing kernel..." thing.
>>
>> Wait -- one thing you could try: Deactivate CONFIG_EFI and especially
>> CONFIG_EFI_STUBS. I'm not sure, but it could be that EFI_STUBS change
>> the header format that our bootloader patches.
>>
>> >
>> > Thanks again for your help.
>>
>> No problem. But it's not yet working. ;-)
>>
>>   Ralf
>>
>> >
>> >
>> > On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsauer
>> > <ralf.ramsauer@oth-regensburg.de
>> > <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>> >
>> >     Hi Wayne,
>> >
>> >     On 6/7/19 10:04 PM, Wayne wrote:
>> >     > Hi Ralf,
>> >     >
>> >     > Thank you for your responses.  I have attached the requested
>> config
>> >     > files.  I am now just trying to use the same bzImage for the roo=
t
>> and
>> >     > the non-root linux node.
>> >
>> >     One question that you didn't answer: do apic-demo or tiny-demo wor=
k?
>> >     They need to to have correct .console parameter set, so ensure tha=
t
>> >     parameters are set if you run those demos in your linux-demo cell.
>> Just
>> >     compare it to tiny-demo.c or apic-demo.c
>> >
>> >     >
>> >     > Yes, I am using vanilla 4.16 because the documentation indicated
>> >     that it
>> >     > is the first mainline release to officially support Jailhouse
>> Guest
>> >     > images.  Do you suggest that I use something else?
>> >
>> >     As Jan already wrote: Try to use Siemens' 4.19 branch.
>> >
>> >     >
>> >     > Right now i'm just trying to get some serial output from the
>> non-root
>> >     > Linux.  Hopefully, I have that configured correctly.  Ideally, I
>> would
>> >     > like to share the same serial console for the Root node and
>> non-root
>> >     > node eventually if possible.  I have been OK with using the
>> virtual
>> >     > console (jailhouse console -f) for the Hypervisor output.
>> >
>> >     In addition to Jan's comment:
>> >
>> >     Currently you only have access to the jailhouse console via
>> 'jailhouse
>> >     console' from your root cell. Imagine your root cell crashes for
>> some
>> >     reason. You will never see the fault reason, which makes things
>> hard to
>> >     debug.
>> >
>> >     I would suggest to configure the hypervisor to use the serial
>> console.
>> >     You can share the device with the non-root Linux, that's no proble=
m.
>> >
>> >     In this case, the non-root kernel's output will always be printed
>> to the
>> >     serial console. Directly, if you choose console=3DttySx, and
>> indirectly
>> >     via the hypervisor if you choose console=3Djailhouse.
>> >
>> >     BTW: According to your config, your system is a PowerEdge, and the
>> >     non-root cell gets both, 0x2f8 and 0x3f8. Are you sure that ttyS1
>> is the
>> >     correct console that you are connected to?
>> >
>> >     Just mentioning this as we have a similar machine here, and, afair=
,
>> both
>> >     platform serial device are 'usable', but one ends in the nirvana
>> while
>> >     it is accessible.
>> >
>> >     Ah, and one last thing: try to switch to the current next branch f=
or
>> >     jailhouse. Jan just integrated a few patches from me that might
>> also be
>> >     relevant for your machine.
>> >
>> >     HTH
>> >       Ralf
>> >
>> >     >
>> >     > Wayne
>> >     >
>> >     > On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsauer
>> >     > <ralf.ramsauer@oth-regensburg.de
>> >     <mailto:ralf.ramsauer@oth-regensburg.de>
>> >     > <mailto:ralf.ramsauer@oth-regensburg.de
>> >     <mailto:ralf.ramsauer@oth-regensburg.de>>> wrote:
>> >     >
>> >     >     Hi,
>> >     >
>> >     >     On 6/7/19 2:28 PM, Wayne wrote:
>> >     >     > Hello,
>> >     >     >
>> >     >     > I am new to Linux development and Jailhouse.  I have
>> >     successfully
>> >     >     booted
>> >     >     > the Jailhouse Hypervisor and root cell on a bare metal X86
>> Linux
>> >     >     system
>> >     >     > (No QEMU).  I am now trying to load a non-root Linux cell
>> >     and I have a
>> >     >     > few questions.  Jailhouse accepts and starts my non-root
>> >     linux cell
>> >     >     > configuration and I see it as "running" through the
>> >     "jailhouse cell
>> >     >     > list" command.  However, I don't see any serial output fro=
m
>> the
>> >     >     > "non-root linux" cell booting up.  I=E2=80=99m not sure wh=
at the
>> >     non-root node
>> >     >     > is doing at this point.
>> >     >
>> >     >     Ok, first of all, can you see any output from Jailhouse's de=
mo
>> >     inmates
>> >     >     (e.g., tiny-demo or apic-demo)?
>> >     >
>> >     >     >
>> >     >     >                My root node is a 4.16 kernel configured th=
is
>> >     way:
>> >     >     >                               1. CONFIG_JAILHOUSE_GUEST is
>> >     not set
>> >     >     >                               2. CONFIG_SERIO=3Dy
>> >     >     >                               3.
>> >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>> >     >     >
>> >     >     >                My non-root node is a 4.16 kernel configure=
d
>> >     this way:
>> >     >     >                               1. CONFIG_JAILHOUSE_GUEST=3D=
y
>> >     >     >                               2. CONFIG_SERIO=3Dm (can't s=
eem
>> >     to disable
>> >     >     > completely in my config for 4.16)
>> >     >     >                               3.
>> >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1
>> >     >
>> >     >     Could you please provide a full .config? What branch are you
>> >     exactly
>> >     >     using? Vanilla 4.16?
>> >     >
>> >     >     Please attach your system config and your non-root linux
>> >     config as well.
>> >     >
>> >     >     You may also want to try https://github.com/siemens/linux .
>> See
>> >     >     jailhouse-enabling branches for some releases.
>> >     >
>> >     >     >
>> >     >     > In general, do the kernel config settings have to match
>> between
>> >     >     the root
>> >     >     > node and non-linux or is the above fine?
>> >     >
>> >     >     No, they do not have to be the same, but they can. Still, an
>> >     analysis
>> >     >     requires your .config.
>> >     >
>> >     >     >
>> >     >     > The vmlinux-4.1.16-Guest bzImage is approx 7MB, and the
>> >     inmate node is
>> >     >     > allocated ~75MB of RAM.
>> >     >     >
>> >     >     > I have a single UART, so I have configured the root cell
>> >     system config
>> >     >     > to output to the virtual hypervisor console:
>> >     >
>> >     >     Wait... You configured your root-cell to use the hypervisor
>> debug
>> >     >     console? How? It's only available once the hypervisor is
>> >     enabled. How
>> >     >     should this work?
>> >     >
>> >     >     But let's have a look at your configuration first.
>> >     >
>> >     >     So you want to:
>> >     >       - Have the UART (0x3f8) available in the non-root cell
>> >     >       - Use 0x3f8 as hypervisor debug console as well
>> >     >       - No console for root-cell
>> >     >
>> >     >     Did I get this right?
>> >     >
>> >     >       Ralf
>> >     >
>> >     >     >
>> >     >     > .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>> >     >     >
>> >     >     > .debug_console =3D {
>> >     >     > .type =3D JAILHOUSE_CON_TYPE_NONE,
>> >     >     > },
>> >     >     >
>> >     >     > and I have configured the non-root linux cell to output to
>> >     the UART:
>> >     >     >
>> >     >     > (Added serial 0x3f8 to pio bitmap for non-root linux) and
>> >     started the
>> >     >     > node with this:
>> >     >     >
>> >     >     > ./tools/jailhouse cell linux configs/x86/linux-x86.cell
>> >     >     > /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
>> >     >     > (Note I also tried "console=3Djailhouse" in the command ab=
ove,
>> >     and that
>> >     >     > produces the same result)
>> >     >     >
>> >     >     > I then see the following on my hypervisor console
>> >     (./tools/jailhouse
>> >     >     > console -f):
>> >     >     >
>> >     >     > Created cell "linux-x86-demo"
>> >     >     > ...
>> >     >     > Cell "linux-x86-demo" can be loaded
>> >     >     > Started cell "linux-x86-demo"
>> >     >     >
>> >     >     > After a little while I do get a parked CPU error on the ro=
ot
>> >     node,
>> >     >     looks
>> >     >     > like its trying to do something with the UART as well:
>> >     >     > FATAL: Invalid PIO read, port: 3fe size: 1
>> >     >     >
>> >     >     > I would expect something to pop out on the UART from the
>> >     non-root
>> >     >     linux
>> >     >     > node first.  Note that root node has serial 0x3f8 disabled
>> >     in its pio
>> >     >     > bitmap.
>> >     >     >
>> >     >     > I verifed that the UART is functioning by allowing the
>> >     hypervisor to
>> >     >     > print to it and also performed an echo test over ttyS0.
>> >     >     >
>> >     >     > I have tried several configurations of kernel.....includin=
g
>> your
>> >     >     current
>> >     >     > "queues/jailhouse" branch head kernel for the non-root nod=
e,
>> >     along
>> >     >     with
>> >     >     > the kernel config for 4.7 posted in this thread below (but=
 I
>> >     get same
>> >     >     > result as above when I start it, no kernel output):
>> >     >     >
>> >     >     >
>> >     >
>> >       "
>> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$=
20to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuM=
BAAJ
>> ".
>> >     >     >
>> >     >     > Any information you can provide to me will be helpful.  I'=
m
>> >     not sure
>> >     >     > what might be going wrong here.
>> >     >     >
>> >     >     > Thanks,
>> >     >     > Wayne
>> >     >     >
>> >     >     > --
>> >     >     > You received this message because you are subscribed to th=
e
>> >     Google
>> >     >     > Groups "Jailhouse" group.
>> >     >     > To unsubscribe from this group and stop receiving emails
>> >     from it, send
>> >     >     > an email to jailhouse-dev+unsubscribe@googlegroups.com
>> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>> >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
>> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
>> >     >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>> >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
>> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>>.
>> >     >     > To view this discussion on the web visit
>> >     >     >
>> >     >
>> >
>> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0hu=
h5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
>> >     >     >
>> >     >
>> >      <
>> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0hu=
h5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&utm=
_source=3Dfooter
>> >.
>> >     >     > For more options, visit https://groups.google.com/d/optout=
.
>> >     >
>> >
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%4=
0mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--000000000000b100e2058b12a93f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Jan/Ralf,<div><br></div><div>I was able to get past issues=
 1 and 3 above by using Jan&#39;s kernel config from this thread:</div><div=
><br></div><div><a href=3D"https://groups.google.com/forum/#!searchin/jailh=
ouse-dev/Re$3A$20Failed$20to$20boot$20jailhouse%7Csort:relevance/jailhouse-=
dev/M7UO89XFIk0/Qi40DDuMBAAJ" target=3D"_blank">https://groups.google.com/f=
orum/#!searchin/jailhouse-dev/Re$3A$20Failed$20to$20boot$20jailhouse%7Csort=
:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAAJ</a>&quot;.=C2=A0</div><di=
v><br></div><div>The DMA issue was resolved by disabling kernel option=C2=
=A0CONFIG_ISA_DMA_API as stated in another thread, and reflected in the con=
fig file above.<br></div><div><br></div><div>So now I think i&#39;ve almost=
 got the non-root linux booting.=C2=A0 I&#39;m stuck at the point where its=
 trying to mount a filesystem and since i&#39;m not providing an initramfs =
it panics.</div><div><br></div><div>Similar to the output below:</div><div>=
<br></div><div>[ 1.080178] VFS: Cannot open root device &quot;(null)&quot; =
or unknown-block(0,0): error -6 <br>[ 1.087662] Please append a correct &qu=
ot;root=3D&quot; boot option; here are the available partitions: <br>[ 1.09=
6013] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-b=
lock(0,0)<br></div><div><br></div><div>I have just a couple more questions:=
</div><div>1. In general, is it true that an inmate will takeover control f=
rom the root of any resource in the following arrays, or are there some cas=
es where they get &quot;shared&quot; between the root and inmate?</div><div=
>=C2=A0 =C2=A0 =C2=A0A. &quot;.mem_regions&quot; -&gt; Shared?</div><div>=
=C2=A0 =C2=A0 =C2=A0B. &quot;.irqchips&quot; -&gt; Shared?</div><div>=C2=A0=
 =C2=A0 =C2=A0C. &quot;.pio_bitmap&quot; -&gt; Inmate takes control of thes=
e if matching between inmate and root</div><div>=C2=A0 =C2=A0 =C2=A0D. &quo=
t;.pci_devices&quot; -&gt; Inmate takes control?</div><div>=C2=A0 =C2=A0 =
=C2=A0E. &quot;.pci_caps&quot; -&gt; Inmate takes control?</div><div><br></=
div><div>2. Along the same lines, going back to my ttyS0 issue mentioned ab=
ove while trying to share it:</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0If I allocate the following to the linux non root cell (and set to -=
1 in the root)</div><div>=C2=A0 =C2=A0 =C2=A0.pio_bitmap =3D {</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [0x3f8/8 ... 0x3ff/8] =3D 0x00=C2=A0 =C2=
=A0/* serial 2*/</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div><br></div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0Then on the root cell I randomly get a PIO=
 read fault on &quot;0x3FE&quot; when the non-root is booting, i&#39;m not =
sure what process is causing this.</div><div><br></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0if I leave out the pio mapping in the non-root linux, and alol=
othat block in the root cell instead then the non-root linux gets a PIO rea=
d fault on &quot;0x3F9&quot; while booting.=C2=A0 =C2=A0 =C2=A0 =C2=A0</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0Ralf mentioned that Linux would not try en=
umerate the device if its set to -1 (=C2=A0[0x3f8/8 ... 0x3ff/8] =3D -1)=C2=
=A0 , but the non-root seems to attempt to do something with it anyway:<br>=
</div><div><br></div><div>&quot;[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 =
driver, 1 ports, IRQ sharing enabled&quot;<br>&quot;FATAL: Invalid PIO read=
, port: 3f9: size 1&quot;=C2=A0=C2=A0<br></div><div><br></div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Is it possible to map the same pio block in both the ro=
ot and non-root with a different mask?=C2=A0 Or does the non-root just over=
ride it?=C2=A0 It seems like the latter is true.=C2=A0=C2=A0=C2=A0=C2=A0<br=
></div><div><br></div><div>Thanks again Jan and Ralf for your help getting =
to this point.</div><div><br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 11, 2019 at 2:13 PM Wayne &l=
t;<a href=3D"mailto:racedrive1503@gmail.com">racedrive1503@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div>Jan &amp; Ralf:<br><br>I have a little good news, I have suc=
cessfully gotten the non-root linux to display some startup output based on=
 your suggestions.=C2=A0 Also, there must have been some small difference b=
etween the stock linux-x86-demo cell config and the one I tweaked.=C2=A0 I =
went back to the original and made some minor changes and it started displa=
ying the serial output now for the non-root node.<br><br>I ended up making =
the root cell the primary user of the ttyS0 device, and just having the non=
-root linux output to the hypervisor virtual console (console=3Djailhouse).=
=C2=A0 In my setup, there appears to be some process still attempting to us=
e the ttyS0 randomly on the root linux, and that causes the hypervisor to h=
alt it if I don&#39;t leave it in the PIO array.=C2=A0 Not sure who is doin=
g it.<br><br><br>This is where i&#39;m at now.=C2=A0 The non-root linux kee=
ps running into points where it tries to access PIO and gets parked:<br><br=
>1. First crash:<br><br>[ =C2=A0 =C2=A00.424925]kworker/u6:0 (27) used grea=
ted stack depth: 14656 bytes left<br>[ =C2=A0 =C2=A00.425807]futex has tabl=
e entries: 1024 (order: 4, 65536 bytes)<br>&quot;FATAL: Invalid PIO write, =
port: 70: size 1&quot;<br>...<br>Parking CPU 3 (Cell: &quot;linux-x86-demo&=
quot;)<br><br>According to /proc/ioports, 70 has to do with the Realtime cl=
ock (rtc0).=C2=A0 I was able to temporarily add the 70 mapping to the non-r=
oot linux, but should it be there at all?=C2=A0 I tried to disable RTC supp=
ort in the guest kernel config.<br><br><br>2. On the next attempt, I then g=
ot further with a crash trying to initialize Ser device ttyS0:<br><br>&quot=
;[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing en=
abled&quot;<br>&quot;FATAL: Invalid PIO read, port: 3f9: size 1&quot;<br>..=
.<br>Parking CPU 3 (Cell: &quot;linux-x86-demo&quot;)<br><br>I can get arou=
nd that if I allow the non-root access in its pio table, but then I have a =
problem above with the root linux randomly trying to use it.<br><br><br>3. =
Now with the temporary adjustments to the non-root pio table above I get he=
re:<br><br>&quot;[ =C2=A0 =C2=A00.972399]clocksource:Switched to clocksourc=
e tsc&quot;<br>&quot;FATAL: Invalid PIO read, port: 87: size 1&quot;<br>...=
<br>Parking CPU 3 (Cell: &quot;linux-x86-demo&quot;)<br><br>According to pr=
oc/ioports this one has to do with &quot;dma page request&quot;. It isn&#39=
;t mapped in my root linux PIO or non-root linux array.<br><br><br>Aside fr=
om the serial conflict, it seems like these should remain controlled by the=
 root linux or hypervisor.=C2=A0 =C2=A0Do you use a particular bare minimum=
 x86 kernel config on your machine for the guest to get around these?=C2=A0=
 I know Jan mentioned the jailhouse-images project might have something, bu=
t I couldn&#39;t find it digging around quick.<br><br>Thanks to you both fo=
r your responses and patience.=C2=A0 I got the root linux up and going on m=
y own, but the non-root guest is proving to be more difficult.<br><br>Wayne=
<br></div><div><br></div><div><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 11, 2019 at 11:31 AM Ra=
lf Ramsauer &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=
=3D"_blank">ralf.ramsauer@oth-regensburg.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi,<br>
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
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg%2Bx_j6n=
k%3DECa_A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3MaeRW7cQrWbq-=
6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--000000000000b100e2058b12a93f--
