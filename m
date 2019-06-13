Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBM5DRHUAKGQEVZRXOVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCC4436B4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 15:37:57 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id i18sf8892314otl.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 06:37:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560433076; cv=pass;
        d=google.com; s=arc-20160816;
        b=GySTRHQgEVmIRr4mFZU36oWn1YShOvujAzN+g+98UKEAnsDX8R0tG8Pqy0Tm1jzy6A
         nzGCnYa//c7SS00H9T9uHRSNZRhVaBXzNzlZSVg2W+dRInkwVfwBXqfe9sY54JxsMX58
         fZjOU45wN5umdGsdcPESOeljb+oEAIbSPFRWBSN+CseaT4ExQwyWVBAd6GsfRZbDFdkJ
         bMObXVyDxit+cbefzWdWLZVI5TvvRTdJjT3ZF5G9dtyOWP4V1j9Wc6bxAlyJonBSwkOl
         K51KlVfcm9PiLbK2r47U1mGyGbl0DFEi0oYmf+/CsqcxEUpWofZel8rqszyjEQ1aHpSW
         EdpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=bNxwT60WUu6PDEGW4ZoECDRZkKxfqzAg766GMMtzb74=;
        b=XICxqdkhpMmbnmWww9sDNuHWnjaWspPpHpl0zlQsKufOtpxex4WWWETqXuzUhh/gmy
         2ZLvJHo/5CERorKnyUHS3euPf5KIbWIYU3rp+wCDWC8RqChVAGfNSdq1ajAdrNt96xCy
         VJOLOI1BUrg1eBwhtJQ9wIQ0+iBE0T4WaSdB2JZ7YBSInFUINUc2o7T7JM1IwmBmGBVs
         HS3oSuuY9QCEl+4XxBIQzHo8m+W2UXVSCBNFAMy3QzSdD1TUoEJOfJtggDqqE/azsOBy
         aWUlCn6iI05+zUV7SZOUMrHg4TaDHOZaYU5YBQ7Ft3zXim68mG+mTX+El4gtnwosDLR5
         ceFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gb0JjGBy;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::830 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bNxwT60WUu6PDEGW4ZoECDRZkKxfqzAg766GMMtzb74=;
        b=SgKxm0PIecCQ9V+Jwl/g6Z6oU2O2Mfm1jxJ4uhzk3QYJHbZpX9jNdYANEBDTYGGC9E
         40AYJkVymlVOaul/4eyh9lGjwVtFF45bRsXea6Ef1f/aFXeLOUzEPYiPMMLQXyoOA908
         UMWTJmXiGpMhvN66GB8YlA8NqaSFJMMws8aPueonGua0wSp/zpe+V1u4aHKse3w5ROU/
         ZYIVMsX7vt9uPiPf9BpOH6o6jRmIhRptJdZiPw8hQfy14Q6MF+BF/AD8HfqAOKXhaD1g
         XQFE/dfgTqOaCMGRxgEA2tmLRanRkuhVWgrB8i1+jq/quEJRWWKKqbBIrwdAkGxE83hd
         d4LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bNxwT60WUu6PDEGW4ZoECDRZkKxfqzAg766GMMtzb74=;
        b=I2NKOkXahFm9OgcnOQaj1Owe7R5fiIhp1k8icv5D1IlhiPGBIY8YtkkNBVzrtuiR/1
         r23l+m+ftmtRtGWzA/D4bPEG2Jc7IzZykbZ2dYKKic1yf3haBGHc/VP6ccix3dy/upey
         WQwiGprUYF/tCoG0N/TIayDl8hz6znuA7CgCZ4psqGOczdS3SWFoyf5v+6LCweTcDfrZ
         FWvxqsMx5DEVbi9ULJT5sNCTqR8GJs2IFl+FgIBbj5yleZW2hF3REuPqsgU8foZMzmMR
         hadTTAdh6wSWbtQuzW3AxxGpnnVMI/DM107ljTmT5yJi++8pmNMqUSDf/PaaXDFsJSI2
         cp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bNxwT60WUu6PDEGW4ZoECDRZkKxfqzAg766GMMtzb74=;
        b=El5Tiyg0PkqKqv5xPfbApZhK1k+fahflIe4V7wLL08NldnH02b6nOXpK1EqFJoC8MA
         qiDWeeO4VQ61AUc2QA2M3HHtk4vMo5ZtNIMFtT/qdpKueASOBpzp0VkrxGT9hchXeIgs
         1TPnScj1oQhxExbPFHJwg5q9exNA/ju4J6Uz0yeKBli6EJEgZ87ngbnkWQp8jcmTqohh
         hlDIwIaW2E/RTO7XHnAyEuowD7JZwDcPAleLxVCsmygnnEGjwMd/OFRqydkyeFELJSbK
         QQn+d5pGxpvMorZ0mHXBtH4AWZPP4R9/bFdANztbaP23egT3NNyh+dPJv+wJ8sgMhz5I
         XciQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVaykcy/C+NyI06mwBqE7O1L1uMbgOcnuUkJjFyCs+j8kBpvmoX
	D9pt1l4ivRXOR5T0jWueNpQ=
X-Google-Smtp-Source: APXvYqw1bMtCfy3wf/bGwbg4zk/ROZt4zoeJbtOaK4I+D3B10OvUZTGKt9dEMeho5NzMNVeu2qkZmw==
X-Received: by 2002:aca:f40b:: with SMTP id s11mr3065281oih.152.1560433075689;
        Thu, 13 Jun 2019 06:37:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:60d7:: with SMTP id b23ls1074184otk.14.gmail; Thu, 13
 Jun 2019 06:37:55 -0700 (PDT)
X-Received: by 2002:a9d:69c2:: with SMTP id v2mr9144853oto.22.1560433075112;
        Thu, 13 Jun 2019 06:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560433075; cv=none;
        d=google.com; s=arc-20160816;
        b=hrz87qTcfLkwU9V48D+1RBgBLQuiEtbQIXrZ9vkbx0EJKrRMc0lil1iv4wpMGloj8G
         Hy6VAGjfJi4JiXAyCWhwoVop5xUCk9jGEPJJKm9xS+GHYJoqzTmfAiLJAGFaEpt3A9SY
         pESb+ONbJJ+qjIEJACAZG0WlQXVrj1rypoSs6Mya4fx08PifWrZDHHlWhO4yWPqgKhRQ
         3rE6lRIyCjS2Ow1dx+RsviinAQ8nmRQ27pJ2bGpV+JQxSsrp77SU+8aJnJrfbAM58opk
         a6BQgJCoO6TH7bJ3A0Me61arVXigW83xeEpdIqSCkbwSYq7nqp4E3fUykURBVS4bNpuW
         ZhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ug74u7ScQloErmbV6nfJZmAp8GYfRqizAuDvZYYrrI8=;
        b=QyNQiZh9e/FqJ/Dqsr1naxgZWClwjRP3PLK0e5bJE2YzrmVqNzyrMDBkpTcZYuXgIO
         bbPeJyBBMWKCZ2gqkhck6E/ruL9YATL307Vti2Rbr/36KRkXAEwIDPlHYuNvqpneUkBt
         lRF+VoJyLdNH+4sbc8efsYsVlTrfsgKWjM68K8EsAhaObujg7WyMxRVJTcHTlIaDciZd
         IofC7sKTNQutZgVXu+5RcADk0OlsyhPteAV52hQ+7MxnCkf2XVwO1eq0Oy8yDcVADlEo
         wWp7VZ+pkG+Eaj8Fp08dEoG0v98L8uQBJrVXma+JxeLPKr5Sil2YowKsYeOtKuSl1fgp
         DETA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gb0JjGBy;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::830 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com. [2607:f8b0:4864:20::830])
        by gmr-mx.google.com with ESMTPS id e25si163215otf.3.2019.06.13.06.37.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 06:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::830 as permitted sender) client-ip=2607:f8b0:4864:20::830;
Received: by mail-qt1-x830.google.com with SMTP id d23so22553547qto.2
        for <jailhouse-dev@googlegroups.com>; Thu, 13 Jun 2019 06:37:54 -0700 (PDT)
X-Received: by 2002:aed:2a85:: with SMTP id t5mr54661475qtd.26.1560433074288;
 Thu, 13 Jun 2019 06:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de> <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de> <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de> <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
 <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
 <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de> <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
 <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de> <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de>
In-Reply-To: <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de>
From: Wayne <racedrive1503@gmail.com>
Date: Thu, 13 Jun 2019 09:37:42 -0400
Message-ID: <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
Content-Type: multipart/alternative; boundary="00000000000016be8f058b34a3a1"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=gb0JjGBy;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::830
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

--00000000000016be8f058b34a3a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan:

In the example that you pointed me to below, how did you create the
rootfs.cpio image?  Is that considered an initrd or an initramfs?

jailhouse cell linux /etc/jailhouse/linux-x86-demo.cell /boot/vmlinuz* \
                     -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                     -c "console=3DttyS0 8250.nr_uarts=3D1 ip=3D192.168.19.=
2"

(From
https://github.com/siemens/jailhouse-images/blob/master/recipes-core/custom=
izations/files/.bash_history-qemu-amd64
)

Thanks,

Wayne

On Wed, Jun 12, 2019 at 3:43 PM Ralf Ramsauer <
ralf.ramsauer@oth-regensburg.de> wrote:

