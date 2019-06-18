Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBVFJUPUAKGQENDQ4KEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3c.google.com (mail-vk1-xa3c.google.com [IPv6:2607:f8b0:4864:20::a3c])
	by mail.lfdr.de (Postfix) with ESMTPS id C28784A065
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 14:11:01 +0200 (CEST)
Received: by mail-vk1-xa3c.google.com with SMTP id 184sf5944710vku.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 05:11:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560859860; cv=pass;
        d=google.com; s=arc-20160816;
        b=yxQW1pngxdzPH7DMsSej/KQETKrDElSm1v/E2apk7dQfMbT4Enn9u+CA3porjmoZRT
         KNCnW9spw3IA++LVdKsmh3TrHNa2t0MTUBJ4pCyJLZVZc/9t3Eylpxi+TADCsFJ+M63Z
         3qvpF9F7e4gyrzeUxgp0zul/MCA3hL89Vm4l0BKO90vt83hrXnvHIK5tJsMGw2V6/f0R
         DlkzmZNAT+QxnnKT+Svyb5o1UOb5ndAP7oQ7eWLOPfEuk8hScIMhlkAwlRXpC8W3xYwJ
         DZP21kVg/Sm41NpQwD1CEiZh+oXgmcHjOHC1q7scqJeSCSxrhCSlv60eXrt0GGMCgcxC
         jvlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=rW3HMdQSsVEh9f5GzM/ASvxEZfJI7TZ9JhlZHrMJvxs=;
        b=QHIWyJo7HeAV5Rw57aMzVIHhFFrBL1bLrpWjXHBQqOvAXFBQcE4ULP22fGQUXTUxJ+
         cakvif4ApCezDqFYwX1hB2SOtu9TXbrNQOipv9LOWbeMzze7+5HKSNaRQWFvSbdJcY9j
         cvgNy+fxgWNfkRY6u/wgGcCmvrMlC40cZ0aVn4HcIEeDnIEMOXJzVfLAUQXbavIYiaB3
         7Mqf0Dxi9yTSkBwOvn1YeP4f0hwbEDOW8LNbvNWURRE8vYCcssh3AQnH1CBtib2H/3q3
         yZxc4GQ8Im7faTtliqR/XQvnOdDd1TX0/XtnqeEIyDhKImiolLpE6FrJwhm7jYbeEtSo
         rJAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gxbFu62B;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::743 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rW3HMdQSsVEh9f5GzM/ASvxEZfJI7TZ9JhlZHrMJvxs=;
        b=YpgyZ/26e4XSzxjAxFHgI2IDuJEisMDvqb9Qc8kLqpGbpQItB9/xT3LHAEIyMng0te
         EcjHdt/IMW2u3wxldi4WbgNnJOidPCyWxY9iWoJUjj1EiQO/w5vwYJi367y35Y1MC1XF
         8JINcNGlNnrWPDAp6S8D1kvX6aDamYoxGHN4OBNXwUZQ/618mjq5V5xXDhxOo+0PsdiS
         9yPrLyYlYngoHylL0+WHMoKGKO364MtUWJetRP5s9LyGmd4fZIJHU4kFBM6llekCxDpd
         T2IVcOqr5zxsf3/UntvYl3LcILkrFLfqQA+8AMPbe3CvAK60l1OSG1W3zSTX8Y5EbsSr
         y3xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rW3HMdQSsVEh9f5GzM/ASvxEZfJI7TZ9JhlZHrMJvxs=;
        b=T0JnRFoSOBJzK+4PPR2ZPYuOUpe+2ACVo+uDoHZXtDWoMQ081ZQ42O9WcCdesOjSQB
         VEpMtTbWaLJK858JdH2MpHoE/1/uHbgtdS5wnSuOg/bFkqF7o6rJnUXHJ10FeZ1sy5BM
         c9dzGGZ+UtYaN0bn4WjoY7dgNF5avAznL0F7YiHm+tsLDv2s0JfPgsrv50fM2Ip8NmRU
         MJBKy0owCn7HZlAjJaVRJqxEvicCRw++57ke73j07ytzAVHQpsIF+u8s9YwV60jLzDr+
         8Y+nrCzy6mdvJH/l5905M70PW/g6C/q5fSnKn5rj5faDf9NDQWDffKtnTpdV4xCHJR7E
         Fdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rW3HMdQSsVEh9f5GzM/ASvxEZfJI7TZ9JhlZHrMJvxs=;
        b=lTTe31fXBc/2wnBNFv3AvEmkzApFmvu7vMDozRd27McIemGYa9+4hmikkSCL6Kuyqr
         WX7tc114nRQcOScvrJKm/iPiFiDwMO2e12OUWYs6tvUwfK89h0+ecVFOKJY6rdgR98dw
         p9WuLxNK64T45o42xkoCqCRc1JcFQpOBTenaBS0T3mGpH53x3EvTZrPvc5at1Pu6PeuS
         P+/cQ8ZUXoglB/ruR8umIXszhOSOMH5GROHf/rn9b51G44UfNs8emMBWhZtJmZ+PWvOD
         IKGAHSziU9hXQSBFjX8RGd9Ty4GAXV40n9Vf7B9DJvCty7CAjBaO2TYc1lghgRWuyF+o
         UyZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXKDPMixFaj4W4jZ2pXxLciK/jzVLM7QAuYt7mCZG7pKW5L/7e7
	JzXHcZHlLDhCsEDz6NvgTFI=
