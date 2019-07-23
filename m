Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBCF53PUQKGQE6YIQ7EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E85E715DA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 12:16:41 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id r5sf9198366ljn.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 03:16:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563877001; cv=pass;
        d=google.com; s=arc-20160816;
        b=x5nAHcUpfLQQBskZ68kBgh2JUgNz19slLA27b4jWOremVKriPMy5xGwfndT3y2ITMs
         /PuxDd6jemrOrE8ujrqxF7FowOVDoBdF073oNCLbQMcyVGQJx4aaCN6wDQXLzOJhGRLz
         +P/szAVaL5uvXyuX+SRbC7Ouoy9xbvw/X8jyoAITwhkEWu0lqrkUB02gScaPDrZIYeGa
         cxxBAs47xPPxdQ+lIHMiU6bScZsaghkrM7dwwx1mG+wpJoaSMVttlDX6TYRLxqAcCe4P
         Hncz7tNAiAChI0GqMQZPRECqjMim1E6YGwtn8aJRx6Kz0Ou17CKY+6S/L6BZcXUOBFuc
         hkIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=Gc33hcuZbXSofsce7XkMchfmvFrelFXaGqcSemC5I2Q=;
        b=KGkTWicJ6F3Ha69TOMvO6ryHTXvaKJS4qMoYRNaGdNN+fNjQWCBJbkaTowKjCG2hO0
         cDBp0pFLnEhaoRWhRH7T4+NgZyNAgm5VyS+s99MAgcyYTrQAwKx7v/An0SZURXY1Yeut
         uZvJFNSSFy4tesiS/UkXXW07Qo+dkG1DJDyjHrMAiiOgdjG7xeTBOTI2beHZ8XhJH5Ff
         h2MoFz6+fpUpNTvt+rKZzjbfrdbM4F3MqMeSR7vgoF8pfgm+qOhuS5rfUmXxhUKVEUvf
         8Kw007sUrB+jIw/mDlun5LHoXsEhrQ4BZzygOEYbnlpKdL1IqhDGw7Ni2mY1Dd7/smim
         fbpg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=lLtDfD0M;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Gc33hcuZbXSofsce7XkMchfmvFrelFXaGqcSemC5I2Q=;
        b=rUXqMONkp/mtOcwG2uHiQszjmI3SsqSxSUXJKQ8cVffSoLkJW1mYZqnjiaeOlhRdxc
         ND0laLxojQrDtgKO4ODFVXzXP9UunW8Z5NMEqfFJN6A0womu1Msoz4LMP7lHPK3zVB4T
         AWQY40qhBEUH2jup+d7nF6vIwnGwVahbSnm0KewbHcckGInBs/OrImdKW268ZalGPozJ
         2C04c0/Y4DUM3ql14zD3HtR8/skgzQ6rtXf1wfbYHDsgNkloIdo40lOWoeDn7dZM5GOt
         9bjJCH+AlU59+2hEIG9KBG3e2wuqgL8sMbO6DJywkFw6YJTgpGb8IsVlspbvOFjS5Ycc
         fbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Gc33hcuZbXSofsce7XkMchfmvFrelFXaGqcSemC5I2Q=;
        b=Nf7JDC5aAaB+JwE5qpklkQKT2hHgu0x+x5DjXWMxzhHzlE6sqIvPRedJMjBJZp8e+2
         7n6zlIpz0Ix8TVlp5IS5H6BvQjvVECr/UIZA4gSvWxK4OVj30GqS6Iyt5tpDPCmRnk+U
         kyTSk4oOL/ZmfDwSiuDT3BODlBEg+pZ3bkYAEWakyuim4tLbDkAmfr3FrydEK3YbYu2I
         Eo+xA1UBI+SDx86wvEJ97tJR//2YAvvwyLAWyzxygOTRXmCTg6H567Bz4FDUqt/z5/3y
         QEdpVERCABo50bo+Y+ON6uSoO3v5EcWTgHAcsTRWDqsTlVwQ6jmlbxCY8Zp1hEnjLxOm
         IOaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVxq5dpGU+emU3CzO7NCIkTGUwsfwZyqkb1vI8N+77sMjBbIBge
	iCEf1C56PQXmozMHKfe7HU4=