> Hi,
>
> On 6/12/19 9:32 PM, Wayne wrote:
> > I'm sorry about the formatting.  It didn't look like that before I sent
> it.
> >
> > I will double check my linux-x86-demo cell config again for the serial
> > IRQ mapping. Also I will build in the CONFIG_CRASH_CELL_ON_PANIC define
> > for help going forward.
> >
> > Can the "jailhouse cell linux" command take an initramfs image (.img)
> > through the "-i option" or does it need to be an initrd?  If initrd
>
> Good question. The -i option does nothing else than loading the image -
> as a binary - to a RAM region and propagate its location. So I'd assume
> that support for different formats only depend if your kernel has
> builtin support for the eventual format.
>
> > only, can you point me to an example x86 rootfs.cpio image?  I'm having
> > trouble installing Buildroot on my machine.
>
> Buildroot is the perfect swiss army knife for non-root initrds.
>
>   Ralf
>
> >
> > Thanks again,
> > Wayne
> >
> > On Wed, Jun 12, 2019 at 1:17 PM Ralf Ramsauer
> > <ralf.ramsauer@oth-regensburg.de
> > <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
> >
> >     Hi Wayne,
> >
> >     On 6/12/19 3:55 PM, Wayne wrote:
> >     > Ralf/Jan,
> >     >
> >     >  Are you sure you remove the device from the kernel cmdline? *Yes=
,
> >     there
> >     > is no ttyS* device in my root linux cmdline*
> >     > - Are you sure that there doesn't spawn a tty? Check with
> >     systemctl. *No
> >     > tty as far as I can tell, verified with "lsof | grep ttyS".  The
> lsof
> >     > command stops working after the crash though*
> >
> >     please use plain text mails. It's getting hard to read :-)
> >
> >     > - lsof | grep ttyS
> >     > - The root-cell might receive the serial device's interrupt, whil=
e
> its
> >     >   ports are assigned to the non-root cell. Does the crash happen
> when
> >     >   you type in a character to the serial line? *This is possible,
> >     do you
> >     > have an example of how I would accomplish assigning the interrupt
> >     (IRQ 4
> >     > for ttyS0) to the non-root?  To rule out the interrupt concern.*
> >
> >     Compare linux-x86-demo.c. The .pin_bitmap field denotes the
> interrupts
> >     that are routed to the cell. If you use the original
> linux-x86-demo.c,
> >     then interrupt 4 should already be routed to the cell.
> >
> >     AFAICT, in linux-x86-demo.c, we assign IRQ 3 & 4. In your case, we
> also
> >     remove the other IRQ from the root cell - IRQ 3 should be commented
> out.
> >
> >     BTW, a helpful debugging feature:
> >     echo "#define CONFIG_CRASH_CELL_ON_PANIC 1" >>
> >     include/hypervisor/config.h
> >
> >     This will let the root cell print a stackdump which gives you a hin=
t
> >     what codepath caused the crash.
> >
> >     >
> >     >   In this case, assign the interrupt to the non-root cell. You
> >     will need
> >     >   it in any case there once you have a initrd and want to type in
> >     stuff.
> >     >
> >     > So there must be some reason why the crash happens. The hard way
> is to
> >     > add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell. *I
> >     can use
> >     > this method for now to continue booting the non-root linux.*
> >     >
> >     >>
> >     >>        if I leave out the pio mapping in the non-root linux, and
> >     >> alolothat block in the root cell instead then the non-root linux
> >     gets a
> >     >> PIO read fault on "0x3F9" while booting.
> >     >>        Ralf mentioned that Linux would not try enumerate the
> >     device if
> >     >> its set to -1 ( [0x3f8/8 ... 0x3ff/8] =3D -1)  , but the non-roo=
t
> >     seems to
> >     >> attempt to do something with it anyway:
> >     >>
> >     >> "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing
> >     enabled"
> >     >> "FATAL: Invalid PIO read, port: 3f9: size 1"
> >     >
> >     > Hmm. At least that's what I thought. I don't know how enumeration
> of
> >     > platform devices works exactly, but reconsidering this, the
> behaviour
> >     > above makes sense: How would it know that a platform device is no=
t
> >     > present, depending of the configuration of the pio_bitmap.
> >      *Since I do
> >     > technically have two serial ports, is there a way (via command
> line or
> >     > kernel config for ex) to hardcode what the non-root would
> >     enumerate for
> >     > the UART when its booting up?  Meaning, force it to "see" the 0x2=
f8
> >     > serial port as ttyS0 instead of 0x3f8 when booting up
> >     > and** CONFIG_SERIAL_8250_RUNTIME_UARTS =3D 1**.  That way if you =
had
> say
> >     > three serial ports and three cells (1 root, 2 non-root linux) the=
n
> >     each
> >     > could have their own separate dedicated ttyS0.*
> >
> >     Have a look at the documentation of the 8250 driver, don't know by
> >     heart.
> >
> >     HTH,
> >       Ralf
> >
> >     > *
> >     > *
> >     > As far as just booting the non-root besides the serial concern, I
> >     > haven't provided an initramfs to my non-root linux yet.  I would
> >     like to
> >     > probably boot it with a simple ramdisk if possible to get a point
> >     where
> >     > I can log in.
> >     > *
> >     > *
> >     > Thanks,
> >     > Wayne
> >     >
> >     > On Wed, Jun 12, 2019 at 6:43 AM Ralf Ramsauer
> >     > <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     > <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>> wrote:
> >     >
> >     >     Hi,
> >     >
> >     >     On 6/11/19 11:05 PM, Wayne wrote:
> >     >     > Jan/Ralf,
> >     >     >
> >     >     > I was able to get past issues 1 and 3 above by using Jan's
> >     kernel
> >     >     config
> >     >     > from this thread:
> >     >     >
> >     >     >
> >     >
> >
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >     >     >
> >     >     > The DMA issue was resolved by disabling kernel
> >     >     option CONFIG_ISA_DMA_API
> >     >     > as stated in another thread, and reflected in the config
> >     file above.
> >     >     >
> >     >     > So now I think i've almost got the non-root linux booting.
> I'm
> >     >     stuck at
> >     >     > the point where its trying to mount a filesystem and since
> >     i'm not
> >     >     > providing an initramfs it panics.
> >     >
> >     >     Perfect!
> >     >
> >     >     >
> >     >     > Similar to the output below:
> >     >     >
> >     >     > [ 1.080178] VFS: Cannot open root device "(null)" or
> >     >     unknown-block(0,0):
> >     >     > error -6
> >     >     > [ 1.087662] Please append a correct "root=3D" boot option;
> >     here are the
> >     >     > available partitions:
> >     >     > [ 1.096013] Kernel panic - not syncing: VFS: Unable to moun=
t
> >     root
> >     >     fs on
> >     >     > unknown-block(0,0)
> >     >     >
> >     >     > I have just a couple more questions:
> >     >     > 1. In general, is it true that an inmate will takeover
> control
> >     >     from the
> >     >     > root of any resource in the following arrays, or are there
> >     some cases
> >     >     > where they get "shared" between the root and inmate?
> >     >
> >     >     Depends.
> >     >
> >     >     >      A. ".mem_regions" -> Shared?
> >     >
> >     >     May be shared with the root cell (i.e., if the region has the
> flag
> >     >     JAILHOUSE_MEM_ROOTSHARED set).
> >     >
> >     >     >      B. ".irqchips" -> Shared?
> >     >
> >     >     Shared with whom? Only one guest runs on a CPU. This guest
> >     will have
> >     >     full access to the irqchip. Some accesses must be intercepted=
.
> >     >
> >     >     >      C. ".pio_bitmap" -> Inmate takes control of these if
> >     matching
> >     >     > between inmate and root
> >     >
> >     >     Exclusive control.
> >     >
> >     >     >      D. ".pci_devices" -> Inmate takes control?
> >     >
> >     >     Exclusive control.
> >     >
> >     >     >      E. ".pci_caps" -> Inmate takes control?
> >     >
> >     >     Exclusive control.
> >     >
> >     >     >
> >     >     > 2. Along the same lines, going back to my ttyS0 issue
> >     mentioned above
> >     >     > while trying to share it:
> >     >     >
> >     >     >        If I allocate the following to the linux non root
> >     cell (and set
> >     >     > to -1 in the root)
> >     >
> >     >     BTW, there's generally no need to set -1 in the root cell --
> >     it will be
> >     >     taken away when the non-root cell is created.
> >     >
> >     >     >      .pio_bitmap =3D {
> >     >     >           [0x3f8/8 ... 0x3ff/8] =3D 0x00   /* serial 2*/
> >     >     >        }
> >     >     >
> >     >     >        Then on the root cell I randomly get a PIO read faul=
t
> on
> >     >     "0x3FE"
> >     >     > when the non-root is booting, i'm not sure what process is
> >     causing
> >     >     this.
> >     >
> >     >     - Are you sure you remove the device from the kernel cmdline?
> >     >     - Are you sure that there doesn't spawn a tty? Check with
> >     systemctl.
> >     >     - lsof | grep ttyS
> >     >     - The root-cell might receive the serial device's interrupt,
> >     while its
> >     >       ports are assigned to the non-root cell. Does the crash
> >     happen when
> >     >       you type in a character to the serial line?
> >     >
> >     >       In this case, assign the interrupt to the non-root cell. Yo=
u
> >     will need
> >     >       it in any case there once you have a initrd and want to typ=
e
> >     in stuff.
> >     >
> >     >     So there must be some reason why the crash happens. The hard
> >     way is to
> >     >     add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell=
.
> >     >
> >     >     >
> >     >     >        if I leave out the pio mapping in the non-root linux=
,
> and
> >     >     > alolothat block in the root cell instead then the non-root
> linux
> >     >     gets a
> >     >     > PIO read fault on "0x3F9" while booting.
> >     >     >        Ralf mentioned that Linux would not try enumerate th=
e
> >     device if
> >     >     > its set to -1 ( [0x3f8/8 ... 0x3ff/8] =3D -1)  , but the
> non-root
> >     >     seems to
> >     >     > attempt to do something with it anyway:
> >     >     >
> >     >     > "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ
> sharing
> >     >     enabled"
> >     >     > "FATAL: Invalid PIO read, port: 3f9: size 1"
> >     >
> >     >     Hmm. At least that's what I thought. I don't know how
> >     enumeration of
> >     >     platform devices works exactly, but reconsidering this, the
> >     behaviour
> >     >     above makes sense: How would it know that a platform device i=
s
> not
> >     >     present, depending of the configuration of the pio_bitmap.
> >     >
> >     >     Anyway, 8250 drivers have some cmdline parameters that can be
> >     used to
> >     >     control initialisation (e.g., see the nr_uarts parameters
> above).
> >     >
> >     >     >
> >     >     >        Is it possible to map the same pio block in both the
> >     root and
> >     >     > non-root with a different mask?  Or does the non-root just
> >     >     override it?
> >     >     > It seems like the latter is true.
> >     >
> >     >     Exactly. That's not a) possible, and b) does not really make
> >     sense.
> >     >
> >     >       Ralf
> >     >
> >     >     >
> >     >     > Thanks again Jan and Ralf for your help getting to this
> point.
> >     >     >
> >     >     >
> >     >     > On Tue, Jun 11, 2019 at 2:13 PM Wayne
> >     <racedrive1503@gmail.com <mailto:racedrive1503@gmail.com>
> >     >     <mailto:racedrive1503@gmail.com <mailto:
> racedrive1503@gmail.com>>
> >     >     > <mailto:racedrive1503@gmail.com
> >     <mailto:racedrive1503@gmail.com> <mailto:racedrive1503@gmail.com
> >     <mailto:racedrive1503@gmail.com>>>>
> >     >     wrote:
> >     >     >
> >     >     >     Jan & Ralf:
> >     >     >
> >     >     >     I have a little good news, I have successfully gotten
> >     the non-root
> >     >     >     linux to display some startup output based on your
> >     suggestions.
> >     >     >     Also, there must have been some small difference betwee=
n
> >     the stock
> >     >     >     linux-x86-demo cell config and the one I tweaked.  I
> >     went back to
> >     >     >     the original and made some minor changes and it started
> >     displaying
> >     >     >     the serial output now for the non-root node.
> >     >     >
> >     >     >     I ended up making the root cell the primary user of the
> >     ttyS0
> >     >     >     device, and just having the non-root linux output to th=
e
> >     >     hypervisor
> >     >     >     virtual console (console=3Djailhouse).  In my setup, th=
ere
> >     >     appears to
> >     >     >     be some process still attempting to use the ttyS0
> >     randomly on the
> >     >     >     root linux, and that causes the hypervisor to halt it i=
f
> >     I don't
> >     >     >     leave it in the PIO array.  Not sure who is doing it.
> >     >     >
> >     >     >
> >     >     >     This is where i'm at now.  The non-root linux keeps
> >     running into
> >     >     >     points where it tries to access PIO and gets parked:
> >     >     >
> >     >     >     1. First crash:
> >     >     >
> >     >     >     [    0.424925]kworker/u6:0 (27) used greated stack
> >     depth: 14656
> >     >     >     bytes left
> >     >     >     [    0.425807]futex has table entries: 1024 (order: 4,
> 65536
> >     >     bytes)
> >     >     >     "FATAL: Invalid PIO write, port: 70: size 1"
> >     >     >     ...
> >     >     >     Parking CPU 3 (Cell: "linux-x86-demo")
> >     >     >
> >     >     >     According to /proc/ioports, 70 has to do with the
> >     Realtime clock
> >     >     >     (rtc0).  I was able to temporarily add the 70 mapping t=
o
> the
> >     >     >     non-root linux, but should it be there at all?  I tried
> >     to disable
> >     >     >     RTC support in the guest kernel config.
> >     >     >
> >     >     >
> >     >     >     2. On the next attempt, I then got further with a crash
> >     trying to
> >     >     >     initialize Ser device ttyS0:
> >     >     >
> >     >     >     "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ
> >     sharing
> >     >     enabled"
> >     >     >     "FATAL: Invalid PIO read, port: 3f9: size 1"
> >     >     >     ...
> >     >     >     Parking CPU 3 (Cell: "linux-x86-demo")
> >     >     >
> >     >     >     I can get around that if I allow the non-root access in
> >     its pio
> >     >     >     table, but then I have a problem above with the root
> linux
> >     >     randomly
> >     >     >     trying to use it.
> >     >     >
> >     >     >
> >     >     >     3. Now with the temporary adjustments to the non-root
> >     pio table
> >     >     >     above I get here:
> >     >     >
> >     >     >     "[    0.972399]clocksource:Switched to clocksource tsc"
> >     >     >     "FATAL: Invalid PIO read, port: 87: size 1"
> >     >     >     ...
> >     >     >     Parking CPU 3 (Cell: "linux-x86-demo")
> >     >     >
> >     >     >     According to proc/ioports this one has to do with "dma
> page
> >     >     >     request". It isn't mapped in my root linux PIO or
> non-root
> >     >     linux array.
> >     >     >
> >     >     >
> >     >     >     Aside from the serial conflict, it seems like these
> >     should remain
> >     >     >     controlled by the root linux or hypervisor.   Do you us=
e
> a
> >     >     >     particular bare minimum x86 kernel config on your
> >     machine for the
> >     >     >     guest to get around these?  I know Jan mentioned the
> >     >     >     jailhouse-images project might have something, but I
> >     couldn't find
> >     >     >     it digging around quick.
> >     >     >
> >     >     >     Thanks to you both for your responses and patience.  I
> >     got the
> >     >     root
> >     >     >     linux up and going on my own, but the non-root guest is
> >     proving to
> >     >     >     be more difficult.
> >     >     >
> >     >     >     Wayne
> >     >     >
> >     >     >
> >     >     >
> >     >     >     On Tue, Jun 11, 2019 at 11:31 AM Ralf Ramsauer
> >     >     >     <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>> wrote:
> >     >     >
> >     >     >         Hi,
> >     >     >
> >     >     >         On 6/10/19 7:45 PM, Wayne wrote:
> >     >     >         > Thank you for your responses Ralf and Jan.
> >     >     >         >
> >     >     >         > Yes, I have successfully gotten both the apic-dem=
o
> and
> >     >     >         tiny-demo cells
> >     >     >         > to work on my system before attempting to load th=
e
> >     non-root
> >     >     >         linux.  I
> >     >     >         > can see serial output from them.
> >     >     >         >
> >     >     >         > However, if I try to share the UART between root
> >     and inmate
> >     >     >         for them I
> >     >     >         > run into a crash on the hypervisor if the root
> linux
> >     >     attempts
> >     >     >         to write
> >     >     >         > to the UART (after creating/starting a demo).
> >     Does the root
> >     >     >         linux lose
> >     >     >         > access once an inmate is created/started?  Or am =
I
> >     missing
> >     >     >         something
> >     >     >         > from my System config or tiny-demo config that
> allows
> >     >     them to
> >     >     >         share?  I
> >     >     >         > attached the crash in hypervisor_output.txt.
> >     >     >         >
> >     >     >         > Also, I noticed the tiny-demo output on the UART
> gets
> >     >     mirrored
> >     >     >         on the
> >     >     >
> >     >     >         Yes, according to your config,
> >     >     >         JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is
> >     >     >         set. This means that the guest will use the virtual
> >     >     console. The
> >     >     >         virtual
> >     >     >         console uses the hypervisor output which depends
> >     whatever
> >     >     is set
> >     >     >         in your
> >     >     >         system configuration. In your case the hypervisor
> >     uses 3f8.
> >     >     >
> >     >     >         And additionally, the inmate also a valid .console
> >     set. Again,
> >     >     >         3f8. This
> >     >     >         means, it will use the console *and* the hypervisor
> >     debug
> >     >     >         hypercall. In
> >     >     >         your case, both outputs are routed to the same
> >     device which
> >     >     >         explains the
> >     >     >         mirroring.
> >     >     >
> >     >     >         > Jailhouse virtual console.  Does that mean that i=
ts
> >     >     writing to the
> >     >     >         > serial through the hypervisor and not directly
> >     accessing
> >     >     ttyS0
> >     >     >         itself?
> >     >     >
> >     >     >         Exactly.
> >     >     >
> >     >     >         > If so, is there a way to create the cell to write
> >     ttyS0
> >     >     >         directly as a
> >     >     >         > test?  To see if it exhibits same behavior as the
> >     >     non-root linux.
> >     >     >
> >     >     >         Sure, simply align the .address field of .console,
> >     and allow
> >     >     >         access to
> >     >     >         that port via .pio_bitmap.
> >     >     >
> >     >     >         >
> >     >     >         > FYI, I create the tiny-demo like this:
> >     >     >         >
> >     >     >         > jailhouse cell create configs/x86/tiny-demo.cell
> >     >     >         > jailhouse cell load tiny-demo
> >     >     inmates/demos/x86/tiny-demo.cell
> >     >     >         > jailhouse cell start tiny-demo
> >     >     >         >
> >     >     >         > Going back to my original non-root linux question=
,
> I
> >     >     don't see any
> >     >     >         > output when connected over ttyS0.  Its address is
> >     0x3f8
> >     >     >         ("serial 1") in
> >     >     >         > the PIO, and that seems to work fine for the othe=
r
> >     simple
> >     >     >         demos, minus
> >     >     >         > the hypervisor crash issue above when sharing.  I
> >     know there
> >     >     >         is the
> >     >     >         > other "serial 2" port but I haven't tried to use
> >     that one.
> >     >     >
> >     >     >         I see that port on our Dell server as well. It's
> >     present,
> >     >     but I
> >     >     >         don't
> >     >     >         know where it's connected to.
> >     >     >
> >     >     >         Let me just summarise your issue:
> >     >     >
> >     >     >         You only have one serial line available, right? Fro=
m
> the
> >     >     root-cell's
> >     >     >         POV, it's ttyS0 on 3f8.
> >     >     >
> >     >     >         I would propose to share ttyS0 between the
> >     hypervisor and
> >     >     non-root
> >     >     >         Linux. This means:
> >     >     >
> >     >     >           - Don't let the root-cell use ttyS0. Remove any
> >     >     console=3DttyS0
> >     >     >             parameters from you commandline. Ensure that
> noone
> >     >     else accesses
> >     >     >             ttyS0 (e.g., getty@ttyS0 or other friends)
> >     >     >
> >     >     >           - Set 3f8 as debug_console in your master.c (seem=
s
> you
> >     >     already
> >     >     >         have)
> >     >     >
> >     >     >           - Allow 3f8 access in the linux-demo.c (already
> set in
> >     >     the default
> >     >     >             linux-demo
> >     >     >
> >     >     >           - Disallow 2f8 access in linux-demo.c:
> >     >     >         -               [ 0x2f8/8 ...  0x2ff/8] =3D 0, /*
> >     serial2 */
> >     >     >         +               [ 0x2f8/8 ...  0x2ff/8] =3D -1, /*
> >     serial2 */
> >     >     >
> >     >     >             I don't know how Linux enumerates serial
> >     devices, but this
> >     >     >         ensures
> >     >     >             that Linux won't see the unconnected serial lin=
e
> >     and map
> >     >     >         ttyS0 to
> >     >     >             3f8
> >     >     >
> >     >     >         >
> >     >     >         > non root linux launched with:
> >     >     >         > /tools/jailhouse cell linux
> configs/x86/linux-x86.cell
> >     >     >         > /boot/vmlinux-4.1.16-Guest -c
> "console=3DttyS0,115200"
> >     >     >
> >     >     >         Then, this should actually work...
> >     >     >
> >     >     >         And if not, then console=3Djailhouse0 should work.
> >     >     >
> >     >     >         >
> >     >     >         > I can try the 4.19 siemens kernel and "next"
> >     branch for
> >     >     >         jailhouse you
> >     >     >         > suggested.  Do you think that combination will
> resolve
> >     >     the missing
> >     >     >         > serial for the non-root linux?  Otherwise, did my
> >     kernel
> >     >     >         config, system
> >     >     >         > config, and non-root linux cell configs look OK?
> >     >     >
> >     >     >         I didn't look at it, but we should at least - even
> >     if some
> >     >     flags are
> >     >     >         still incorrect - see the "Uncompressing kernel..."
> >     thing.
> >     >     >
> >     >     >         Wait -- one thing you could try: Deactivate
> >     CONFIG_EFI and
> >     >     >         especially
> >     >     >         CONFIG_EFI_STUBS. I'm not sure, but it could be tha=
t
> >     EFI_STUBS
> >     >     >         change
> >     >     >         the header format that our bootloader patches.
> >     >     >
> >     >     >         >
> >     >     >         > Thanks again for your help.
> >     >     >
> >     >     >         No problem. But it's not yet working. ;-)
> >     >     >
> >     >     >           Ralf
> >     >     >
> >     >     >         >
> >     >     >         >
> >     >     >         > On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsauer
> >     >     >         > <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >     >     >         > <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>> wrote:
> >     >     >         >
> >     >     >         >     Hi Wayne,
> >     >     >         >
> >     >     >         >     On 6/7/19 10:04 PM, Wayne wrote:
> >     >     >         >     > Hi Ralf,
> >     >     >         >     >
> >     >     >         >     > Thank you for your responses.  I have
> >     attached the
> >     >     >         requested config
> >     >     >         >     > files.  I am now just trying to use the sam=
e
> >     >     bzImage for
> >     >     >         the root and
> >     >     >         >     > the non-root linux node.
> >     >     >         >
> >     >     >         >     One question that you didn't answer: do
> >     apic-demo or
> >     >     >         tiny-demo work?
> >     >     >         >     They need to to have correct .console
> >     parameter set, so
> >     >     >         ensure that
> >     >     >         >     parameters are set if you run those demos in
> your
> >     >     >         linux-demo cell. Just
> >     >     >         >     compare it to tiny-demo.c or apic-demo.c
> >     >     >         >
> >     >     >         >     >
> >     >     >         >     > Yes, I am using vanilla 4.16 because the
> >     documentation
> >     >     >         indicated
> >     >     >         >     that it
> >     >     >         >     > is the first mainline release to officially
> >     support
> >     >     >         Jailhouse Guest
> >     >     >         >     > images.  Do you suggest that I use somethin=
g
> >     else?
> >     >     >         >
> >     >     >         >     As Jan already wrote: Try to use Siemens' 4.1=
9
> >     branch.
> >     >     >         >
> >     >     >         >     >
> >     >     >         >     > Right now i'm just trying to get some seria=
l
> >     >     output from
> >     >     >         the non-root
> >     >     >         >     > Linux.  Hopefully, I have that configured
> >     correctly.
> >     >     >         Ideally, I would
> >     >     >         >     > like to share the same serial console for
> >     the Root
> >     >     node
> >     >     >         and non-root
> >     >     >         >     > node eventually if possible.  I have been O=
K
> >     with
> >     >     using
> >     >     >         the virtual
> >     >     >         >     > console (jailhouse console -f) for the
> >     Hypervisor
> >     >     output.
> >     >     >         >
> >     >     >         >     In addition to Jan's comment:
> >     >     >         >
> >     >     >         >     Currently you only have access to the
> >     jailhouse console
> >     >     >         via 'jailhouse
> >     >     >         >     console' from your root cell. Imagine your
> >     root cell
> >     >     >         crashes for some
> >     >     >         >     reason. You will never see the fault reason,
> >     which makes
> >     >     >         things hard to
> >     >     >         >     debug.
> >     >     >         >
> >     >     >         >     I would suggest to configure the hypervisor t=
o
> >     use the
> >     >     >         serial console.
> >     >     >         >     You can share the device with the non-root
> >     Linux, that's
> >     >     >         no problem.
> >     >     >         >
> >     >     >         >     In this case, the non-root kernel's output wi=
ll
> >     >     always be
> >     >     >         printed to the
> >     >     >         >     serial console. Directly, if you choose
> >     >     console=3DttySx, and
> >     >     >         indirectly
> >     >     >         >     via the hypervisor if you choose
> >     console=3Djailhouse.
> >     >     >         >
> >     >     >         >     BTW: According to your config, your system is=
 a
> >     >     PowerEdge,
> >     >     >         and the
> >     >     >         >     non-root cell gets both, 0x2f8 and 0x3f8. Are
> >     you sure
> >     >     >         that ttyS1 is the
> >     >     >         >     correct console that you are connected to?
> >     >     >         >
> >     >     >         >     Just mentioning this as we have a similar
> >     machine here,
> >     >     >         and, afair, both
> >     >     >         >     platform serial device are 'usable', but one
> >     ends in the
> >     >     >         nirvana while
> >     >     >         >     it is accessible.
> >     >     >         >
> >     >     >         >     Ah, and one last thing: try to switch to the
> >     current
> >     >     next
> >     >     >         branch for
> >     >     >         >     jailhouse. Jan just integrated a few patches
> >     from me
> >     >     that
> >     >     >         might also be
> >     >     >         >     relevant for your machine.
> >     >     >         >
> >     >     >         >     HTH
> >     >     >         >       Ralf
> >     >     >         >
> >     >     >         >     >
> >     >     >         >     > Wayne
> >     >     >         >     >
> >     >     >         >     > On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsaue=
r
> >     >     >         >     > <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >     >     >         >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>
> >     >     >         >     > <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>
> >     >     >         >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>
> >     >     >         <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>
> >     >     <mailto:ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>>>>>> wrote:
> >     >     >         >     >
> >     >     >         >     >     Hi,
> >     >     >         >     >
> >     >     >         >     >     On 6/7/19 2:28 PM, Wayne wrote:
> >     >     >         >     >     > Hello,
> >     >     >         >     >     >
> >     >     >         >     >     > I am new to Linux development and
> >     >     Jailhouse.  I have
> >     >     >         >     successfully
> >     >     >         >     >     booted
> >     >     >         >     >     > the Jailhouse Hypervisor and root cel=
l
> >     on a bare
> >     >     >         metal X86 Linux
> >     >     >         >     >     system
> >     >     >         >     >     > (No QEMU).  I am now trying to load a
> >     non-root
> >     >     >         Linux cell
> >     >     >         >     and I have a
> >     >     >         >     >     > few questions.  Jailhouse accepts and
> >     starts my
> >     >     >         non-root
> >     >     >         >     linux cell
> >     >     >         >     >     > configuration and I see it as "runnin=
g"
> >     >     through the
> >     >     >         >     "jailhouse cell
> >     >     >         >     >     > list" command.  However, I don't see
> >     any serial
> >     >     >         output from the
> >     >     >         >     >     > "non-root linux" cell booting up.  I=
=E2=80=99m
> >     not sure
> >     >     >         what the
> >     >     >         >     non-root node
> >     >     >         >     >     > is doing at this point.
> >     >     >         >     >
> >     >     >         >     >     Ok, first of all, can you see any outpu=
t
> >     from
> >     >     >         Jailhouse's demo
> >     >     >         >     inmates
> >     >     >         >     >     (e.g., tiny-demo or apic-demo)?
> >     >     >         >     >
> >     >     >         >     >     >
> >     >     >         >     >     >                My root node is a 4.16
> >     kernel
> >     >     >         configured this
> >     >     >         >     way:
> >     >     >         >     >     >                               1.
> >     >     >         CONFIG_JAILHOUSE_GUEST is
> >     >     >         >     not set
> >     >     >         >     >     >                               2.
> >     CONFIG_SERIO=3Dy
> >     >     >         >     >     >                               3.
> >     >     >         >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> >     >     >         >     >     >
> >     >     >         >     >     >                My non-root node is a
> >     4.16 kernel
> >     >     >         configured
> >     >     >         >     this way:
> >     >     >         >     >     >                               1.
> >     >     >         CONFIG_JAILHOUSE_GUEST=3Dy
> >     >     >         >     >     >                               2.
> >     CONFIG_SERIO=3Dm
> >     >     >         (can't seem
> >     >     >         >     to disable
> >     >     >         >     >     > completely in my config for 4.16)
> >     >     >         >     >     >                               3.
> >     >     >         >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1
> >     >     >         >     >
> >     >     >         >     >     Could you please provide a full .config=
?
> >     What
> >     >     branch
> >     >     >         are you
> >     >     >         >     exactly
> >     >     >         >     >     using? Vanilla 4.16?
> >     >     >         >     >
> >     >     >         >     >     Please attach your system config and yo=
ur
> >     >     non-root linux
> >     >     >         >     config as well.
> >     >     >         >     >
> >     >     >         >     >     You may also want to try
> >     >     >         https://github.com/siemens/linux . See
> >     >     >         >     >     jailhouse-enabling branches for some
> >     releases.
> >     >     >         >     >
> >     >     >         >     >     >
> >     >     >         >     >     > In general, do the kernel config
> settings
> >     >     have to
> >     >     >         match between
> >     >     >         >     >     the root
> >     >     >         >     >     > node and non-linux or is the above
> fine?
> >     >     >         >     >
> >     >     >         >     >     No, they do not have to be the same, bu=
t
> >     they can.
> >     >     >         Still, an
> >     >     >         >     analysis
> >     >     >         >     >     requires your .config.
> >     >     >         >     >
> >     >     >         >     >     >
> >     >     >         >     >     > The vmlinux-4.1.16-Guest bzImage is
> >     approx 7MB,
> >     >     >         and the
> >     >     >         >     inmate node is
> >     >     >         >     >     > allocated ~75MB of RAM.
> >     >     >         >     >     >
> >     >     >         >     >     > I have a single UART, so I have
> >     configured the
> >     >     >         root cell
> >     >     >         >     system config
> >     >     >         >     >     > to output to the virtual hypervisor
> >     console:
> >     >     >         >     >
> >     >     >         >     >     Wait... You configured your root-cell t=
o
> >     use the
> >     >     >         hypervisor debug
> >     >     >         >     >     console? How? It's only available once
> the
> >     >     hypervisor is
> >     >     >         >     enabled. How
> >     >     >         >     >     should this work?
> >     >     >         >     >
> >     >     >         >     >     But let's have a look at your
> >     configuration first.
> >     >     >         >     >
> >     >     >         >     >     So you want to:
> >     >     >         >     >       - Have the UART (0x3f8) available in
> the
> >     >     non-root cell
> >     >     >=EF=BF=BD=EF=BF=BD        >     >       - Use 0x3f8 as hyper=
visor debug
> >     console as well
> >     >     >         >     >       - No console for root-cell
> >     >     >         >     >
> >     >     >         >     >     Did I get this right?
> >     >     >         >     >
> >     >     >         >     >       Ralf
> >     >     >         >     >
> >     >     >         >     >     >
> >     >     >         >     >     > .flags =3D
> >     JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> >     >     >         >     >     >
> >     >     >         >     >     > .debug_console =3D {
> >     >     >         >     >     > .type =3D JAILHOUSE_CON_TYPE_NONE,
> >     >     >         >     >     > },
> >     >     >         >     >     >
> >     >     >         >     >     > and I have configured the non-root
> >     linux cell to
> >     >     >         output to
> >     >     >         >     the UART:
> >     >     >         >     >     >
> >     >     >         >     >     > (Added serial 0x3f8 to pio bitmap for
> >     non-root
> >     >     >         linux) and
> >     >     >         >     started the
> >     >     >         >     >     > node with this:
> >     >     >         >     >     >
> >     >     >         >     >     > ./tools/jailhouse cell linux
> >     >     >         configs/x86/linux-x86.cell
> >     >     >         >     >     > /boot/vmlinux-4.1.16-Guest -c
> >     >     "console=3DttyS0,115200"
> >     >     >         >     >     > (Note I also tried "console=3Djailhou=
se"
> >     in the
> >     >     >         command above,
> >     >     >         >     and that
> >     >     >         >     >     > produces the same result)
> >     >     >         >     >     >
> >     >     >         >     >     > I then see the following on my
> hypervisor
> >     >     console
> >     >     >         >     (./tools/jailhouse
> >     >     >         >     >     > console -f):
> >     >     >         >     >     >
> >     >     >         >     >     > Created cell "linux-x86-demo"
> >     >     >         >     >     > ...
> >     >     >         >     >     > Cell "linux-x86-demo" can be loaded
> >     >     >         >     >     > Started cell "linux-x86-demo"
> >     >     >         >     >     >
> >     >     >         >     >     > After a little while I do get a parke=
d
> >     CPU error
> >     >     >         on the root
> >     >     >         >     node,
> >     >     >         >     >     looks
> >     >     >         >     >     > like its trying to do something with
> the
> >     >     UART as well:
> >     >     >         >     >     > FATAL: Invalid PIO read, port: 3fe
> size: 1
> >     >     >         >     >     >
> >     >     >         >     >     > I would expect something to pop out o=
n
> >     the UART
> >     >     >         from the
> >     >     >         >     non-root
> >     >     >         >     >     linux
> >     >     >         >     >     > node first.  Note that root node has
> >     serial
> >     >     0x3f8
> >     >     >         disabled
> >     >     >         >     in its pio
> >     >     >         >     >     > bitmap.
> >     >     >         >     >     >
> >     >     >         >     >     > I verifed that the UART is functionin=
g
> by
> >     >     allowing the
> >     >     >         >     hypervisor to
> >     >     >         >     >     > print to it and also performed an ech=
o
> >     test over
> >     >     >         ttyS0.
> >     >     >         >     >     >
> >     >     >         >     >     > I have tried several configurations o=
f
> >     >     >         kernel.....including your
> >     >     >         >     >     current
> >     >     >         >     >     > "queues/jailhouse" branch head kernel
> >     for the
> >     >     >         non-root node,
> >     >     >         >     along
> >     >     >         >     >     with
> >     >     >         >     >     > the kernel config for 4.7 posted in
> >     this thread
> >     >     >         below (but I
> >     >     >         >     get same
> >     >     >         >     >     > result as above when I start it, no
> kernel
> >     >     output):
> >     >     >         >     >     >
> >     >     >         >     >     >
> >     >     >         >     >
> >     >     >         >
> >     >     >
> >     >
> >          "
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >     >     >         >     >     >
> >     >     >         >     >     > Any information you can provide to me
> >     will be
> >     >     >         helpful.  I'm
> >     >     >         >     not sure
> >     >     >         >     >     > what might be going wrong here.
> >     >     >         >     >     >
> >     >     >         >     >     > Thanks,
> >     >     >         >     >     > Wayne
> >     >     >         >     >     >
> >     >     >         >     >     > --
> >     >     >         >     >     > You received this message because you
> are
> >     >     >         subscribed to the
> >     >     >         >     Google
> >     >     >         >     >     > Groups "Jailhouse" group.
> >     >     >         >     >     > To unsubscribe from this group and st=
op
> >     >     receiving
> >     >     >         emails
> >     >     >         >     from it, send
> >     >     >         >     >     > an email to
> >     >     >         jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >     >     >         <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.co=
m
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
> >     >     >         >
> >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >     >     >
> >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>>
> >     >     >         >     >
> >     >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >     >     >
> >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>
> >     >     >         >
> >     >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>
> >     >     >
> >      <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>>>>
> >     >     >         >     >     >
> >     >     <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >     >     >         <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.co=
m
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
> >     >     >         >
> >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >     >     >
> >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>>
> >     >     >         >     >
> >     >      <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
> >     >     >
> >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>
> >     >     >         >
> >     >      <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>
> >     >     >
> >      <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>
> >     >     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%252525252Bunsubscribe@googlegroups.com>>>>>>.
> >     >     >         >     >     > To view this discussion on the web
> visit
> >     >     >         >     >     >
> >     >     >         >     >
> >     >     >         >
> >     >     >
> >     >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
> >     >     >         >     >     >
> >     >     >         >     >
> >     >     >         >
> >     >     >
> >     >
> >         <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> >     >     >         >     >     > For more options, visit
> >     >     >         https://groups.google.com/d/optout.
> >     >     >         >     >
> >     >     >         >
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
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Mae=
RW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com
> >     >     >
> >     >
> >      <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Mae=
RW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> >     >     > For more options, visit https://groups.google.com/d/optout.
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
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%=
2Bgpts0DUBENqV6eFDPazfs5kR_QRGaw%40mail.gmail.com
> >     >
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%=
2Bgpts0DUBENqV6eFDPazfs5kR_QRGaw%40mail.gmail.com?utm_medium=3Demail&utm_so=
urce=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc13nuahbog_WVD-=
BJi0asHEa8TxMAvB5M5damJGJ_5inA%40mail.gmail.com
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc13nuahbog_WVD-=
BJi0asHEa8TxMAvB5M5damJGJ_5inA%40mail.gmail.com?utm_medium=3Demail&utm_sour=
ce=3Dfooter
> >.
> > For more options, visit https://groups.google.com/d/optout.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%2BKhc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg%40mai=
l.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--00000000000016be8f058b34a3a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgSmFuOjxkaXY+PGJyPjwvZGl2PjxkaXY+SW4gdGhlIGV4YW1wbGUg
dGhhdCB5b3UgcG9pbnRlZCBtZSB0byBiZWxvdywgaG93IGRpZCB5b3UgY3JlYXRlIHRoZSByb290
ZnMuY3BpbyBpbWFnZT/CoCBJcyB0aGF0IGNvbnNpZGVyZWQgYW4gaW5pdHJkIG9yIGFuIGluaXRy
YW1mcz88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmphaWxob3VzZSBjZWxsIGxpbnV4IC9ldGMv
amFpbGhvdXNlL2xpbnV4LXg4Ni1kZW1vLmNlbGwgL2Jvb3Qvdm1saW51eiogXDxicj7CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC1pIC91c3IvbGliZXhlYy9qYWlsaG91c2UvZGVtb3Mv
cm9vdGZzLmNwaW8gXDxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC1jICZxdW90
O2NvbnNvbGU9dHR5UzAgODI1MC5ucl91YXJ0cz0xIGlwPTE5Mi4xNjguMTkuMiZxdW90Ozxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PihGcm9twqA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vc2llbWVucy9qYWlsaG91c2UtaW1hZ2VzL2Jsb2IvbWFzdGVyL3JlY2lwZXMtY29yZS9jdXN0
b21pemF0aW9ucy9maWxlcy8uYmFzaF9oaXN0b3J5LXFlbXUtYW1kNjQiPmh0dHBzOi8vZ2l0aHVi
LmNvbS9zaWVtZW5zL2phaWxob3VzZS1pbWFnZXMvYmxvYi9tYXN0ZXIvcmVjaXBlcy1jb3JlL2N1
c3RvbWl6YXRpb25zL2ZpbGVzLy5iYXNoX2hpc3RvcnktcWVtdS1hbWQ2NDwvYT4pPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XYXluZTwv
ZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xh
c3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDM6NDMgUE0gUmFsZiBSYW1z
YXVlciAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUi
PnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPkhpLDxicj4NCjxicj4NCk9uIDYvMTIvMTkgOTozMiBQTSwgV2F5bmUgd3JvdGU6PGJy
Pg0KJmd0OyBJJiMzOTttIHNvcnJ5IGFib3V0IHRoZSBmb3JtYXR0aW5nLsKgIEl0IGRpZG4mIzM5
O3QgbG9vayBsaWtlIHRoYXQgYmVmb3JlIEkgc2VudCBpdC48YnI+DQomZ3Q7IDxicj4NCiZndDsg
SSB3aWxsIGRvdWJsZSBjaGVjayBteSBsaW51eC14ODYtZGVtbyBjZWxsIGNvbmZpZyBhZ2FpbiBm
b3IgdGhlIHNlcmlhbDxicj4NCiZndDsgSVJRIG1hcHBpbmcuIEFsc28gSSB3aWxsIGJ1aWxkIGlu
IHRoZSBDT05GSUdfQ1JBU0hfQ0VMTF9PTl9QQU5JQyBkZWZpbmU8YnI+DQomZ3Q7IGZvciBoZWxw
IGdvaW5nIGZvcndhcmQuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IENhbiB0aGUgJnF1b3Q7amFpbGhv
dXNlIGNlbGwgbGludXgmcXVvdDsgY29tbWFuZCB0YWtlIGFuIGluaXRyYW1mcyBpbWFnZSAoLmlt
Zyk8YnI+DQomZ3Q7IHRocm91Z2ggdGhlICZxdW90Oy1pIG9wdGlvbiZxdW90OyBvciBkb2VzIGl0
IG5lZWQgdG8gYmUgYW4gaW5pdHJkP8KgIElmIGluaXRyZDxicj4NCjxicj4NCkdvb2QgcXVlc3Rp
b24uIFRoZSAtaSBvcHRpb24gZG9lcyBub3RoaW5nIGVsc2UgdGhhbiBsb2FkaW5nIHRoZSBpbWFn
ZSAtPGJyPg0KYXMgYSBiaW5hcnkgLSB0byBhIFJBTSByZWdpb24gYW5kIHByb3BhZ2F0ZSBpdHMg
bG9jYXRpb24uIFNvIEkmIzM5O2QgYXNzdW1lPGJyPg0KdGhhdCBzdXBwb3J0IGZvciBkaWZmZXJl
bnQgZm9ybWF0cyBvbmx5IGRlcGVuZCBpZiB5b3VyIGtlcm5lbCBoYXM8YnI+DQpidWlsdGluIHN1
cHBvcnQgZm9yIHRoZSBldmVudHVhbCBmb3JtYXQuPGJyPg0KPGJyPg0KJmd0OyBvbmx5LCBjYW4g
eW91IHBvaW50IG1lIHRvIGFuIGV4YW1wbGUgeDg2IHJvb3Rmcy5jcGlvIGltYWdlP8KgIEkmIzM5
O20gaGF2aW5nPGJyPg0KJmd0OyB0cm91YmxlIGluc3RhbGxpbmcgQnVpbGRyb290IG9uIG15IG1h
Y2hpbmUuPGJyPg0KPGJyPg0KQnVpbGRyb290IGlzIHRoZSBwZXJmZWN0IHN3aXNzIGFybXkga25p
ZmUgZm9yIG5vbi1yb290IGluaXRyZHMuPGJyPg0KPGJyPg0KwqAgUmFsZjxicj4NCjxicj4NCiZn
dDsgPGJyPg0KJmd0OyBUaGFua3MgYWdhaW4sPGJyPg0KJmd0OyBXYXluZTxicj4NCiZndDsgPGJy
Pg0KJmd0OyBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAxOjE3IFBNIFJhbGYgUmFtc2F1ZXI8YnI+
DQomZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5k
ZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJy
Pg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5k
ZTwvYT4mZ3Q7Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoEhpIFdheW5l
LDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgT24gNi8xMi8xOSAzOjU1IFBNLCBXYXluZSB3
cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFJhbGYvSmFuLDxicj4NCiZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IMKgQXJlIHlvdSBzdXJlIHlvdSByZW1vdmUgdGhlIGRl
dmljZSBmcm9tIHRoZSBrZXJuZWwgY21kbGluZT8gKlllcyw8YnI+DQomZ3Q7wqAgwqAgwqB0aGVy
ZTxicj4NCiZndDvCoCDCoCDCoCZndDsgaXMgbm8gdHR5UyogZGV2aWNlIGluIG15IHJvb3QgbGlu
dXggY21kbGluZSo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IC0gQXJlIHlvdSBzdXJlIHRoYXQgdGhl
cmUgZG9lc24mIzM5O3Qgc3Bhd24gYSB0dHk/IENoZWNrIHdpdGg8YnI+DQomZ3Q7wqAgwqAgwqBz
eXN0ZW1jdGwuICpObzxicj4NCiZndDvCoCDCoCDCoCZndDsgdHR5IGFzIGZhciBhcyBJIGNhbiB0
ZWxsLCB2ZXJpZmllZCB3aXRoICZxdW90O2xzb2YgfCBncmVwIHR0eVMmcXVvdDsuwqAgVGhlIGxz
b2Y8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGNvbW1hbmQgc3RvcHMgd29ya2luZyBhZnRlciB0aGUg
Y3Jhc2ggdGhvdWdoKjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgcGxlYXNlIHVzZSBwbGFp
biB0ZXh0IG1haWxzLiBJdCYjMzk7cyBnZXR0aW5nIGhhcmQgdG8gcmVhZCA6LSk8YnI+DQomZ3Q7
IDxicj4NCiZndDvCoCDCoCDCoCZndDsgLSBsc29mIHwgZ3JlcCB0dHlTPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyAtIFRoZSByb290LWNlbGwgbWlnaHQgcmVjZWl2ZSB0aGUgc2VyaWFsIGRldmljZSYj
Mzk7cyBpbnRlcnJ1cHQsIHdoaWxlIGl0czxicj4NCiZndDvCoCDCoCDCoCZndDsgwqAgcG9ydHMg
YXJlIGFzc2lnbmVkIHRvIHRoZSBub24tcm9vdCBjZWxsLiBEb2VzIHRoZSBjcmFzaCBoYXBwZW4g
d2hlbjxicj4NCiZndDvCoCDCoCDCoCZndDsgwqAgeW91IHR5cGUgaW4gYSBjaGFyYWN0ZXIgdG8g
dGhlIHNlcmlhbCBsaW5lPyAqVGhpcyBpcyBwb3NzaWJsZSw8YnI+DQomZ3Q7wqAgwqAgwqBkbyB5
b3U8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGhhdmUgYW4gZXhhbXBsZSBvZiBob3cgSSB3b3VsZCBh
Y2NvbXBsaXNoIGFzc2lnbmluZyB0aGUgaW50ZXJydXB0PGJyPg0KJmd0O8KgIMKgIMKgKElSUSA0
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBmb3IgdHR5UzApIHRvIHRoZSBub24tcm9vdD/CoCBUbyBy
dWxlIG91dCB0aGUgaW50ZXJydXB0IGNvbmNlcm4uKjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKg
IMKgQ29tcGFyZSBsaW51eC14ODYtZGVtby5jLiBUaGUgLnBpbl9iaXRtYXAgZmllbGQgZGVub3Rl
cyB0aGUgaW50ZXJydXB0czxicj4NCiZndDvCoCDCoCDCoHRoYXQgYXJlIHJvdXRlZCB0byB0aGUg
Y2VsbC4gSWYgeW91IHVzZSB0aGUgb3JpZ2luYWwgbGludXgteDg2LWRlbW8uYyw8YnI+DQomZ3Q7
wqAgwqAgwqB0aGVuIGludGVycnVwdCA0IHNob3VsZCBhbHJlYWR5IGJlIHJvdXRlZCB0byB0aGUg
Y2VsbC48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoEFGQUlDVCwgaW4gbGludXgteDg2LWRl
bW8uYywgd2UgYXNzaWduIElSUSAzICZhbXA7IDQuIEluIHlvdXIgY2FzZSwgd2UgYWxzbzxicj4N
CiZndDvCoCDCoCDCoHJlbW92ZSB0aGUgb3RoZXIgSVJRIGZyb20gdGhlIHJvb3QgY2VsbCAtIElS
USAzIHNob3VsZCBiZSBjb21tZW50ZWQgb3V0Ljxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKg
QlRXLCBhIGhlbHBmdWwgZGVidWdnaW5nIGZlYXR1cmU6PGJyPg0KJmd0O8KgIMKgIMKgZWNobyAm
cXVvdDsjZGVmaW5lIENPTkZJR19DUkFTSF9DRUxMX09OX1BBTklDIDEmcXVvdDsgJmd0OyZndDs8
YnI+DQomZ3Q7wqAgwqAgwqBpbmNsdWRlL2h5cGVydmlzb3IvY29uZmlnLmg8YnI+DQomZ3Q7IDxi
cj4NCiZndDvCoCDCoCDCoFRoaXMgd2lsbCBsZXQgdGhlIHJvb3QgY2VsbCBwcmludCBhIHN0YWNr
ZHVtcCB3aGljaCBnaXZlcyB5b3UgYSBoaW50PGJyPg0KJmd0O8KgIMKgIMKgd2hhdCBjb2RlcGF0
aCBjYXVzZWQgdGhlIGNyYXNoLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDsgwqAgSW4gdGhpcyBjYXNlLCBhc3NpZ24gdGhlIGludGVycnVwdCB0
byB0aGUgbm9uLXJvb3QgY2VsbC4gWW91PGJyPg0KJmd0O8KgIMKgIMKgd2lsbCBuZWVkPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyDCoCBpdCBpbiBhbnkgY2FzZSB0aGVyZSBvbmNlIHlvdSBoYXZlIGEg
aW5pdHJkIGFuZCB3YW50IHRvIHR5cGUgaW48YnI+DQomZ3Q7wqAgwqAgwqBzdHVmZi48YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBTbyB0aGVyZSBtdXN0IGJlIHNv
bWUgcmVhc29uIHdoeSB0aGUgY3Jhc2ggaGFwcGVucy4gVGhlIGhhcmQgd2F5IGlzIHRvPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyBhZGQgODI1MC5ucl91YXJ0cz0wIGluIHlvdXIga2VybmVsIGNtZGxp
bmUgb2YgdGhlIHJvb3QgY2VsbC4gKkk8YnI+DQomZ3Q7wqAgwqAgwqBjYW4gdXNlPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyB0aGlzIG1ldGhvZCBmb3Igbm93IHRvIGNvbnRpbnVlIGJvb3RpbmcgdGhl
IG5vbi1yb290IGxpbnV4Lio8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyZndDvCoDxicj4NCiZndDvCoCDCoCDCoCZndDsmZ3Q7IMKgIMKgIMKgIMKgaWYgSSBsZWF2
ZSBvdXQgdGhlIHBpbyBtYXBwaW5nIGluIHRoZSBub24tcm9vdCBsaW51eCwgYW5kPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyZndDsgYWxvbG90aGF0IGJsb2NrIGluIHRoZSByb290IGNlbGwgaW5zdGVh
ZCB0aGVuIHRoZSBub24tcm9vdCBsaW51eDxicj4NCiZndDvCoCDCoCDCoGdldHMgYTxicj4NCiZn
dDvCoCDCoCDCoCZndDsmZ3Q7IFBJTyByZWFkIGZhdWx0IG9uICZxdW90OzB4M0Y5JnF1b3Q7IHdo
aWxlIGJvb3RpbmcuwqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7Jmd0OyDCoCDCoCDC
oCDCoFJhbGYgbWVudGlvbmVkIHRoYXQgTGludXggd291bGQgbm90IHRyeSBlbnVtZXJhdGUgdGhl
PGJyPg0KJmd0O8KgIMKgIMKgZGV2aWNlIGlmPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyZndDsgaXRz
IHNldCB0byAtMSAowqBbMHgzZjgvOCAuLi4gMHgzZmYvOF0gPSAtMSnCoCAsIGJ1dCB0aGUgbm9u
LXJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqBzZWVtcyB0bzxicj4NCiZndDvCoCDCoCDCoCZndDsmZ3Q7
IGF0dGVtcHQgdG8gZG8gc29tZXRoaW5nIHdpdGggaXQgYW55d2F5Ojxicj4NCiZndDvCoCDCoCDC
oCZndDsmZ3Q7wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7Jmd0OyAmcXVvdDtbIMKgIMKgMC45NTYx
NDZdU2VyaWFsOiA4MjUwLzE2NTUwIGRyaXZlciwgMSBwb3J0cywgSVJRIHNoYXJpbmc8YnI+DQom
Z3Q7wqAgwqAgwqBlbmFibGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyZndDsgJnF1b3Q7
RkFUQUw6IEludmFsaWQgUElPIHJlYWQsIHBvcnQ6IDNmOTogc2l6ZSAxJnF1b3Q7wqDCoDxicj4N
CiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEhtbS4gQXQgbGVhc3QgdGhh
dCYjMzk7cyB3aGF0IEkgdGhvdWdodC4gSSBkb24mIzM5O3Qga25vdyBob3cgZW51bWVyYXRpb24g
b2Y8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IHBsYXRmb3JtIGRldmljZXMgd29ya3MgZXhhY3RseSwg
YnV0IHJlY29uc2lkZXJpbmcgdGhpcywgdGhlIGJlaGF2aW91cjxicj4NCiZndDvCoCDCoCDCoCZn
dDsgYWJvdmUgbWFrZXMgc2Vuc2U6IEhvdyB3b3VsZCBpdCBrbm93IHRoYXQgYSBwbGF0Zm9ybSBk
ZXZpY2UgaXMgbm90PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBwcmVzZW50LCBkZXBlbmRpbmcgb2Yg
dGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHBpb19iaXRtYXAuwqA8YnI+DQomZ3Q7wqAgwqAgwqDC
oCpTaW5jZSBJIGRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyB0ZWNobmljYWxseSBoYXZlIHR3byBz
ZXJpYWwgcG9ydHMsIGlzIHRoZXJlIGEgd2F5ICh2aWEgY29tbWFuZCBsaW5lIG9yPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyBrZXJuZWwgY29uZmlnIGZvciBleCkgdG8gaGFyZGNvZGUgd2hhdCB0aGUg
bm9uLXJvb3Qgd291bGQ8YnI+DQomZ3Q7wqAgwqAgwqBlbnVtZXJhdGUgZm9yPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyB0aGUgVUFSVCB3aGVuIGl0cyBib290aW5nIHVwP8KgIE1lYW5pbmcsIGZvcmNl
IGl0IHRvICZxdW90O3NlZSZxdW90OyB0aGUgMHgyZjg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IHNl
cmlhbCBwb3J0IGFzIHR0eVMwIGluc3RlYWQgb2YgMHgzZjggd2hlbiBib290aW5nIHVwwqA8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7IGFuZCoqwqBDT05GSUdfU0VSSUFMXzgyNTBfUlVOVElNRV9VQVJU
UyA9IDEqKi7CoCBUaGF0IHdheSBpZiB5b3UgaGFkIHNheTxicj4NCiZndDvCoCDCoCDCoCZndDsg
dGhyZWUgc2VyaWFsIHBvcnRzIGFuZCB0aHJlZSBjZWxscyAoMSByb290LCAyIG5vbi1yb290IGxp
bnV4KSB0aGVuPGJyPg0KJmd0O8KgIMKgIMKgZWFjaDxicj4NCiZndDvCoCDCoCDCoCZndDsgY291
bGQgaGF2ZSB0aGVpciBvd24gc2VwYXJhdGUgZGVkaWNhdGVkIHR0eVMwLio8YnI+DQomZ3Q7IDxi
cj4NCiZndDvCoCDCoCDCoEhhdmUgYSBsb29rIGF0IHRoZSBkb2N1bWVudGF0aW9uIG9mIHRoZSA4
MjUwIGRyaXZlciwgZG9uJiMzOTt0IGtub3cgYnk8YnI+DQomZ3Q7wqAgwqAgwqBoZWFydC48YnI+
DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoEhUSCw8YnI+DQomZ3Q7wqAgwqAgwqDCoCBSYWxmPGJy
Pg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICo8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEFzIGZhciBhcyBqdXN0IGJvb3RpbmcgdGhlIG5vbi1yb290
IGJlc2lkZXMgdGhlIHNlcmlhbCBjb25jZXJuLCBJPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBoYXZl
biYjMzk7dCBwcm92aWRlZCBhbiBpbml0cmFtZnMgdG8gbXkgbm9uLXJvb3QgbGludXggeWV0LsKg
IEkgd291bGQ8YnI+DQomZ3Q7wqAgwqAgwqBsaWtlIHRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBw
cm9iYWJseSBib290IGl0IHdpdGggYSBzaW1wbGUgcmFtZGlzayBpZiBwb3NzaWJsZSB0byBnZXQg
YSBwb2ludDxicj4NCiZndDvCoCDCoCDCoHdoZXJlPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBJIGNh
biBsb2cgaW4uwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFRoYW5rcyw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFdh
eW5lPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgT24gV2VkLCBK
dW4gMTIsIDIwMTkgYXQgNjo0MyBBTSBSYWxmIFJhbXNhdWVyPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRh
cmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJl
Z2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJn
LmRlPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxm
LnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdl
dD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7Jmd0
OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgSGksPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oE9uIDYvMTEvMTkgMTE6MDUgUE0sIFdheW5lIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDsgSmFuL1JhbGYsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgSSB3YXMgYWJsZSB0byBnZXQgcGFzdCBp
c3N1ZXMgMSBhbmQgMyBhYm92ZSBieSB1c2luZyBKYW4mIzM5O3M8YnI+DQomZ3Q7wqAgwqAgwqBr
ZXJuZWw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBjb25maWc8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7IGZyb20gdGhpcyB0aHJlYWQ6PGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqDCoDxhIGhyZWY9Imh0dHBzOi8vZ3Jv
dXBzLmdvb2dsZS5jb20vZm9ydW0vIyFzZWFyY2hpbi9qYWlsaG91c2UtZGV2L1JlJDNBJDIwRmFp
bGVkJDIwdG8kMjBib290JDIwamFpbGhvdXNlJTdDc29ydDpyZWxldmFuY2UvamFpbGhvdXNlLWRl
di9NN1VPODlYRklrMC9RaTQwRER1TUJBQUoiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZm9ydW0vIyFzZWFyY2hpbi9qYWlsaG91c2Ut
ZGV2L1JlJDNBJDIwRmFpbGVkJDIwdG8kMjBib290JDIwamFpbGhvdXNlJTdDc29ydDpyZWxldmFu
Y2UvamFpbGhvdXNlLWRldi9NN1VPODlYRklrMC9RaTQwRER1TUJBQUo8L2E+JnF1b3Q7LsKgPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDsgVGhlIERNQSBpc3N1ZSB3YXMgcmVzb2x2ZWQgYnkgZGlzYWJsaW5nIGtlcm5lbDxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoG9wdGlvbsKgQ09ORklHX0lTQV9ETUFfQVBJPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBhcyBzdGF0ZWQgaW4gYW5vdGhlciB0aHJl
YWQsIGFuZCByZWZsZWN0ZWQgaW4gdGhlIGNvbmZpZzxicj4NCiZndDvCoCDCoCDCoGZpbGUgYWJv
dmUuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDsgU28gbm93IEkgdGhpbmsgaSYjMzk7dmUgYWxtb3N0IGdvdCB0aGUgbm9u
LXJvb3QgbGludXggYm9vdGluZy7CoCBJJiMzOTttPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgc3R1Y2sgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHRoZSBwb2ludCB3
aGVyZSBpdHMgdHJ5aW5nIHRvIG1vdW50IGEgZmlsZXN5c3RlbSBhbmQgc2luY2U8YnI+DQomZ3Q7
wqAgwqAgwqBpJiMzOTttIG5vdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgcHJv
dmlkaW5nIGFuIGluaXRyYW1mcyBpdCBwYW5pY3MuPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFBlcmZlY3QhPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7IFNpbWlsYXIgdG8gdGhlIG91dHB1dCBiZWxvdzo8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBbIDEuMDgw
MTc4XSBWRlM6IENhbm5vdCBvcGVuIHJvb3QgZGV2aWNlICZxdW90OyhudWxsKSZxdW90OyBvcjxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHVua25vd24tYmxvY2soMCwwKTo8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGVycm9yIC02PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyBbIDEuMDg3NjYyXSBQbGVhc2UgYXBwZW5kIGEgY29ycmVjdCAmcXVvdDtyb290
PSZxdW90OyBib290IG9wdGlvbjs8YnI+DQomZ3Q7wqAgwqAgwqBoZXJlIGFyZSB0aGU8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGF2YWlsYWJsZSBwYXJ0aXRpb25zOjxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgWyAxLjA5NjAxM10gS2VybmVsIHBhbmljIC0gbm90
IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRvIG1vdW50PGJyPg0KJmd0O8KgIMKgIMKgcm9vdDxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGZzIG9uPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0OyB1bmtub3duLWJsb2NrKDAsMCk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBJIGhhdmUganVzdCBhIGNvdXBs
ZSBtb3JlIHF1ZXN0aW9uczo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IDEuIElu
IGdlbmVyYWwsIGlzIGl0IHRydWUgdGhhdCBhbiBpbm1hdGUgd2lsbCB0YWtlb3ZlciBjb250cm9s
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgZnJvbSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7IHJvb3Qgb2YgYW55IHJlc291cmNlIGluIHRoZSBmb2xsb3dpbmcgYXJy
YXlzLCBvciBhcmUgdGhlcmU8YnI+DQomZ3Q7wqAgwqAgwqBzb21lIGNhc2VzPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB3aGVyZSB0aGV5IGdldCAmcXVvdDtzaGFyZWQmcXVvdDsg
YmV0d2VlbiB0aGUgcm9vdCBhbmQgaW5tYXRlPzxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBEZXBlbmRzLjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgQS4gJnF1b3Q7Lm1lbV9yZWdp
b25zJnF1b3Q7IC0mZ3Q7IFNoYXJlZD88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgTWF5IGJlIHNoYXJlZCB3aXRoIHRoZSByb290IGNlbGwgKGkuZS4s
IGlmIHRoZSByZWdpb24gaGFzIHRoZSBmbGFnPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
SkFJTEhPVVNFX01FTV9ST09UU0hBUkVEIHNldCkuPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqBCLiAmcXVvdDsuaXJxY2hpcHMm
cXVvdDsgLSZndDsgU2hhcmVkPzxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqBTaGFyZWQgd2l0aCB3aG9tPyBPbmx5IG9uZSBndWVzdCBydW5zIG9uIGEg
Q1BVLiBUaGlzIGd1ZXN0PGJyPg0KJmd0O8KgIMKgIMKgd2lsbCBoYXZlPGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgZnVsbCBhY2Nlc3MgdG8gdGhlIGlycWNoaXAuIFNvbWUgYWNjZXNzZXMg
bXVzdCBiZSBpbnRlcmNlcHRlZC48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoEMuICZxdW90Oy5waW9fYml0bWFwJnF1b3Q7IC0m
Z3Q7IElubWF0ZSB0YWtlcyBjb250cm9sIG9mIHRoZXNlIGlmPGJyPg0KJmd0O8KgIMKgIMKgbWF0
Y2hpbmc8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGJldHdlZW4gaW5tYXRlIGFu
ZCByb290PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oEV4Y2x1c2l2ZSBjb250cm9sLjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgRC4gJnF1b3Q7LnBjaV9kZXZpY2VzJnF1b3Q7IC0m
Z3Q7IElubWF0ZSB0YWtlcyBjb250cm9sPzxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqBFeGNsdXNpdmUgY29udHJvbC48YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoEUuICZxdW90Oy5w
Y2lfY2FwcyZxdW90OyAtJmd0OyBJbm1hdGUgdGFrZXMgY29udHJvbD88YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgRXhjbHVzaXZlIGNvbnRyb2wuPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IDIuIEFsb25nIHRoZSBzYW1lIGxpbmVzLCBn
b2luZyBiYWNrIHRvIG15IHR0eVMwIGlzc3VlPGJyPg0KJmd0O8KgIMKgIMKgbWVudGlvbmVkIGFi
b3ZlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB3aGlsZSB0cnlpbmcgdG8gc2hh
cmUgaXQ6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBJZiBJIGFsbG9jYXRlIHRoZSBmb2xsb3dpbmcg
dG8gdGhlIGxpbnV4IG5vbiByb290PGJyPg0KJmd0O8KgIMKgIMKgY2VsbCAoYW5kIHNldDxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgdG8gLTEgaW4gdGhlIHJvb3QpPGJyPg0KJmd0
O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoEJUVywgdGhlcmUmIzM5
O3MgZ2VuZXJhbGx5IG5vIG5lZWQgdG8gc2V0IC0xIGluIHRoZSByb290IGNlbGwgLS08YnI+DQom
Z3Q7wqAgwqAgwqBpdCB3aWxsIGJlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgdGFrZW4g
YXdheSB3aGVuIHRoZSBub24tcm9vdCBjZWxsIGlzIGNyZWF0ZWQuPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAucGlvX2JpdG1h
cCA9IHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIMKgIFsw
eDNmOC84IC4uLiAweDNmZi84XSA9IDB4MDDCoCDCoC8qIHNlcmlhbCAyKi88YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKg
VGhlbiBvbiB0aGUgcm9vdCBjZWxsIEkgcmFuZG9tbHkgZ2V0IGEgUElPIHJlYWQgZmF1bHQgb248
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmcXVvdDsweDNGRSZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDsgd2hlbiB0aGUgbm9uLXJvb3QgaXMgYm9vdGluZywgaSYj
Mzk7bSBub3Qgc3VyZSB3aGF0IHByb2Nlc3MgaXM8YnI+DQomZ3Q7wqAgwqAgwqBjYXVzaW5nPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgdGhpcy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgLSBBcmUgeW91IHN1cmUgeW91IHJlbW92ZSB0aGUg
ZGV2aWNlIGZyb20gdGhlIGtlcm5lbCBjbWRsaW5lPzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoC0gQXJlIHlvdSBzdXJlIHRoYXQgdGhlcmUgZG9lc24mIzM5O3Qgc3Bhd24gYSB0dHk/IENo
ZWNrIHdpdGg8YnI+DQomZ3Q7wqAgwqAgwqBzeXN0ZW1jdGwuPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgLSBsc29mIHwgZ3JlcCB0dHlTPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
LSBUaGUgcm9vdC1jZWxsIG1pZ2h0IHJlY2VpdmUgdGhlIHNlcmlhbCBkZXZpY2UmIzM5O3MgaW50
ZXJydXB0LDxicj4NCiZndDvCoCDCoCDCoHdoaWxlIGl0czxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoMKgIHBvcnRzIGFyZSBhc3NpZ25lZCB0byB0aGUgbm9uLXJvb3QgY2VsbC4gRG9lcyB0
aGUgY3Jhc2g8YnI+DQomZ3Q7wqAgwqAgwqBoYXBwZW4gd2hlbjxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoMKgIHlvdSB0eXBlIGluIGEgY2hhcmFjdGVyIHRvIHRoZSBzZXJpYWwgbGluZT88
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgwqAgSW4g
dGhpcyBjYXNlLCBhc3NpZ24gdGhlIGludGVycnVwdCB0byB0aGUgbm9uLXJvb3QgY2VsbC4gWW91
PGJyPg0KJmd0O8KgIMKgIMKgd2lsbCBuZWVkPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
wqAgaXQgaW4gYW55IGNhc2UgdGhlcmUgb25jZSB5b3UgaGF2ZSBhIGluaXRyZCBhbmQgd2FudCB0
byB0eXBlPGJyPg0KJmd0O8KgIMKgIMKgaW4gc3R1ZmYuPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFNvIHRoZXJlIG11c3QgYmUgc29tZSByZWFzb24g
d2h5IHRoZSBjcmFzaCBoYXBwZW5zLiBUaGUgaGFyZDxicj4NCiZndDvCoCDCoCDCoHdheSBpcyB0
bzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGFkZCA4MjUwLm5yX3VhcnRzPTAgaW4geW91
ciBrZXJuZWwgY21kbGluZSBvZiB0aGUgcm9vdCBjZWxsLjxicj4NCiZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoGlmIEkgbGVhdmUgb3V0IHRoZSBwaW8gbWFwcGluZyBpbiB0
aGUgbm9uLXJvb3QgbGludXgsIGFuZDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsg
YWxvbG90aGF0IGJsb2NrIGluIHRoZSByb290IGNlbGwgaW5zdGVhZCB0aGVuIHRoZSBub24tcm9v
dCBsaW51eDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGdldHMgYTxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDsgUElPIHJlYWQgZmF1bHQgb24gJnF1b3Q7MHgzRjkmcXVvdDsg
d2hpbGUgYm9vdGluZy7CoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqBSYWxmIG1lbnRpb25lZCB0aGF0IExpbnV4IHdvdWxkIG5vdCB0cnkgZW51
bWVyYXRlIHRoZTxicj4NCiZndDvCoCDCoCDCoGRldmljZSBpZjxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDsgaXRzIHNldCB0byAtMSAowqBbMHgzZjgvOCAuLi4gMHgzZmYvOF0gPSAt
MSnCoCAsIGJ1dCB0aGUgbm9uLXJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBzZWVt
cyB0bzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgYXR0ZW1wdCB0byBkbyBzb21l
dGhpbmcgd2l0aCBpdCBhbnl3YXk6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgJnF1b3Q7WyDCoCDCoDAuOTU2MTQ2XVNl
cmlhbDogODI1MC8xNjU1MCBkcml2ZXIsIDEgcG9ydHMsIElSUSBzaGFyaW5nPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgZW5hYmxlZCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDsgJnF1b3Q7RkFUQUw6IEludmFsaWQgUElPIHJlYWQsIHBvcnQ6IDNmOTogc2l6ZSAx
JnF1b3Q7wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgSG1tLiBBdCBsZWFzdCB0aGF0JiMzOTtzIHdoYXQgSSB0aG91Z2h0LiBJIGRvbiYjMzk7dCBr
bm93IGhvdzxicj4NCiZndDvCoCDCoCDCoGVudW1lcmF0aW9uIG9mPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgcGxhdGZvcm0gZGV2aWNlcyB3b3JrcyBleGFjdGx5LCBidXQgcmVjb25zaWRl
cmluZyB0aGlzLCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqBiZWhhdmlvdXI8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqBhYm92ZSBtYWtlcyBzZW5zZTogSG93IHdvdWxkIGl0IGtub3cgdGhhdCBh
IHBsYXRmb3JtIGRldmljZSBpcyBub3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBwcmVz
ZW50LCBkZXBlbmRpbmcgb2YgdGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHBpb19iaXRtYXAuPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoEFueXdheSwg
ODI1MCBkcml2ZXJzIGhhdmUgc29tZSBjbWRsaW5lIHBhcmFtZXRlcnMgdGhhdCBjYW4gYmU8YnI+
DQomZ3Q7wqAgwqAgwqB1c2VkIHRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgY29udHJv
bCBpbml0aWFsaXNhdGlvbiAoZS5nLiwgc2VlIHRoZSBucl91YXJ0cyBwYXJhbWV0ZXJzIGFib3Zl
KS48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBJcyBpdCBwb3Nz
aWJsZSB0byBtYXAgdGhlIHNhbWUgcGlvIGJsb2NrIGluIGJvdGggdGhlPGJyPg0KJmd0O8KgIMKg
IMKgcm9vdCBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IG5vbi1yb290IHdp
dGggYSBkaWZmZXJlbnQgbWFzaz/CoCBPciBkb2VzIHRoZSBub24tcm9vdCBqdXN0PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgb3ZlcnJpZGUgaXQ/wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7IEl0IHNlZW1zIGxpa2UgdGhlIGxhdHRlciBpcyB0cnVlLsKgwqDCoDxicj4N
CiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBFeGFjdGx5LiBU
aGF0JiMzOTtzIG5vdCBhKSBwb3NzaWJsZSwgYW5kIGIpIGRvZXMgbm90IHJlYWxseSBtYWtlPGJy
Pg0KJmd0O8KgIMKgIMKgc2Vuc2UuPGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoMKgIFJhbGY8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsg
VGhhbmtzIGFnYWluIEphbiBhbmQgUmFsZiBmb3IgeW91ciBoZWxwIGdldHRpbmcgdG8gdGhpcyBw
b2ludC48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgT24gVHVl
LCBKdW4gMTEsIDIwMTkgYXQgMjoxMyBQTSBXYXluZTxicj4NCiZndDvCoCDCoCDCoCZsdDs8YSBo
cmVmPSJtYWlsdG86cmFjZWRyaXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWNl
ZHJpdmUxNTAzQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFjZWRy
aXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWNlZHJpdmUxNTAzQGdtYWlsLmNv
bTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86cmFjZWRyaXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWNlZHJp
dmUxNTAzQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFjZWRyaXZl
MTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWNlZHJpdmUxNTAzQGdtYWlsLmNvbTwv
YT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86cmFjZWRyaXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5y
YWNlZHJpdmUxNTAzQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzpyYWNlZHJpdmUxNTAzQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJh
Y2Vkcml2ZTE1MDNAZ21haWwuY29tPC9hPiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
cmFjZWRyaXZlMTUwM0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWNlZHJpdmUxNTAzQGdt
YWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpy
YWNlZHJpdmUxNTAzQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhY2Vkcml2ZTE1MDNAZ21h
aWwuY29tPC9hPiZndDsmZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB3
cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgSmFuICZhbXA7IFJhbGY6PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oEkgaGF2ZSBhIGxpdHRsZSBnb29kIG5ld3MsIEkgaGF2ZSBzdWNjZXNzZnVsbHkgZ290dGVuPGJy
Pg0KJmd0O8KgIMKgIMKgdGhlIG5vbi1yb290PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgbGludXggdG8gZGlzcGxheSBzb21lIHN0YXJ0dXAgb3V0cHV0IGJhc2VkIG9u
IHlvdXI8YnI+DQomZ3Q7wqAgwqAgwqBzdWdnZXN0aW9ucy7CoDxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoEFsc28sIHRoZXJlIG11c3QgaGF2ZSBiZWVuIHNvbWUgc21h
bGwgZGlmZmVyZW5jZSBiZXR3ZWVuPGJyPg0KJmd0O8KgIMKgIMKgdGhlIHN0b2NrPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgbGludXgteDg2LWRlbW8gY2VsbCBjb25m
aWcgYW5kIHRoZSBvbmUgSSB0d2Vha2VkLsKgIEk8YnI+DQomZ3Q7wqAgwqAgwqB3ZW50IGJhY2sg
dG88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB0aGUgb3JpZ2luYWwg
YW5kIG1hZGUgc29tZSBtaW5vciBjaGFuZ2VzIGFuZCBpdCBzdGFydGVkPGJyPg0KJmd0O8KgIMKg
IMKgZGlzcGxheWluZzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHRo
ZSBzZXJpYWwgb3V0cHV0IG5vdyBmb3IgdGhlIG5vbi1yb290IG5vZGUuPGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoEkgZW5kZWQgdXAgbWFraW5nIHRoZSByb290IGNlbGwgdGhlIHByaW1hcnkgdXNlciBvZiB0
aGU8YnI+DQomZ3Q7wqAgwqAgwqB0dHlTMDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoGRldmljZSwgYW5kIGp1c3QgaGF2aW5nIHRoZSBub24tcm9vdCBsaW51eCBvdXRw
dXQgdG8gdGhlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgaHlwZXJ2aXNvcjxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHZpcnR1YWwgY29uc29sZSAoY29uc29s
ZT1qYWlsaG91c2UpLsKgIEluIG15IHNldHVwLCB0aGVyZTxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoGFwcGVhcnMgdG88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqBiZSBzb21lIHByb2Nlc3Mgc3RpbGwgYXR0ZW1wdGluZyB0byB1c2UgdGhlIHR0eVMwPGJyPg0K
Jmd0O8KgIMKgIMKgcmFuZG9tbHkgb24gdGhlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgcm9vdCBsaW51eCwgYW5kIHRoYXQgY2F1c2VzIHRoZSBoeXBlcnZpc29yIHRv
IGhhbHQgaXQgaWY8YnI+DQomZ3Q7wqAgwqAgwqBJIGRvbiYjMzk7dDxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGxlYXZlIGl0IGluIHRoZSBQSU8gYXJyYXkuwqAgTm90
IHN1cmUgd2hvIGlzIGRvaW5nIGl0Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgVGhpcyBpcyB3aGVyZSBpJiMzOTttIGF0IG5vdy7CoCBUaGUgbm9u
LXJvb3QgbGludXgga2VlcHM8YnI+DQomZ3Q7wqAgwqAgwqBydW5uaW5nIGludG88YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBwb2ludHMgd2hlcmUgaXQgdHJpZXMgdG8g
YWNjZXNzIFBJTyBhbmQgZ2V0cyBwYXJrZWQ6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoDEuIEZpcnN0IGNy
YXNoOjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBbIMKgIMKgMC40MjQ5MjVda3dvcmtlci91NjowICgyNykg
dXNlZCBncmVhdGVkIHN0YWNrPGJyPg0KJmd0O8KgIMKgIMKgZGVwdGg6IDE0NjU2PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgYnl0ZXMgbGVmdDxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFsgwqAgwqAwLjQyNTgwN11mdXRleCBoYXMgdGFi
bGUgZW50cmllczogMTAyNCAob3JkZXI6IDQsIDY1NTM2PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgYnl0ZXMpPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJnF1
b3Q7RkFUQUw6IEludmFsaWQgUElPIHdyaXRlLCBwb3J0OiA3MDogc2l6ZSAxJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgLi4uPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgUGFya2luZyBDUFUgMyAoQ2VsbDogJnF1b3Q7bGludXgt
eDg2LWRlbW8mcXVvdDspPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoEFjY29yZGluZyB0byAvcHJvYy9pb3Bv
cnRzLCA3MCBoYXMgdG8gZG8gd2l0aCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqBSZWFsdGltZSBjbG9j
azxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoChydGMwKS7CoCBJIHdh
cyBhYmxlIHRvIHRlbXBvcmFyaWx5IGFkZCB0aGUgNzAgbWFwcGluZyB0byB0aGU8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBub24tcm9vdCBsaW51eCwgYnV0IHNob3Vs
ZCBpdCBiZSB0aGVyZSBhdCBhbGw/wqAgSSB0cmllZDxicj4NCiZndDvCoCDCoCDCoHRvIGRpc2Fi
bGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBSVEMgc3VwcG9ydCBp
biB0aGUgZ3Vlc3Qga2VybmVsIGNvbmZpZy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoDIuIE9uIHRoZSBuZXh0IGF0dGVtcHQsIEkgdGhlbiBnb3Qg
ZnVydGhlciB3aXRoIGEgY3Jhc2g8YnI+DQomZ3Q7wqAgwqAgwqB0cnlpbmcgdG88YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBpbml0aWFsaXplIFNlciBkZXZpY2UgdHR5
UzA6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZxdW90O1sgwqAgwqAwLjk1NjE0Nl1TZXJpYWw6IDgyNTAv
MTY1NTAgZHJpdmVyLCAxIHBvcnRzLCBJUlE8YnI+DQomZ3Q7wqAgwqAgwqBzaGFyaW5nPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgZW5hYmxlZCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZxdW90O0ZBVEFMOiBJbnZhbGlkIFBJTyByZWFkLCBwb3J0
OiAzZjk6IHNpemUgMSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoC4uLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFBhcmtpbmcg
Q1BVIDMgKENlbGw6ICZxdW90O2xpbnV4LXg4Ni1kZW1vJnF1b3Q7KTxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqBJIGNhbiBnZXQgYXJvdW5kIHRoYXQgaWYgSSBhbGxvdyB0aGUgbm9uLXJvb3QgYWNjZXNzIGlu
PGJyPg0KJmd0O8KgIMKgIMKgaXRzIHBpbzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoHRhYmxlLCBidXQgdGhlbiBJIGhhdmUgYSBwcm9ibGVtIGFib3ZlIHdpdGggdGhl
IHJvb3QgbGludXg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqByYW5kb21seTxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHRyeWluZyB0byB1c2UgaXQuPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAzLiBOb3cgd2l0
aCB0aGUgdGVtcG9yYXJ5IGFkanVzdG1lbnRzIHRvIHRoZSBub24tcm9vdDxicj4NCiZndDvCoCDC
oCDCoHBpbyB0YWJsZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGFi
b3ZlIEkgZ2V0IGhlcmU6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZxdW90O1sgwqAgwqAwLjk3MjM5OV1j
bG9ja3NvdXJjZTpTd2l0Y2hlZCB0byBjbG9ja3NvdXJjZSB0c2MmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmcXVvdDtGQVRBTDogSW52YWxpZCBQSU8gcmVh
ZCwgcG9ydDogODc6IHNpemUgMSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoC4uLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFBh
cmtpbmcgQ1BVIDMgKENlbGw6ICZxdW90O2xpbnV4LXg4Ni1kZW1vJnF1b3Q7KTxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqBBY2NvcmRpbmcgdG8gcHJvYy9pb3BvcnRzIHRoaXMgb25lIGhhcyB0byBkbyB3aXRo
ICZxdW90O2RtYSBwYWdlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
cmVxdWVzdCZxdW90Oy4gSXQgaXNuJiMzOTt0IG1hcHBlZCBpbiBteSByb290IGxpbnV4IFBJTyBv
ciBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGxpbnV4IGFycmF5Ljxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgQXNpZGUgZnJv
bSB0aGUgc2VyaWFsIGNvbmZsaWN0LCBpdCBzZWVtcyBsaWtlIHRoZXNlPGJyPg0KJmd0O8KgIMKg
IMKgc2hvdWxkIHJlbWFpbjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oGNvbnRyb2xsZWQgYnkgdGhlIHJvb3QgbGludXggb3IgaHlwZXJ2aXNvci7CoCDCoERvIHlvdSB1
c2UgYTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHBhcnRpY3VsYXIg
YmFyZSBtaW5pbXVtIHg4NiBrZXJuZWwgY29uZmlnIG9uIHlvdXI8YnI+DQomZ3Q7wqAgwqAgwqBt
YWNoaW5lIGZvciB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBn
dWVzdCB0byBnZXQgYXJvdW5kIHRoZXNlP8KgIEkga25vdyBKYW4gbWVudGlvbmVkIHRoZTxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGphaWxob3VzZS1pbWFnZXMgcHJv
amVjdCBtaWdodCBoYXZlIHNvbWV0aGluZywgYnV0IEk8YnI+DQomZ3Q7wqAgwqAgwqBjb3VsZG4m
IzM5O3QgZmluZDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGl0IGRp
Z2dpbmcgYXJvdW5kIHF1aWNrLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBUaGFua3MgdG8geW91IGJvdGgg
Zm9yIHlvdXIgcmVzcG9uc2VzIGFuZCBwYXRpZW5jZS7CoCBJPGJyPg0KJmd0O8KgIMKgIMKgZ290
IHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBsaW51eCB1cCBhbmQgZ29pbmcgb24gbXkgb3duLCBidXQg
dGhlIG5vbi1yb290IGd1ZXN0IGlzPGJyPg0KJmd0O8KgIMKgIMKgcHJvdmluZyB0bzxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGJlIG1vcmUgZGlmZmljdWx0Ljxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqBXYXluZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoE9uIFR1ZSwg
SnVuIDExLCAyMDE5IGF0IDExOjMxIEFNIFJhbGYgUmFtc2F1ZXI8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJh
bXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNi
dXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwv
YT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNh
dWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgt
cmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJl
Z2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJn
LmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYu
cmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVy
QG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRl
IiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+
DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90
aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5z
YnVyZy5kZTwvYT4mZ3Q7Jmd0OyZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqBIaSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgT24gNi8xMC8xOSA3OjQ1IFBNLCBXYXluZSB3
cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
IFRoYW5rIHlvdSBmb3IgeW91ciByZXNwb25zZXMgUmFsZiBhbmQgSmFuLjxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IFllcywgSSBoYXZlIHN1Y2Nlc3NmdWxs
eSBnb3R0ZW4gYm90aCB0aGUgYXBpYy1kZW1vIGFuZDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoHRpbnktZGVtbyBjZWxsczxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgdG8gd29yayBvbiBteSBzeXN0ZW0gYmVm
b3JlIGF0dGVtcHRpbmcgdG8gbG9hZCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqBub24tcm9vdDxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGxpbnV4LsKgIEk8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IGNhbiBzZWUg
c2VyaWFsIG91dHB1dCBmcm9tIHRoZW0uPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDsgSG93ZXZlciwgaWYgSSB0cnkgdG8gc2hhcmUgdGhlIFVBUlQgYmV0d2Vl
biByb290PGJyPg0KJmd0O8KgIMKgIMKgYW5kIGlubWF0ZTxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGZvciB0aGVtIEk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IHJ1biBpbnRvIGEgY3Jhc2ggb24gdGhlIGh5
cGVydmlzb3IgaWYgdGhlIHJvb3QgbGludXg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBh
dHRlbXB0czxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHRv
IHdyaXRlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0
OyB0byB0aGUgVUFSVCAoYWZ0ZXIgY3JlYXRpbmcvc3RhcnRpbmcgYSBkZW1vKS7CoDxicj4NCiZn
dDvCoCDCoCDCoERvZXMgdGhlIHJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqBsaW51eCBsb3NlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0OyBhY2Nlc3Mgb25jZSBhbiBpbm1hdGUgaXMgY3JlYXRlZC9zdGFy
dGVkP8KgIE9yIGFtIEk8YnI+DQomZ3Q7wqAgwqAgwqBtaXNzaW5nPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgc29tZXRoaW5nPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBmcm9tIG15IFN5c3RlbSBjb25maWcg
b3IgdGlueS1kZW1vIGNvbmZpZyB0aGF0IGFsbG93czxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoHRoZW0gdG88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqBzaGFyZT/CoCBJPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0OyBhdHRhY2hlZCB0aGUgY3Jhc2ggaW4gaHlwZXJ2aXNvcl9vdXRwdXQudHh0Ljxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IEFsc28sIEkgbm90aWNl
ZCB0aGUgdGlueS1kZW1vIG91dHB1dCBvbiB0aGUgVUFSVCBnZXRzPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgbWlycm9yZWQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBvbiB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgWWVzLCBhY2NvcmRpbmcg
dG8geW91ciBjb25maWcsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgSkFJTEhPVVNFX0NFTExfVklSVFVBTF9DT05TT0xFX0FDVElWRSBpczxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHNldC4gVGhpcyBtZWFucyB0aGF0
IHRoZSBndWVzdCB3aWxsIHVzZSB0aGUgdmlydHVhbDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoGNvbnNvbGUuIFRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoHZpcnR1YWw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqBjb25zb2xlIHVzZXMgdGhlIGh5cGVydmlzb3Igb3V0cHV0IHdoaWNoIGRlcGVuZHM8YnI+
DQomZ3Q7wqAgwqAgwqB3aGF0ZXZlcjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGlzIHNl
dDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGluIHlvdXI8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBzeXN0ZW0gY29u
ZmlndXJhdGlvbi4gSW4geW91ciBjYXNlIHRoZSBoeXBlcnZpc29yPGJyPg0KJmd0O8KgIMKgIMKg
dXNlcyAzZjguPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoEFuZCBhZGRpdGlvbmFsbHksIHRoZSBp
bm1hdGUgYWxzbyBhIHZhbGlkIC5jb25zb2xlPGJyPg0KJmd0O8KgIMKgIMKgc2V0LiBBZ2Fpbiw8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAzZjguIFRoaXM8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBtZWFucywgaXQg
d2lsbCB1c2UgdGhlIGNvbnNvbGUgKmFuZCogdGhlIGh5cGVydmlzb3I8YnI+DQomZ3Q7wqAgwqAg
wqBkZWJ1Zzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGh5
cGVyY2FsbC4gSW48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqB5b3VyIGNhc2UsIGJvdGggb3V0cHV0cyBhcmUgcm91dGVkIHRvIHRoZSBzYW1lPGJyPg0KJmd0
O8KgIMKgIMKgZGV2aWNlIHdoaWNoPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgZXhwbGFpbnMgdGhlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgbWlycm9yaW5nLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IEph
aWxob3VzZSB2aXJ0dWFsIGNvbnNvbGUuwqAgRG9lcyB0aGF0IG1lYW4gdGhhdCBpdHM8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB3cml0aW5nIHRvIHRoZTxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgc2VyaWFsIHRocm91Z2ggdGhlIGh5cGVy
dmlzb3IgYW5kIG5vdCBkaXJlY3RseTxicj4NCiZndDvCoCDCoCDCoGFjY2Vzc2luZzxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoHR0eVMwPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgaXRzZWxmPzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBFeGFjdGx5
Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IElmIHNvLCBpcyB0aGVyZSBhIHdheSB0byBj
cmVhdGUgdGhlIGNlbGwgdG8gd3JpdGU8YnI+DQomZ3Q7wqAgwqAgwqB0dHlTMDxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGRpcmVjdGx5IGFzIGE8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IHRlc3Q/wqAgVG8g
c2VlIGlmIGl0IGV4aGliaXRzIHNhbWUgYmVoYXZpb3IgYXMgdGhlPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgbm9uLXJvb3QgbGludXguPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoFN1cmUs
IHNpbXBseSBhbGlnbiB0aGUgLmFkZHJlc3MgZmllbGQgb2YgLmNvbnNvbGUsPGJyPg0KJmd0O8Kg
IMKgIMKgYW5kIGFsbG93PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgYWNjZXNzIHRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgdGhhdCBwb3J0IHZpYSAucGlvX2JpdG1hcC48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsg
RllJLCBJIGNyZWF0ZSB0aGUgdGlueS1kZW1vIGxpa2UgdGhpczo8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyBqYWlsaG91c2UgY2VsbCBjcmVhdGUgY29uZmln
cy94ODYvdGlueS1kZW1vLmNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7IGphaWxob3VzZSBjZWxsIGxvYWQgdGlueS1kZW1vPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgaW5tYXRlcy9kZW1vcy94ODYvdGlueS1kZW1vLmNlbGwgwqA8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IGphaWxob3Vz
ZSBjZWxsIHN0YXJ0IHRpbnktZGVtbzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAmZ3Q7IEdvaW5nIGJhY2sgdG8gbXkgb3JpZ2luYWwgbm9uLXJvb3QgbGludXggcXVl
c3Rpb24sIEk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBkb24mIzM5O3Qgc2VlIGFueTxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgb3V0cHV0
IHdoZW4gY29ubmVjdGVkIG92ZXIgdHR5UzAuwqAgSXRzIGFkZHJlc3MgaXM8YnI+DQomZ3Q7wqAg
wqAgwqAweDNmODxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCgmcXVvdDtzZXJpYWwgMSZxdW90OykgaW48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IHRoZSBQSU8sIGFuZCB0aGF0IHNlZW1zIHRvIHdvcmsgZmlu
ZSBmb3IgdGhlIG90aGVyPGJyPg0KJmd0O8KgIMKgIMKgc2ltcGxlPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgZGVtb3MsIG1pbnVzPGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyB0aGUgaHlwZXJ2aXNvciBjcmFz
aCBpc3N1ZSBhYm92ZSB3aGVuIHNoYXJpbmcuwqAgSTxicj4NCiZndDvCoCDCoCDCoGtub3cgdGhl
cmU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBpcyB0aGU8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IG90aGVy
ICZxdW90O3NlcmlhbCAyJnF1b3Q7IHBvcnQgYnV0IEkgaGF2ZW4mIzM5O3QgdHJpZWQgdG8gdXNl
PGJyPg0KJmd0O8KgIMKgIMKgdGhhdCBvbmUuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoEkgc2Vl
IHRoYXQgcG9ydCBvbiBvdXIgRGVsbCBzZXJ2ZXIgYXMgd2VsbC4gSXQmIzM5O3M8YnI+DQomZ3Q7
wqAgwqAgwqBwcmVzZW50LDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGJ1dCBJPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgZG9uJiMzOTt0PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKga25vdyB3aGVyZSBpdCYj
Mzk7cyBjb25uZWN0ZWQgdG8uPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoExldCBtZSBqdXN0IHN1
bW1hcmlzZSB5b3VyIGlzc3VlOjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBZb3Ugb25seSBoYXZl
IG9uZSBzZXJpYWwgbGluZSBhdmFpbGFibGUsIHJpZ2h0PyBGcm9tIHRoZTxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoHJvb3QtY2VsbCYjMzk7czxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoFBPViwgaXQmIzM5O3MgdHR5UzAgb24gM2Y4Ljxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqBJIHdvdWxkIHByb3Bvc2UgdG8gc2hhcmUgdHR5UzAgYmV0d2VlbiB0
aGU8YnI+DQomZ3Q7wqAgwqAgwqBoeXBlcnZpc29yIGFuZDxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoG5vbi1yb290PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgTGludXguIFRoaXMgbWVhbnM6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoMKgIC0gRG9u
JiMzOTt0IGxldCB0aGUgcm9vdC1jZWxsIHVzZSB0dHlTMC4gUmVtb3ZlIGFueTxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoGNvbnNvbGU9dHR5UzA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqDCoCDCoCBwYXJhbWV0ZXJzIGZyb20geW91IGNvbW1hbmRs
aW5lLiBFbnN1cmUgdGhhdCBub29uZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGVsc2Ug
YWNjZXNzZXM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqDC
oCDCoCB0dHlTMCAoZS5nLiwgZ2V0dHlAdHR5UzAgb3Igb3RoZXIgZnJpZW5kcyk8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgwqAgLSBTZXQgM2Y4IGFzIGRlYnVnX2NvbnNvbGUgaW4geW91ciBtYXN0
ZXIuYyAoc2VlbXMgeW91PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgYWxyZWFkeTxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGhhdmUpPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoMKgIC0gQWxsb3cgM2Y4IGFjY2VzcyBpbiB0aGUgbGludXgtZGVtby5j
IChhbHJlYWR5IHNldCBpbjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHRoZSBkZWZhdWx0
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgwqAgwqAgbGlu
dXgtZGVtbzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqDCoCAtIERpc2FsbG93IDJmOCBhY2Nlc3Mg
aW4gbGludXgtZGVtby5jOjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFsgMHgyZjgvOCAuLi7CoCAweDJmZi84XSA9
IDAsIC8qPGJyPg0KJmd0O8KgIMKgIMKgc2VyaWFsMiAqLzxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFsgMHgyZjgv
OCAuLi7CoCAweDJmZi84XSA9IC0xLCAvKjxicj4NCiZndDvCoCDCoCDCoHNlcmlhbDIgKi88YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgwqAgwqAgSSBkb24mIzM5O3Qga25vdyBob3cgTGludXggZW51
bWVyYXRlcyBzZXJpYWw8YnI+DQomZ3Q7wqAgwqAgwqBkZXZpY2VzLCBidXQgdGhpczxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoGVuc3VyZXM8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqDCoCDCoCB0aGF0IExpbnV4IHdv
biYjMzk7dCBzZWUgdGhlIHVuY29ubmVjdGVkIHNlcmlhbCBsaW5lPGJyPg0KJmd0O8KgIMKgIMKg
YW5kIG1hcDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHR0
eVMwIHRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgwqAg
wqAgM2Y4PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IG5vbiByb290IGxpbnV4IGxhdW5jaGVkIHdp
dGg6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0OyAv
dG9vbHMvamFpbGhvdXNlIGNlbGwgbGludXggY29uZmlncy94ODYvbGludXgteDg2LmNlbGw8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IC9ib290L3Zt
bGludXgtNC4xLjE2LUd1ZXN0IC1jICZxdW90O2NvbnNvbGU9dHR5UzAsMTE1MjAwJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoFRoZW4sIHRoaXMgc2hvdWxkIGFjdHVhbGx5IHdvcmsuLi48
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgQW5kIGlmIG5vdCwgdGhlbiBjb25zb2xlPWphaWxob3Vz
ZTAgc2hvdWxkIHdvcmsuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IEkgY2FuIHRyeSB0aGUgNC4x
OSBzaWVtZW5zIGtlcm5lbCBhbmQgJnF1b3Q7bmV4dCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoGJy
YW5jaCBmb3I8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBq
YWlsaG91c2UgeW91PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0OyBzdWdnZXN0ZWQuwqAgRG8geW91IHRoaW5rIHRoYXQgY29tYmluYXRpb24gd2lsbCBy
ZXNvbHZlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgdGhlIG1pc3Npbmc8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IHNlcmlhbCBmb3IgdGhl
IG5vbi1yb290IGxpbnV4P8KgIE90aGVyd2lzZSwgZGlkIG15PGJyPg0KJmd0O8KgIMKgIMKga2Vy
bmVsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgY29uZmln
LCBzeXN0ZW08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7IGNvbmZpZywgYW5kIG5vbi1yb290IGxpbnV4IGNlbGwgY29uZmlncyBsb29rIE9LPzxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqBJIGRpZG4mIzM5O3QgbG9vayBhdCBpdCwgYnV0IHdlIHNob3Vs
ZCBhdCBsZWFzdCAtIGV2ZW48YnI+DQomZ3Q7wqAgwqAgwqBpZiBzb21lPGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgZmxhZ3MgYXJlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgc3RpbGwgaW5jb3JyZWN0IC0gc2VlIHRoZSAmcXVvdDtVbmNvbXByZXNz
aW5nIGtlcm5lbC4uLiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoHRoaW5nLjxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqBXYWl0IC0tIG9uZSB0aGluZyB5b3UgY291bGQgdHJ5OiBEZWFjdGl2YXRlPGJy
Pg0KJmd0O8KgIMKgIMKgQ09ORklHX0VGSSBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqBlc3BlY2lhbGx5PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgQ09ORklHX0VGSV9TVFVCUy4gSSYjMzk7bSBub3Qgc3VyZSwg
YnV0IGl0IGNvdWxkIGJlIHRoYXQ8YnI+DQomZ3Q7wqAgwqAgwqBFRklfU1RVQlM8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBjaGFuZ2U8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB0aGUgaGVhZGVyIGZvcm1hdCB0aGF0
IG91ciBib290bG9hZGVyIHBhdGNoZXMuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7IFRoYW5rcyBh
Z2FpbiBmb3IgeW91ciBoZWxwLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBObyBwcm9ibGVtLiBC
dXQgaXQmIzM5O3Mgbm90IHlldCB3b3JraW5nLiA7LSk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
wqAgUmFsZjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDsgT24gRnJpLCBKdW4gNywgMjAxOSBhdCA1OjMwIFBN
IFJhbGYgUmFtc2F1ZXI8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVy
Zy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVl
ckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJl
Z2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdl
dD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vu
c2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRl
PC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVy
Zy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVl
ckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJl
Z2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdl
dD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vu
c2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRl
PC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgt
cmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1
cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFs
Zi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgt
cmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1
cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFs
Zi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxi
cj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlPC9hPiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBIaSBXYXluZSw8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgT24gNi83LzE5IDEw
OjA0IFBNLCBXYXluZSB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IEhpIFJhbGYsPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgVGhhbmsg
eW91IGZvciB5b3VyIHJlc3BvbnNlcy7CoCBJIGhhdmU8YnI+DQomZ3Q7wqAgwqAgwqBhdHRhY2hl
ZCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqByZXF1
ZXN0ZWQgY29uZmlnPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0OyBmaWxlcy7CoCBJIGFtIG5vdyBqdXN0IHRyeWluZyB0byB1c2Ug
dGhlIHNhbWU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBiekltYWdlIGZvcjxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHRoZSByb290IGFuZDxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgdGhlIG5vbi1yb290IGxpbnV4IG5vZGUuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoE9uZSBxdWVzdGlvbiB0aGF0IHlvdSBkaWRuJiMzOTt0
IGFuc3dlcjogZG88YnI+DQomZ3Q7wqAgwqAgwqBhcGljLWRlbW8gb3I8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB0aW55LWRlbW8gd29yaz88YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBUaGV5IG5l
ZWQgdG8gdG8gaGF2ZSBjb3JyZWN0IC5jb25zb2xlPGJyPg0KJmd0O8KgIMKgIMKgcGFyYW1ldGVy
IHNldCwgc288YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBl
bnN1cmUgdGhhdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoHBhcmFtZXRlcnMgYXJlIHNldCBpZiB5b3UgcnVuIHRob3NlIGRlbW9zIGlu
IHlvdXI8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBsaW51
eC1kZW1vIGNlbGwuIEp1c3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqBjb21wYXJlIGl0IHRvIHRpbnktZGVtby5jIG9yIGFwaWMtZGVt
by5jPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7IFllcywgSSBhbSB1c2luZyB2YW5pbGxhIDQuMTYgYmVjYXVzZSB0aGU8YnI+
DQomZ3Q7wqAgwqAgwqBkb2N1bWVudGF0aW9uPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgaW5kaWNhdGVkPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgdGhhdCBpdDxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgaXMgdGhlIGZpcnN0
IG1haW5saW5lIHJlbGVhc2UgdG8gb2ZmaWNpYWxseTxicj4NCiZndDvCoCDCoCDCoHN1cHBvcnQ8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBKYWlsaG91c2Ug
R3Vlc3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7IGltYWdlcy7CoCBEbyB5b3Ugc3VnZ2VzdCB0aGF0IEkgdXNlIHNvbWV0aGlu
Zzxicj4NCiZndDvCoCDCoCDCoGVsc2U/PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoEFzIEphbiBhbHJlYWR5IHdyb3RlOiBUcnkgdG8gdXNlIFNp
ZW1lbnMmIzM5OyA0LjE5PGJyPg0KJmd0O8KgIMKgIMKgYnJhbmNoLjxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBSaWdodCBu
b3cgaSYjMzk7bSBqdXN0IHRyeWluZyB0byBnZXQgc29tZSBzZXJpYWw8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqBvdXRwdXQgZnJvbTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoHRoZSBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgTGludXguwqAgSG9wZWZ1bGx5LCBJ
IGhhdmUgdGhhdCBjb25maWd1cmVkPGJyPg0KJmd0O8KgIMKgIMKgY29ycmVjdGx5LsKgPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgSWRlYWxseSwgSSB3b3Vs
ZDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDsgbGlrZSB0byBzaGFyZSB0aGUgc2FtZSBzZXJpYWwgY29uc29sZSBmb3I8YnI+DQom
Z3Q7wqAgwqAgwqB0aGUgUm9vdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoG5vZGU8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBhbmQgbm9uLXJvb3Q8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7IG5vZGUgZXZlbnR1YWxseSBpZiBwb3NzaWJsZS7CoCBJIGhhdmUgYmVlbiBPSzxicj4N
CiZndDvCoCDCoCDCoHdpdGg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB1c2luZzxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHRoZSB2aXJ0dWFsPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0OyBjb25zb2xlIChqYWlsaG91c2UgY29uc29sZSAtZikgZm9yIHRoZTxicj4NCiZndDvCoCDC
oCDCoEh5cGVydmlzb3I8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBvdXRwdXQuPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoEluIGFkZGl0
aW9uIHRvIEphbiYjMzk7cyBjb21tZW50Ojxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBDdXJyZW50bHkgeW91IG9ubHkgaGF2ZSBhY2Nlc3MgdG8g
dGhlPGJyPg0KJmd0O8KgIMKgIMKgamFpbGhvdXNlIGNvbnNvbGU8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB2aWEgJiMzOTtqYWlsaG91c2U8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBjb25zb2xl
JiMzOTsgZnJvbSB5b3VyIHJvb3QgY2VsbC4gSW1hZ2luZSB5b3VyPGJyPg0KJmd0O8KgIMKgIMKg
cm9vdCBjZWxsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Y3Jhc2hlcyBmb3Igc29tZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoHJlYXNvbi4gWW91IHdpbGwgbmV2ZXIgc2VlIHRoZSBmYXVsdCBy
ZWFzb24sPGJyPg0KJmd0O8KgIMKgIMKgd2hpY2ggbWFrZXM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqB0aGluZ3MgaGFyZCB0bzxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGRlYnVnLjxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBJIHdvdWxkIHN1
Z2dlc3QgdG8gY29uZmlndXJlIHRoZSBoeXBlcnZpc29yIHRvPGJyPg0KJmd0O8KgIMKgIMKgdXNl
IHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHNlcmlh
bCBjb25zb2xlLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoFlvdSBjYW4gc2hhcmUgdGhlIGRldmljZSB3aXRoIHRoZSBub24tcm9vdDxi
cj4NCiZndDvCoCDCoCDCoExpbnV4LCB0aGF0JiMzOTtzPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgbm8gcHJvYmxlbS48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgSW4gdGhpcyBjYXNlLCB0aGUgbm9uLXJv
b3Qga2VybmVsJiMzOTtzIG91dHB1dCB3aWxsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
YWx3YXlzIGJlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
cHJpbnRlZCB0byB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqBzZXJpYWwgY29uc29sZS4gRGlyZWN0bHksIGlmIHlvdSBjaG9vc2U8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBjb25zb2xlPXR0eVN4LCBhbmQ8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBpbmRpcmVjdGx5PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgdmlhIHRo
ZSBoeXBlcnZpc29yIGlmIHlvdSBjaG9vc2U8YnI+DQomZ3Q7wqAgwqAgwqBjb25zb2xlPWphaWxo
b3VzZS48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgQlRXOiBBY2NvcmRpbmcgdG8geW91ciBjb25maWcsIHlvdXIgc3lzdGVtIGlzIGE8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBQb3dlckVkZ2UsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgYW5kIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoG5vbi1yb290IGNlbGwgZ2V0cyBib3Ro
LCAweDJmOCBhbmQgMHgzZjguIEFyZTxicj4NCiZndDvCoCDCoCDCoHlvdSBzdXJlPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgdGhhdCB0dHlTMSBpcyB0aGU8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqBjb3JyZWN0IGNvbnNvbGUgdGhhdCB5b3UgYXJlIGNvbm5lY3RlZCB0bz88YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgSnVzdCBtZW50aW9uaW5n
IHRoaXMgYXMgd2UgaGF2ZSBhIHNpbWlsYXI8YnI+DQomZ3Q7wqAgwqAgwqBtYWNoaW5lIGhlcmUs
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgYW5kLCBhZmFp
ciwgYm90aDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoHBsYXRmb3JtIHNlcmlhbCBkZXZpY2UgYXJlICYjMzk7dXNhYmxlJiMzOTssIGJ1
dCBvbmU8YnI+DQomZ3Q7wqAgwqAgwqBlbmRzIGluIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoG5pcnZhbmEgd2hpbGU8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBpdCBpcyBhY2Nlc3NpYmxl
Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBB
aCwgYW5kIG9uZSBsYXN0IHRoaW5nOiB0cnkgdG8gc3dpdGNoIHRvIHRoZTxicj4NCiZndDvCoCDC
oCDCoGN1cnJlbnQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBuZXh0PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgYnJhbmNoIGZvcjxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGphaWxob3Vz
ZS4gSmFuIGp1c3QgaW50ZWdyYXRlZCBhIGZldyBwYXRjaGVzPGJyPg0KJmd0O8KgIMKgIMKgZnJv
bSBtZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHRoYXQ8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBtaWdodCBhbHNvIGJlPGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgcmVsZXZhbnQgZm9y
IHlvdXIgbWFjaGluZS48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgSFRIPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgwqAgUmFsZjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBXYXluZTxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IE9u
IEZyaSwgSnVuIDcsIDIwMTkgYXQgOToxMCBBTSBSYWxmIFJhbXNhdWVyPGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2Js
YW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9
Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2Js
YW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9
Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0OyZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJn
LmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVy
QG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0
PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5z
YnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8
L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJn
LmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVy
QG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVn
ZW5zYnVyZy5kZTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0
PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8Kg
IMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5z
YnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8
L2E+Jmd0OyZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFs
Zi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxh
bmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJh
bXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86cmFs
Zi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxhbmsiPnJhbGYucmFtc2F1
ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZSIgdGFyZ2V0PSJfYmxh
bmsiPnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGU8L2E+Jmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJA
b3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdl
bnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJh
bXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2Js
YW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9
Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcuZGUiIHRhcmdldD0iX2Js
YW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnJhbGYucmFtc2F1ZXJAb3RoLXJlZ2Vuc2J1cmcu
ZGUiIHRhcmdldD0iX2JsYW5rIj5yYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9Il9ibGFuayI+cmFsZi5y
YW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlIiB0YXJnZXQ9
Il9ibGFuayI+cmFsZi5yYW1zYXVlckBvdGgtcmVnZW5zYnVyZy5kZTwvYT4mZ3Q7Jmd0OyZndDsm
Z3Q7Jmd0OyZndDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoEhpLDxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqBPbiA2LzcvMTkgMjoyOCBQTSwgV2F5bmUgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
OyBIZWxsbyw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBJIGFtIG5ldyB0
byBMaW51eCBkZXZlbG9wbWVudCBhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBKYWls
aG91c2UuwqAgSSBoYXZlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgc3VjY2Vzc2Z1bGx5PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgYm9vdGVkPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0OyB0aGUgSmFpbGhvdXNlIEh5cGVydmlzb3IgYW5kIHJvb3QgY2VsbDxicj4N
CiZndDvCoCDCoCDCoG9uIGEgYmFyZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoG1ldGFsIFg4NiBMaW51eDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoHN5c3RlbTxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDsgKE5vIFFFTVUpLsKgIEkgYW0gbm93IHRyeWluZyB0byBsb2FkIGE8YnI+DQom
Z3Q7wqAgwqAgwqBub24tcm9vdDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoExpbnV4IGNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBhbmQgSSBoYXZlIGE8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IGZl
dyBxdWVzdGlvbnMuwqAgSmFpbGhvdXNlIGFjY2VwdHMgYW5kPGJyPg0KJmd0O8KgIMKgIMKgc3Rh
cnRzIG15PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgbm9u
LXJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqBsaW51eCBjZWxsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBjb25maWd1cmF0aW9uIGFuZCBJ
IHNlZSBpdCBhcyAmcXVvdDtydW5uaW5nJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgdGhyb3VnaCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmcXVvdDtqYWlsaG91c2UgY2VsbDxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsg
bGlzdCZxdW90OyBjb21tYW5kLsKgIEhvd2V2ZXIsIEkgZG9uJiMzOTt0IHNlZTxicj4NCiZndDvC
oCDCoCDCoGFueSBzZXJpYWw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqBvdXRwdXQgZnJvbSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7ICZxdW90O25vbi1yb290
IGxpbnV4JnF1b3Q7IGNlbGwgYm9vdGluZyB1cC7CoCBJ4oCZbTxicj4NCiZndDvCoCDCoCDCoG5v
dCBzdXJlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgd2hh
dCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqBub24tcm9vdCBub2RlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBpcyBkb2luZyBhdCB0aGlz
IHBvaW50Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBPaywgZmlyc3Qgb2YgYWxsLCBjYW4geW91IHNl
ZSBhbnkgb3V0cHV0PGJyPg0KJmd0O8KgIMKgIMKgZnJvbTxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoEphaWxob3VzZSYjMzk7cyBkZW1vPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgaW5tYXRlczxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoChlLmcuLCB0aW55LWRlbW8gb3IgYXBpYy1kZW1vKT88YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBN
eSByb290IG5vZGUgaXMgYSA0LjE2PGJyPg0KJmd0O8KgIMKgIMKga2VybmVsPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgY29uZmlndXJlZCB0aGlzPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgd2F5
Ojxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgMS48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqBDT05GSUdfSkFJTEhPVVNFX0dVRVNUIGlzPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgbm90IHNldDxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMi48YnI+DQomZ3Q7
wqAgwqAgwqBDT05GSUdfU0VSSU89eTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBDT05GSUdfU0VSSUFMXzgyNTBfUlVO
VElNRV9VQVJUUz00PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBNeSBub24tcm9vdCBub2RlIGlzIGE8YnI+DQomZ3Q7wqAgwqAgwqA0
LjE2IGtlcm5lbDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oGNvbmZpZ3VyZWQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqB0aGlzIHdheTo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDEuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgQ09ORklHX0pBSUxIT1VTRV9HVUVTVD15PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAy
Ljxicj4NCiZndDvCoCDCoCDCoENPTkZJR19TRVJJTz1tPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgKGNhbiYjMzk7dCBzZWVtPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgdG8gZGlzYWJsZTxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDsgY29tcGxldGVseSBpbiBteSBjb25maWcgZm9yIDQuMTYpPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAz
Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoENPTkZJR19TRVJJQUxfODI1MF9SVU5USU1FX1VBUlRTPTE8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIGEgZnVsbCAuY29uZmlnPzxicj4NCiZndDvCoCDC
oCDCoFdoYXQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBicmFuY2g8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBhcmUgeW91PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgZXhhY3RseTxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoHVzaW5nPyBWYW5pbGxhIDQuMTY/PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoFBsZWFz
ZSBhdHRhY2ggeW91ciBzeXN0ZW0gY29uZmlnIGFuZCB5b3VyPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgbm9uLXJvb3QgbGludXg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBjb25maWcgYXMgd2VsbC48YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgWW91IG1heSBhbHNvIHdhbnQgdG8gdHJ5PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3NpZW1lbnMv
bGludXgiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNv
bS9zaWVtZW5zL2xpbnV4PC9hPiAuIFNlZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGphaWxob3VzZS1lbmFibGlu
ZyBicmFuY2hlcyBmb3Igc29tZTxicj4NCiZndDvCoCDCoCDCoHJlbGVhc2VzLjxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBJbiBnZW5lcmFsLCBkbyB0aGUga2Vy
bmVsIGNvbmZpZyBzZXR0aW5nczxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGhhdmUgdG88
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBtYXRjaCBiZXR3
ZWVuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgdGhlIHJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IG5vZGUgYW5kIG5v
bi1saW51eCBvciBpcyB0aGUgYWJvdmUgZmluZT88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgTm8sIHRo
ZXkgZG8gbm90IGhhdmUgdG8gYmUgdGhlIHNhbWUsIGJ1dDxicj4NCiZndDvCoCDCoCDCoHRoZXkg
Y2FuLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoFN0aWxs
LCBhbjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoGFuYWx5c2lzPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgcmVxdWlyZXMgeW91ciAuY29uZmlnLjxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBUaGUgdm1saW51eC00LjEu
MTYtR3Vlc3QgYnpJbWFnZSBpczxicj4NCiZndDvCoCDCoCDCoGFwcHJveCA3TUIsPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgYW5kIHRoZTxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoGlubWF0ZSBu
b2RlIGlzPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBhbGxvY2F0ZWQgfjc1TUIgb2YgUkFNLjxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IEkgaGF2ZSBhIHNpbmdsZSBVQVJULCBzbyBJ
IGhhdmU8YnI+DQomZ3Q7wqAgwqAgwqBjb25maWd1cmVkIHRoZTxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoHJvb3QgY2VsbDxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoHN5c3RlbSBjb25maWc8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7IHRvIG91dHB1dCB0byB0aGUgdmlydHVhbCBoeXBlcnZpc29yPGJyPg0K
Jmd0O8KgIMKgIMKgY29uc29sZTo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgV2FpdC4uLiBZb3UgY29u
ZmlndXJlZCB5b3VyIHJvb3QtY2VsbCB0bzxicj4NCiZndDvCoCDCoCDCoHVzZSB0aGU8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBoeXBlcnZpc29yIGRlYnVn
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgY29uc29sZT8gSG93PyBJdCYjMzk7cyBvbmx5IGF2YWlsYWJsZSBvbmNl
IHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGh5cGVydmlzb3IgaXM8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBlbmFibGVk
LiBIb3c8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqBzaG91bGQgdGhpcyB3b3JrPzxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqBCdXQgbGV0JiMzOTtzIGhhdmUgYSBsb29rIGF0IHlvdXI8YnI+DQomZ3Q7wqAgwqAgwqBjb25m
aWd1cmF0aW9uIGZpcnN0Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBTbyB5b3Ugd2FudCB0bzo8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqDCoCAtIEhhdmUgdGhlIFVBUlQgKDB4M2Y4KSBhdmFpbGFibGUgaW4gdGhlPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgbm9uLXJvb3QgY2VsbDxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvvv73vv70gwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqDCoCAtIFVzZSAweDNmOCBhcyBoeXBlcnZpc29yIGRlYnVnPGJyPg0KJmd0O8KgIMKgIMKgY29u
c29sZSBhcyB3ZWxsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgwqAgLSBObyBjb25zb2xlIGZvciByb290LWNlbGw8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgRGlkIEkgZ2V0IHRoaXMgcmlnaHQ/PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoMKgIFJhbGY8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgLmZsYWdzID08YnI+DQomZ3Q7wqAgwqAgwqBKQUlMSE9VU0VfU1lTX1ZJUlRVQUxfREVCVUdf
Q09OU09MRSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAuZGVidWdfY29u
c29sZSA9IHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IC50eXBlID0gSkFJTEhPVVNFX0NPTl9UWVBFX05P
TkUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB9LDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7IGFuZCBJIGhhdmUgY29uZmlndXJlZCB0aGUgbm9uLXJvb3Q8YnI+DQomZ3Q7wqAgwqAg
wqBsaW51eCBjZWxsIHRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgb3V0cHV0IHRvPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgdGhlIFVBUlQ6PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDsgKEFkZGVkIHNlcmlhbCAweDNmOCB0byBwaW8gYml0bWFwIGZvcjxicj4NCiZndDvC
oCDCoCDCoG5vbi1yb290PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgbGludXgpIGFuZDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoHN0YXJ0ZWQgdGhlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBub2RlIHdp
dGggdGhpczo8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyAuL3Rvb2xzL2ph
aWxob3VzZSBjZWxsIGxpbnV4PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgY29uZmlncy94ODYvbGludXgteDg2LmNlbGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IC9i
b290L3ZtbGludXgtNC4xLjE2LUd1ZXN0IC1jPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
JnF1b3Q7Y29uc29sZT10dHlTMCwxMTUyMDAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IChOb3Rl
IEkgYWxzbyB0cmllZCAmcXVvdDtjb25zb2xlPWphaWxob3VzZSZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoGluIHRoZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oGNvbW1hbmQgYWJvdmUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgYW5kIHRoYXQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHByb2R1Y2VzIHRo
ZSBzYW1lIHJlc3VsdCk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBJIHRo
ZW4gc2VlIHRoZSBmb2xsb3dpbmcgb24gbXkgaHlwZXJ2aXNvcjxicj4NCiZndDvCoCDCoCDCoCZn
dDvCoCDCoCDCoGNvbnNvbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAoLi90b29scy9qYWlsaG91c2U8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
IGNvbnNvbGUgLWYpOjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IENyZWF0
ZWQgY2VsbCAmcXVvdDtsaW51eC14ODYtZGVtbyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgLi4u
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0OyBDZWxsICZxdW90O2xpbnV4LXg4Ni1kZW1vJnF1b3Q7IGNhbiBi
ZSBsb2FkZWQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFN0YXJ0ZWQgY2VsbCAmcXVvdDtsaW51eC14ODYt
ZGVtbyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IEFmdGVyIGEg
bGl0dGxlIHdoaWxlIEkgZG8gZ2V0IGEgcGFya2VkPGJyPg0KJmd0O8KgIMKgIMKgQ1BVIGVycm9y
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgb24gdGhlIHJv
b3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqBub2RlLDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoGxvb2tzPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBsaWtlIGl0
cyB0cnlpbmcgdG8gZG8gc29tZXRoaW5nIHdpdGggdGhlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgVUFSVCBhcyB3ZWxsOjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgRkFUQUw6IEludmFsaWQgUElP
IHJlYWQsIHBvcnQ6IDNmZSBzaXplOiAxPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDsgSSB3b3VsZCBleHBlY3Qgc29tZXRoaW5nIHRvIHBvcCBvdXQgb248YnI+DQomZ3Q7wqAg
wqAgwqB0aGUgVUFSVDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoGZyb20gdGhlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgbm9uLXJvb3Q8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBsaW51eDxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDsgbm9kZSBmaXJzdC7CoCBOb3RlIHRoYXQgcm9vdCBub2RlIGhhczxicj4NCiZndDvCoCDC
oCDCoHNlcmlhbDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoDB4M2Y4PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgZGlzYWJsZWQ8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBpbiBpdHMgcGlv
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0OyBiaXRtYXAuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCZndDsgSSB2ZXJpZmVkIHRoYXQgdGhlIFVBUlQgaXMgZnVuY3Rpb25pbmcgYnk8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqBhbGxvd2luZyB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBoeXBlcnZpc29yIHRvPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0OyBwcmludCB0byBpdCBhbmQgYWxzbyBwZXJmb3JtZWQgYW4gZWNobzxicj4N
CiZndDvCoCDCoCDCoHRlc3Qgb3Zlcjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoHR0eVMwLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
IEkgaGF2ZSB0cmllZCBzZXZlcmFsIGNvbmZpZ3VyYXRpb25zIG9mPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKga2VybmVsLi4uLi5pbmNsdWRpbmcgeW91cjxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoGN1cnJlbnQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7ICZxdW90O3F1ZXVlcy9qYWls
aG91c2UmcXVvdDsgYnJhbmNoIGhlYWQga2VybmVsPGJyPg0KJmd0O8KgIMKgIMKgZm9yIHRoZTxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoG5vbi1yb290IG5v
ZGUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgYWxvbmc8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqB3aXRoPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyB0aGUga2Vy
bmVsIGNvbmZpZyBmb3IgNC43IHBvc3RlZCBpbjxicj4NCiZndDvCoCDCoCDCoHRoaXMgdGhyZWFk
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgYmVsb3cgKGJ1
dCBJPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgZ2V0IHNhbWU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IHJlc3VsdCBhcyBhYm92ZSB3aGVuIEkg
c3RhcnQgaXQsIG5vIGtlcm5lbDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoG91dHB1dCk6
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqDCoMKgwqDCoMKg
JnF1b3Q7PGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9mb3J1bS8jIXNlYXJjaGlu
L2phaWxob3VzZS1kZXYvUmUkM0EkMjBGYWlsZWQkMjB0byQyMGJvb3QkMjBqYWlsaG91c2UlN0Nz
b3J0OnJlbGV2YW5jZS9qYWlsaG91c2UtZGV2L003VU84OVhGSWswL1FpNDBERHVNQkFBSiIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9m
b3J1bS8jIXNlYXJjaGluL2phaWxob3VzZS1kZXYvUmUkM0EkMjBGYWlsZWQkMjB0byQyMGJvb3Qk
MjBqYWlsaG91c2UlN0Nzb3J0OnJlbGV2YW5jZS9qYWlsaG91c2UtZGV2L003VU84OVhGSWswL1Fp
NDBERHVNQkFBSjwvYT4mcXVvdDsuPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZn
dDsgQW55IGluZm9ybWF0aW9uIHlvdSBjYW4gcHJvdmlkZSB0byBtZTxicj4NCiZndDvCoCDCoCDC
oHdpbGwgYmU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqBo
ZWxwZnVsLsKgIEkmIzM5O208YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqBub3Qgc3VyZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgd2hhdCBtaWdo
dCBiZSBnb2luZyB3cm9uZyBoZXJlLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7IFRoYW5rcyw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFdheW5lPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDsgLS08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFlvdSByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgc3Vic2NyaWJlZCB0byB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBHb29nbGU8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7IEdyb3VwcyAmcXVvdDtKYWlsaG91c2UmcXVvdDsgZ3JvdXAuPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0
OyBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3A8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqByZWNlaXZpbmc8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqBlbWFpbHM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBmcm9tIGl0LCBzZW5kPGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBh
biBlbWFpbCB0bzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oDxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpq
YWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0i
X2JsYW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVn
cm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208
L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0i
X2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208
L2E+Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208
L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNl
LWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+
amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmph
aWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvC
oCDCoCDCoMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
diUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJC
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUy
QnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2Ut
ZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYl
MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0OyZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqDCoCZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5j
b20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpq
YWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0i
X2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRh
cmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxo
b3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9h
PiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgPGJy
Pg0KJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
diUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmph
aWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUy
NTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhv
dXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRh
cmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxo
b3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9h
PiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpq
YWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxo
b3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9h
Pjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1k
ZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5r
Ij5qYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4m
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVn
cm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OmphaWxob3VzZS1kZXYlMjUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb208L2E+Jmd0OyZndDsmZ3Q7Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFp
bGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5r
Ij5qYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYl
MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
diUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBn
b29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJz
Y3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxo
b3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5r
Ij5qYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUy
QnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2Ut
ZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
diUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoDxicj4N
CiZndDvCoCDCoCDCoMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3Vz
ZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDC
oCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVu
c3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYl
MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVu
c3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyQnVuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20i
IHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdy
b3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZsdDttYWlsdG86
PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVn
cm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUyNTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0OyZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91
c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+
amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
diUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhv
dXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYl
MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNjcmliZUBn
b29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJCdW5zdWJz
Y3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3Jv
dXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTJCdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyQnVuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2JTI1MjUyQnVu
c3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29v
Z2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMjUyNTI1MkJ1bnN1
YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoDxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhv
dXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYl
MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0
O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MjUy
NTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3Vz
ZS1kZXYlMjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKg
IMKgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTJCdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYl
MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTI1
MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMjUy
NTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MjUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MjUy
NTI1MjUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWls
aG91c2UtZGV2JTI1MjUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsm
Z3Q7Jmd0OyZndDsmZ3Q7Jmd0Oy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFRvIHZpZXcgdGhpcyBkaXNj
dXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgPGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgPGJyPg0KJmd0O8KgIMKgIMKgwqDCoMKgwqA8YSBocmVmPSJodHRwczovL2dy
b3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzJpS2sxSjYl
MkIwaHVoNV9fZFM0SHl1alh6VjlyJTJCTGJLTHp1Vlo0SzNCdDVlQSU0MG1haWwuZ21haWwuY29t
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dyb3Vwcy5nb29nbGUu
Y29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzJpS2sxSjYlMkIwaHVoNV9fZFM0
SHl1alh6VjlyJTJCTGJLTHp1Vlo0SzNCdDVlQSU0MG1haWwuZ21haWwuY29tPC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqDC
oMKgwqDCoCZsdDs8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFp
bGhvdXNlLWRldi9DQSUyQiUyQktoYzJpS2sxSjYlMkIwaHVoNV9fZFM0SHl1alh6VjlyJTJCTGJL
THp1Vlo0SzNCdDVlQSU0MG1haWwuZ21haWwuY29tP3V0bV9tZWRpdW09ZW1haWwmYW1wO3V0bV9z
b3VyY2U9Zm9vdGVyIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dy
b3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzJpS2sxSjYl
MkIwaHVoNV9fZFM0SHl1alh6VjlyJTJCTGJLTHp1Vlo0SzNCdDVlQSU0MG1haWwuZ21haWwuY29t
P3V0bV9tZWRpdW09ZW1haWwmYW1wO3V0bV9zb3VyY2U9Zm9vdGVyPC9hPiZndDsuPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0O8Kg
IMKgIMKgJmd0OyBGb3IgbW9yZSBvcHRpb25zLCB2aXNpdDxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5j
b20vZC9vcHRvdXQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3Jv
dXBzLmdvb2dsZS5jb20vZC9vcHRvdXQ8L2E+Ljxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgLS08YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5
b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlPGJyPg0KJmd0O8KgIMKgIMKgR29vZ2xlPGJyPg0KJmd0
O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBHcm91cHMgJnF1b3Q7SmFpbGhvdXNlJnF1b3Q7IGdy
b3VwLjxicj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgVG8gdW5zdWJzY3JpYmUgZnJv
bSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHM8YnI+DQomZ3Q7wqAgwqAgwqBm
cm9tIGl0LCBzZW5kPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBhbiBlbWFpbCB0
byA8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdy
b3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmphaWxob3VzZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9
Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRl
diUyNTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFp
bGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iIHRhcmdldD0i
X2JsYW5rIj5qYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJy
Pg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUy
NTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmphaWxob3Vz
ZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
JTI1MkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhv
dXNlLWRldiUyQnVuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKg
IMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTI1MkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyNTJC
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4mZ3Q7Jmd0OyZndDsuPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2Vi
IHZpc2l0PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCZndDvCoCDCoDxicj4NCiZndDvCoCDCoCDCoMKgPGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29v
Z2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0ElMkIlMkJLaGMwTzJ6U2V1TExZM01hZVJX
N2NRcldicS02WTJCSEpnJTJCeF9qNm5rJTNERUNhX0ElNDBtYWlsLmdtYWlsLmNvbSIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21z
Z2lkL2phaWxob3VzZS1kZXYvQ0ElMkIlMkJLaGMwTzJ6U2V1TExZM01hZVJXN2NRcldicS02WTJC
SEpnJTJCeF9qNm5rJTNERUNhX0ElNDBtYWlsLmdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgPGJyPg0KJmd0O8Kg
IMKgIMKgwqAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2ph
aWxob3VzZS1kZXYvQ0ElMkIlMkJLaGMwTzJ6U2V1TExZM01hZVJXN2NRcldicS02WTJCSEpnJTJC
eF9qNm5rJTNERUNhX0ElNDBtYWlsLmdtYWlsLmNvbT91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1f
c291cmNlPWZvb3RlciIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9n
cm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0ElMkIlMkJLaGMwTzJ6U2V1
TExZM01hZVJXN2NRcldicS02WTJCSEpnJTJCeF9qNm5rJTNERUNhX0ElNDBtYWlsLmdtYWlsLmNv
bT91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWZvb3RlcjwvYT4mZ3Q7Ljxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgRm9yIG1vcmUgb3B0aW9ucywgdmlzaXQgPGEgaHJl
Zj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL29wdG91dCIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL29wdG91dDwvYT4uPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgLS08YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNj
cmliZWQgdG8gdGhlIEdvb2dsZTxicj4NCiZndDvCoCDCoCDCoCZndDsgR3JvdXBzICZxdW90O0ph
aWxob3VzZSZxdW90OyBncm91cC48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFRvIHVuc3Vic2NyaWJl
IGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQ8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzpqYWlsaG91
c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmph
aWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2JTI1MkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRldiUyQnVu
c3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsg
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldiUyQnVuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIj5qYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86amFpbGhvdXNlLWRldiUyNTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tPC9hPiZndDsmZ3Q7Ljxicj4NCiZndDvCoCDCoCDCoCZndDsgVG8gdmlldyB0aGlzIGRpc2N1
c3Npb24gb24gdGhlIHdlYiB2aXNpdDxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqA8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNl
LWRldi9DQSUyQiUyQktoYzM2c1A3QUJFc1I1QnAlMkJncHRzMERVQkVOcVY2ZUZEUGF6ZnM1a1Jf
UVJHYXclNDBtYWlsLmdtYWlsLmNvbSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0ElMkIlMkJL
aGMzNnNQN0FCRXNSNUJwJTJCZ3B0czBEVUJFTnFWNmVGRFBhemZzNWtSX1FSR2F3JTQwbWFpbC5n
bWFpbC5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZsdDs8
YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9D
QSUyQiUyQktoYzM2c1A3QUJFc1I1QnAlMkJncHRzMERVQkVOcVY2ZUZEUGF6ZnM1a1JfUVJHYXcl
NDBtYWlsLmdtYWlsLmNvbT91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWZvb3RlciIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNv
bS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0ElMkIlMkJLaGMzNnNQN0FCRXNSNUJwJTJCZ3B0czBE
VUJFTnFWNmVGRFBhemZzNWtSX1FSR2F3JTQwbWFpbC5nbWFpbC5jb20/dXRtX21lZGl1bT1lbWFp
bCZhbXA7dXRtX3NvdXJjZT1mb290ZXI8L2E+Jmd0Oy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEZv
ciBtb3JlIG9wdGlvbnMsIHZpc2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20v
ZC9vcHRvdXQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBz
Lmdvb2dsZS5jb20vZC9vcHRvdXQ8L2E+Ljxicj4NCiZndDsgPGJyPg0KJmd0OyAtLSA8YnI+DQom
Z3Q7IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQg
dG8gdGhlIEdvb2dsZTxicj4NCiZndDsgR3JvdXBzICZxdW90O0phaWxob3VzZSZxdW90OyBncm91
cC48YnI+DQomZ3Q7IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNl
aXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQ8YnI+DQomZ3Q7IGFuIGVtYWlsIHRvIDxhIGhyZWY9
Im1haWx0bzpqYWlsaG91c2UtZGV2JTJCdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwv
YT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYlMkJ1
bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9Il9ibGFuayI+amFpbGhvdXNlLWRl
dit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tPC9hPiZndDsuPGJyPg0KJmd0OyBUbyB2aWV3
IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0PGJyPg0KJmd0OyA8YSBocmVmPSJodHRw
czovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQSUyQiUyQktoYzEz
bnVhaGJvZ19XVkQtQkppMGFzSEVhOFR4TUF2QjVNNWRhbUpHSl81aW5BJTQwbWFpbC5nbWFpbC5j
b20iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBzLmdvb2ds
ZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjMTNudWFoYm9nX1dWRC1CSmkw
YXNIRWE4VHhNQXZCNU01ZGFtSkdKXzVpbkElNDBtYWlsLmdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7
ICZsdDs8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNl
LWRldi9DQSUyQiUyQktoYzEzbnVhaGJvZ19XVkQtQkppMGFzSEVhOFR4TUF2QjVNNWRhbUpHSl81
aW5BJTQwbWFpbC5nbWFpbC5jb20/dXRtX21lZGl1bT1lbWFpbCZhbXA7dXRtX3NvdXJjZT1mb290
ZXIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ3JvdXBzLmdvb2ds
ZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBJTJCJTJCS2hjMTNudWFoYm9nX1dWRC1CSmkw
YXNIRWE4VHhNQXZCNU01ZGFtSkdKXzVpbkElNDBtYWlsLmdtYWlsLmNvbT91dG1fbWVkaXVtPWVt
YWlsJmFtcDt1dG1fc291cmNlPWZvb3RlcjwvYT4mZ3Q7Ljxicj4NCiZndDsgRm9yIG1vcmUgb3B0
aW9ucywgdmlzaXQgPGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL29wdG91dCIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNv
bS9kL29wdG91dDwvYT4uPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0KDQo8cD48L3A+CgotLSA8
YnIgLz4KWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJl
ZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAmcXVvdDtKYWlsaG91c2UmcXVvdDsgZ3JvdXAuPGJyIC8+
ClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxz
IGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOmphaWxob3VzZS1kZXYr
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSI+amFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBn
b29nbGVncm91cHMuY29tPC9hPi48YnIgLz4KVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhl
IHdlYiB2aXNpdCA8YSBocmVmPSJodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFp
bGhvdXNlLWRldi9DQSUyQiUyQktoYzJMR3EzZ0d5ZEcyT2p4bjJ4Y2JQb2M2Vnp2aG9PNF9pa0ZN
Rk1kUV9hWU9nJTQwbWFpbC5nbWFpbC5jb20/dXRtX21lZGl1bT1lbWFpbCZ1dG1fc291cmNlPWZv
b3RlciI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0El
MkIlMkJLaGMyTEdxM2dHeWRHMk9qeG4yeGNiUG9jNlZ6dmhvTzRfaWtGTUZNZFFfYVlPZyU0MG1h
aWwuZ21haWwuY29tPC9hPi48YnIgLz4KRm9yIG1vcmUgb3B0aW9ucywgdmlzaXQgPGEgaHJlZj0i
aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL29wdG91dCI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xl
LmNvbS9kL29wdG91dDwvYT4uPGJyIC8+Cg==
--00000000000016be8f058b34a3a1--