X-Google-Smtp-Source: APXvYqy5Nrm6RLACLOTYBXOiXmbsx1pa8/YnHYzq2Pm87J9EXvQDwCfihSEFxCcTXjPQg0BBgwcJ3Q==
X-Received: by 2002:ab0:2a90:: with SMTP id h16mr24196314uar.57.1560859860590;
        Tue, 18 Jun 2019 05:11:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:4085:: with SMTP id i5ls1355197uad.11.gmail; Tue, 18 Jun
 2019 05:11:00 -0700 (PDT)
X-Received: by 2002:a9f:2b8b:: with SMTP id y11mr42031821uai.54.1560859860216;
        Tue, 18 Jun 2019 05:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560859860; cv=none;
        d=google.com; s=arc-20160816;
        b=UK/IDL2spGOivu93Wv7QkxlOAEf8ilUsseSIw4u4RjnpzKtWLAmjaARvQx+wcaRjFk
         nr+YQfKJDddQo2TX28qSSbbiBEZFL6kugfNad+wGiQjRgNGn+KKAxJTF7wRhEpuc0plS
         5AH3hUpQOZ2U54Lo0iHkm9KTvfZqfUUG8eD6w52/h9l6LoShZ2lwpnR+YBT8jD6VT0QQ
         V/YlwAui4yquWfzuPQxVzgwdkR+HepZE1fyPw5s9vuH+Y5ZYL2RbMTnyfBLWNRoCqU+2
         jb6C9DSNIGkyz7QmdGMTXW6veoF3qoO9dWQO2EoOqmMnLWoFu1tgQ285sGcFc9GJ/VF7
         2KrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RmrYD5yLgBePKXkVYhaG6AOIE4YAnlA1pgRKiRXL4Xs=;
        b=cNRcx1xpciwaiJFd7gAa/mp42t87TR8jIRuBYxzG6HEPAHPyPUrON5q20QYtTh3A6S
         +qsc/TP7Y6Ix+YpI9tWb4tNX3dSYWTzzX4wnNBJL14WXucaVu0Su4h5/XeTf6xQ+95QK
         rr/7yu1YFNvMl6kl5qU6qVH3wQC/iEqsSt94sOEW+abMWPYDlBEx38OKwMAkCXPyQUqT
         apUOUhC59tkvnK0LEguPsc415tsqX77kvy154wJqkZM89OUfIUsArQznbUNowQoCRraT
         yCd4i6sqNLZuzccCRQIURF+lz7G9TnjYkKZ1m5nDSb7ukpBdN9TjCW6HBec6Xh2vvdjs
         QDoA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gxbFu62B;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::743 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com. [2607:f8b0:4864:20::743])
        by gmr-mx.google.com with ESMTPS id q12si488313uar.1.2019.06.18.05.11.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 05:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::743 as permitted sender) client-ip=2607:f8b0:4864:20::743;