X-Google-Smtp-Source: APXvYqyGVhvdVs1ROy8IpSEHVCk9GH9ZStwS3yh4DAz5QIM2Gfx/wc53LKP2v9xkDZEjM1sC+jIgtg==
X-Received: by 2002:ac2:5097:: with SMTP id f23mr35313149lfm.130.1563877000885;
        Tue, 23 Jul 2019 03:16:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8917:: with SMTP id d23ls4801097lji.14.gmail; Tue, 23
 Jul 2019 03:16:40 -0700 (PDT)
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr38261478ljh.79.1563877000369;
        Tue, 23 Jul 2019 03:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563877000; cv=none;
        d=google.com; s=arc-20160816;
        b=F62qemwYSjy7aqj2x05Pn1N4Gas399uMBDiRw2pxY2JQ77JgO0CWOyaQG6TjqbBPY9
         4Qwf+1yD9ZDcbyRDi63i716sYtSHwPOHXl/E9GOTOiHbypz6++NCmzVSLuJn0eaM6wAt
         wxQclTv9O3VJtIkYdiCwoL7qR5n8G/0/dmSkn2HU2xvb+cWUMPgYXNS3B+r1CxodrrKz
         BWXaKsPy70mzBq2L/lndWuMq5CwLEI5UgNdcLioWSrueTmJO37KnuZYrqCzkwFxWMjQn
         P3mM0X/+cJFeONkS00flH0F3W/Hbj++p4ZET8Eaw01qhZujzBPJXGxMA0tueoU0NXb6t
         ENpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=C1C60C4xfi+9zH3URs+B9P9rcs/FhcXfRV2tK/V5/eY=;
        b=dG9V9nTwCDGA9JNR883Typ2bc239xUwRdRT+v1qI3sfxRMDQAQIsFuW310I/HwxJj8
         s0ncBxj4Iq004qDoqVg1vO6lzf4EAKMY4/z4axuJo7bZ0k+xUmT966Lt2C9wfyGof/yU
         BE5CZfM8h8Gunml2/lJFVkPLcQ4bqUdE21xPXmihIdwyVl4RcWOBVIplirfsNPcb+Ofh
         D+Oguu3T4KoUCwAJ4MwEEOp4fAuBl8YFo4ja9P+9hcgwizhTJIXtNIhyGSzTGRmVOLi0
         Eg9UCCSUJZgwvRuXs6zHOajrPhO4ODEjIBDZaX+3cIFMC7cBR7wpQXhcArUbo+3Tx7Sc
         lwqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=lLtDfD0M;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id z18si1903815lfh.1.2019.07.23.03.16.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 03:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45tDsg1Whfzy4D;
	Tue, 23 Jul 2019 12:16:39 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 23 Jul
 2019 12:16:39 +0200
Subject: Re: Assigning a PCI device to a non-root cell
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <7f2b8593-b6bb-353c-1eb8-604076f7da6b@oth-regensburg.de>
 <521c1b04-ab40-e566-5625-5827d3a7f2e2@siemens.com>
 <46aff85a-01ba-875e-1752-cb40f9080b31@oth-regensburg.de>
 <99f6615e-3621-3a7a-7bea-33839e48653e@siemens.com>
 <f7f0f3d4-33e7-bc74-7bb9-79cdb8c52c0d@oth-regensburg.de>
 <c6c3d947-d6ac-be55-6094-9743a61ccbbd@siemens.com>
 <3bd05e0d-d888-ffef-96e7-ef7ce023f2f9@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <cea81495-4bee-2f8d-a0f9-a1c7b57027ec@oth-regensburg.de>