Received: by mail-qk1-x743.google.com with SMTP id p144so8315945qke.11
        for <jailhouse-dev@googlegroups.com>; Tue, 18 Jun 2019 05:11:00 -0700 (PDT)
X-Received: by 2002:a37:aac5:: with SMTP id t188mr93311765qke.157.1560859859778;
 Tue, 18 Jun 2019 05:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de> <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
 <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de> <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de> <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com> <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com> <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
 <5b90a899-c42a-a360-8398-c3af35920765@siemens.com> <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
 <0da95034-9bd0-4415-4d3b-5f6687a84563@siemens.com> <CA++Khc1Xjt8yMT39shFraJnzSWp8Ctc9-Cv-mNxOqf+UkxhyxA@mail.gmail.com>
 <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com>
In-Reply-To: <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com>
From: Wayne <racedrive1503@gmail.com>
Date: Tue, 18 Jun 2019 08:10:48 -0400
Message-ID: <CA++Khc3hURr3dFrw2ga=uf9A02KZ1OEEtMAPOVJyCAP3Fs+fmw@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000007c807a058b98018c"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=gxbFu62B;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::743
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

--0000000000007c807a058b98018c
Content-Type: text/plain; charset="UTF-8"

Jan/Ralf:

I just meant that my initramfs files get generated by the "dracut" script,
which gets run automatically when executing "make install" in the kernel
distribution.  I would be happy to try your x86 initrd binary, it may tell
us something.  I haven't been able to install buildroot successfully.  Is
there any specific reason why you would need it for an x86 poweredge as
opposed to the standard dracut/mkinitramfs for the guest?

Running the "jailhouse hardware check" reports "ok" for all categories
except for the following (which report "optional"):

VT-x (VMX) :
VMX inside SMX   missing (optional)

VT-d (IOMMU #0-3) :
39-bit AGAW  missing (optional)

(2M pages and 1G pages show as ok)

Wayne

On Tue, Jun 18, 2019 at 2:32 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 17.06.19 21:06, Wayne wrote:
> > Hi Jan,
> >
> > I am still having trouble getting the non-root linux kernel to boot up.
> Based
> > on your suggestions I tried two scenarios and am using your AMD kernel
> config
> > you pointed me to above:
> >
> > 1. Attempted to use the 70MB root linux initramfs (generated through
> kernel
> > "make install"), but I get this error:
>
> What do you mean with "generated through kernel"?
>
> >
> > [    2.648665] rootfs image is not initramfs (write error); looks like
> an initrd
> > [    2.655732] /initrd.image: incomplete write (-28 != 71905893)
> > [    2.672708] Freeing initrd memory: 70224K
> >
> > Since we suspect possible image corruption by the kernel extracting,  I
> doubled
> > my guest linux memory allocation.  Therefore I now have 416MB of memory
> reserved
> > by the root linux command line for the guest.  I can see that the
> "MemTotal"
> > available in /proc/meminfo went down by approx 416MB accordingly after
> updating
> > the root command memmap arg.  However, if I try to execute the
> "jailhouse cell
> > linux ..." command with a  memory region .size of 400MB (or even 256MB)
> then
> > jailhouse throws the following error:
> >
> > Traceback (most recent call last):
> >    File "./tools/jailhouse-cell-linux", line 824, in <module>
> >      cell = JailhouseCell(config)
> >    File "/home/test/jailhouse-next/tools/../pyjailhouse/cell.py", line
> 36, in
> > __init__
> >      raise e
> >    File "/home/test/jailhouse-next/tools/../pyjailhouse/cell.py", line
> 33, in
> > __init__
> >      fcntl.ioctl(self.dev <http://self.dev>,
> > JailhouseCell.JAILHOUSE_CELL_CREATE, create)
> > OSError: [Errno 12] Cannot allocate memory
> >
> >   Any thoughts here?
>
> Nothing obvious in the configs. Well, you have the 0x3a600000 range twice
> in the
> root cell config. That should not cause the problem, though. Should still
> be fixed.
>
> Maybe you are running out of hypervisor memory because your hardware does
> not
> support large pages and therefore requires larger paging structure. But
> that's
> also rather unlikely - unless the hardware is 5 years or so old. What all
> does
> "jailhouse hardware check" report?
>
> >
> > 2. If I use my 30MB guest linux 4.19 initramfs instead (generated
> through kernel
> > "make install"), then it gets passed the extracting phase but falls into
> the
> > dracut emergency shell.  The shell then keeps scrolling repeatedly on
> the UART
> > (ttyS0):
> > :/#
> > :/#
> > :/#
> > ...
> > Any thoughts on why this scrolling is occuring? I'm viewing the serial
> output on
> > another linux machine with "cat /dev/ttyS0".
> >
> > Any idea why its dropping into the emergency prompt rather than
> continuing to
> > boot the kernel?  The initramfs was just re-generated with "make
> install" and
> > should match the 4.19 guest.
>
> Given all the problems and variables, I would rather recommend trying a
> known-to-work initrd first, ie. the one we generate via buildroot. If it
> helps,
> I can share a binary for x86 offlist. From there, you can stepwise change
> more
> variables.
>
> Jan
>
> >
> > Note that my root kernel is vanilla 4.16 and my non-root linux guest is
> 4.19
> > jailhouse enabling from siemens.  I attached my latest System config and
> > non-linux cell config.
> >
> >
> > Thanks for your repeated help,
> >
> > Wayne
> >
> > On Thu, Jun 13, 2019 at 2:55 PM Jan Kiszka <jan.kiszka@siemens.com
> > <mailto:jan.kiszka@siemens.com>> wrote:
> >
> >     On 13.06.19 20:49, Wayne wrote:
> >      > I added the "-k 10" to the command and unfortunately it did not
> make a
> >      > difference with the unpacking.  If I add  "root=/dev/ram0" it
> does get
> >     past the
> >      > unpacking, but throws the panic for "System is deadlocked on
> memory".
> >      >
> >      > I have attached my current non-root kernel config.  Should I
> expect to be
> >     able
> >      > to log in to the non-root if I use the same initramfs as the root
> linux?
> >      >
> >
> >     You should at least expect to see no error messages of the kernel,
> possibly
> >     some
> >     futile probing of devices and then likely a console prompt.
> >
> >     Let's try my kernel config from jailhouse-images first. If that
> works, you can
> >     tune from there towards your needs. I still think there is some
> sizing issue or
> >     so, but I'm not seeing the key difference immediately.
> >
> >     Jan
> >
> >     --
> >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >     Corporate Competence Center Embedded Linux
> >
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc3hURr3dFrw2ga%3Duf9A02KZ1OEEtMAPOVJyCAP3Fs%2Bfmw%40mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--0000000000007c807a058b98018c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Jan/Ralf:<div><br></div><div>I just meant that my initramf=
s files get generated by the &quot;dracut&quot; script, which gets run auto=
matically when executing &quot;make install&quot; in the kernel distributio=
n.=C2=A0 I would be happy to try your x86 initrd binary, it may tell us som=
ething.=C2=A0 I haven&#39;t been able to install buildroot successfully.=C2=
=A0 Is there any specific reason why you would need it for an x86 poweredge=
 as opposed to the standard dracut/mkinitramfs for the guest?=C2=A0=C2=A0</=
div><div><br></div><div>Running the &quot;jailhouse hardware check&quot; re=
ports &quot;ok&quot; for all categories except for the following (which rep=
ort &quot;optional&quot;):</div><div><br></div><div>VT-x (VMX) :=C2=A0=C2=
=A0</div><div>VMX inside SMX=C2=A0 =C2=A0missing (optional)</div><div><br><=
/div><div>VT-d (IOMMU #0-3) :=C2=A0</div><div>39-bit AGAW=C2=A0 missing (op=
tional)</div><div><br></div><div>(2M pages and 1G pages show as ok)</div><d=
iv><br></div><div>Wayne</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jun 18, 2019 at 2:32 AM Jan Kiszka &l=
t;<a href=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.06.=
19 21:06, Wayne wrote:<br>
&gt; Hi Jan,<br>
&gt; <br>
&gt; I am still having trouble getting the non-root linux kernel to boot up=
.=C2=A0 Based <br>
&gt; on your suggestions I tried two scenarios and am using your AMD kernel=
 config <br>
&gt; you pointed me to above:<br>
&gt; <br>
&gt; 1. Attempted to use the 70MB root linux initramfs (generated through k=
ernel <br>
&gt; &quot;make install&quot;), but I get this error:<br>
<br>
What do you mean with &quot;generated through kernel&quot;?<br>
<br>
&gt; <br>
&gt; [ =C2=A0 =C2=A02.648665] rootfs image is not initramfs (write error); =
looks like an initrd<br>
&gt; [ =C2=A0 =C2=A02.655732] /initrd.image: incomplete write (-28 !=3D 719=
05893)<br>
&gt; [ =C2=A0 =C2=A02.672708] Freeing initrd memory: 70224K<br>
&gt; <br>
&gt; Since we suspect possible image corruption by the kernel extracting,=
=C2=A0 I doubled <br>
&gt; my guest linux memory allocation.=C2=A0 Therefore I now have 416MB of =
memory reserved <br>
&gt; by the root linux command line for the guest.=C2=A0 I can see that the=
 &quot;MemTotal&quot; <br>
&gt; available in /proc/meminfo went down by approx 416MB accordingly after=
 updating <br>
&gt; the root command memmap arg.=C2=A0 However, if I try to execute the &q=
uot;jailhouse cell <br>
&gt; linux ...&quot; command with a=C2=A0 memory region .size of 400MB (or =
even 256MB) then <br>
&gt; jailhouse throws the following error:<br>
&gt; <br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0 File &quot;./tools/jailhouse-cell-linux&quot;, line 824, =
in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cell =3D JailhouseCell(config)<br>
&gt;=C2=A0 =C2=A0 File &quot;/home/test/jailhouse-next/tools/../pyjailhouse=
/cell.py&quot;, line 36, in <br>
&gt; __init__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 raise e<br>
&gt;=C2=A0 =C2=A0 File &quot;/home/test/jailhouse-next/tools/../pyjailhouse=
/cell.py&quot;, line 33, in <br>
&gt; __init__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fcntl.ioctl(<a href=3D"http://self.dev" rel=3D"nor=
eferrer" target=3D"_blank">self.dev</a> &lt;<a href=3D"http://self.dev" rel=
=3D"noreferrer" target=3D"_blank">http://self.dev</a>&gt;, <br>
&gt; JailhouseCell.JAILHOUSE_CELL_CREATE, create)<br>
&gt; OSError: [Errno 12] Cannot allocate memory<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Any thoughts here?<br>
<br>
Nothing obvious in the configs. Well, you have the 0x3a600000 range twice i=
n the <br>
root cell config. That should not cause the problem, though. Should still b=
e fixed.<br>
<br>
Maybe you are running out of hypervisor memory because your hardware does n=
ot <br>
support large pages and therefore requires larger paging structure. But tha=
t&#39;s <br>
also rather unlikely - unless the hardware is 5 years or so old. What all d=
oes <br>
&quot;jailhouse hardware check&quot; report?<br>
<br>
&gt; <br>
&gt; 2. If I use my 30MB guest linux 4.19 initramfs instead (generated thro=
ugh kernel <br>
&gt; &quot;make install&quot;), then it gets passed the extracting phase bu=
t falls into the <br>
&gt; dracut emergency shell.=C2=A0 The shell then keeps scrolling repeatedl=
y on the UART <br>
&gt; (ttyS0):<br>
&gt; :/#<br>
&gt; :/#<br>
&gt; :/#<br>
&gt; ...<br>
&gt; Any thoughts on why this scrolling is occuring? I&#39;m viewing the se=
rial output on <br>
&gt; another linux machine with &quot;cat /dev/ttyS0&quot;.<br>
&gt; <br>
&gt; Any idea why its dropping into the emergency prompt rather than contin=
uing to <br>
&gt; boot the kernel?=C2=A0 The initramfs was just re-generated with &quot;=
make install&quot; and <br>
&gt; should match the 4.19 guest.<br>
<br>
Given all the problems and variables, I would rather recommend trying a <br=
>
known-to-work initrd first, ie. the one we generate via buildroot. If it he=
lps, <br>
I can share a binary for x86 offlist. From there, you can stepwise change m=
ore <br>
variables.<br>
<br>
Jan<br>
<br>
&gt; <br>
&gt; Note that my root kernel is vanilla 4.16 and my non-root linux guest i=
s 4.19 <br>
&gt; jailhouse enabling from siemens.=C2=A0 I attached my latest System con=
fig and <br>
&gt; non-linux cell config.<br>
&gt; <br>
&gt; <br>
&gt; Thanks for your repeated help,<br>
&gt; <br>
&gt; Wayne<br>
&gt; <br>
&gt; On Thu, Jun 13, 2019 at 2:55 PM Jan Kiszka &lt;<a href=3D"mailto:jan.k=
iszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank"=
>jan.kiszka@siemens.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 13.06.19 20:49, Wayne wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I added the &quot;-k 10&quot; to the command =
and unfortunately it did not make a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; difference with the unpacking.=C2=A0 If I add=
=C2=A0 &quot;root=3D/dev/ram0&quot; it does get<br>
&gt;=C2=A0 =C2=A0 =C2=A0past the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; unpacking, but throws the panic for &quot;Sys=
tem is deadlocked on memory&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I have attached my current non-root kernel co=
nfig.=C2=A0 Should I expect to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0able<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; to log in to the non-root if I use the same i=
nitramfs as the root linux?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You should at least expect to see no error messages=
 of the kernel, possibly<br>
&gt;=C2=A0 =C2=A0 =C2=A0some<br>
&gt;=C2=A0 =C2=A0 =C2=A0futile probing of devices and then likely a console=
 prompt.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Let&#39;s try my kernel config from jailhouse-image=
s first. If that works, you can<br>
&gt;=C2=A0 =C2=A0 =C2=A0tune from there towards your needs. I still think t=
here is some sizing issue or<br>
&gt;=C2=A0 =C2=A0 =C2=A0so, but I&#39;m not seeing the key difference immed=
iately.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Siemens AG, Corporate Technology, CT RDA IOT SES-DE=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Corporate Competence Center Embedded Linux<br>
&gt; <br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%2BKhc3hURr3dFrw2ga%3Duf9A02KZ1OEEtMAPOVJyCAP=
3Fs%2Bfmw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc3hURr3dFrw2ga%3Duf9A02KZ=
1OEEtMAPOVJyCAP3Fs%2Bfmw%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--0000000000007c807a058b98018c--