Date: Tue, 23 Jul 2019 12:16:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3bd05e0d-d888-ffef-96e7-ef7ce023f2f9@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=lLtDfD0M;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 7/11/19 1:07 AM, Ralf Ramsauer wrote:
> On 7/10/19 7:22 PM, Jan Kiszka wrote:
>> On 10.07.19 18:28, Ralf Ramsauer wrote:
>>>
>>> On 7/10/19 6:13 PM, Jan Kiszka wrote:
>>>>> Ok, there's one chance left: According to lspci, the device actually
>>>>> supports MSI. It's just not being used by Linux. Maybe I can somehow
>>>>> convince Linux to switch to MSI.
>>>> Latest kernel already?
> 
> Latest kernel doesn't change anything.
> 
>>>>
>>>
>>> I'm using the 4.19-rt jailhouse. Do you know of any relevant changes
>>> upstream? Anyway, it's worth a try, let me test upstream...
>>>
>>> At least for 4.19, it looks like I'm not able to easily switch to MSI.
>>> At the moment, I don't even understand why the kernel actually uses
>>> legacy interrupts, while MSI cap is present. Something is odd there, I'd
>>> expect that MSI is, if available, the perefered method. But even the
>>> root-cell after boot won't enable MSI. Still investigating...
>>>
>>> I hope that I can switch to MSI with maybe a dirty hack, but I need more
>>> time to dig through the kernel's PCI stack (PCI starts bugging me). You
>>> can find things there you never wanted to know! :-)
>>
>> I suspect you are using some 8250 derivative with a similar driver:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=172c33cb61da0df5ccbdf1a8e736c8837d165a00
>>
>> Check your concrete driver for its interrupt allocation.
> 
> Thanks for the pointer, this patch is really helpful and almost exactly
> what I'm looking for. I want to test the required changes of the driver
> on Linux without Jailhouse first, before I'm going to test it in a
> non-root cell.
> 
> My device uses the standard 8250_pci driver. So I hooked in there, and
> tried the following hack:
> 
> 
> diff --git a/drivers/tty/serial/8250/8250_pci.c
> b/drivers/tty/serial/8250/8250_pci.c
> index bbe5cba21522..55f8144ef3e0 100644
> --- a/drivers/tty/serial/8250/8250_pci.c
> +++ b/drivers/tty/serial/8250/8250_pci.c
> @@ -3640,10 +3640,20 @@ pciserial_init_ports(struct pci_dev *dev, const
> struct pciserial_board *board)
>         priv->dev = dev;
>         priv->quirk = quirk;
> 
> +       pci_set_master(dev);
> +
> +       rc = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
> +       if (rc < 0) {
> +               kfree(priv);
> +               priv = ERR_PTR(rc);
> +               goto err_deinit;
> +       }
> +
>         memset(&uart, 0, sizeof(uart));
>         uart.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
>         uart.port.uartclk = board->base_baud * 16;
> -       uart.port.irq = get_pci_irq(dev, board);
> +       uart.port.irq = pci_irq_vector(dev, 0);
>         uart.port.dev = &dev->dev;
> 
>         for (i = 0; i < nr_ports; i++) {
> 
> 
> Luckily, probing succeeds. For the device, lspci reports:
> 
> 01:00.0 Serial controller: Device 1c00:3253 (rev 10) (prog-if 05 [16850])
> [...]
> 	Capabilities: [68] MSI: Enable+ Count=1/32 Maskable+ 64bit+
> 		Address: 00000000fee00438  Data: 0000
> 		Masking: ffffffff  Pending: 00000000
> 
> Doesn't look bad so far. MSI is enabled and in use. And as soon as I
> write to or read from the device (echo / cat), the MSI interrupt appears
> in /proc/interrupts.
> 
> But cat won't receive anything, and echo won't write anything. In fact,
> echoing to the device stalls until I abort with ^C. In both cases, no
> interrupts occur (according to /proc/interrupts).
> 
> That would have been too easy.

Turns out it is that easy. Code above works perfect, but the serial
card's MSI support seems to be broken. So I went for another PCIe serial
card, and now it works fine.

Let me just advertise this product, in case someone else runs into the
same issue. [1] comes with two serial lines -- one PCI function per
line, which is pretty nice. Didn't try it yet, but it should be possible
to assign ports to different cells. Yet, the kernel needs to be patched
in order to enable MSI.

  Ralf

[1] https://www.amazon.de/gp/product/B0073LM0S4

> 
> Thanks
>   Ralf
> 
>>
>> Jan
>>
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cea81495-4bee-2f8d-a0f9-a1c7b57027ec%40oth-regensburg.de.
