Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBSW7THUQKGQEWIPITUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6A064F09
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:07:55 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id b21sf2716374edt.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 16:07:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562800075; cv=pass;
        d=google.com; s=arc-20160816;
        b=P306n+PMxa567qubG8E4A4+Yui1VK8AFDYEKMGHCFtyZja5WuF7h1h9YuPhGwXDc+n
         SCFJJ8dRIDybrut4RHNSeYyJHNtxNcm4lyJKdofntyV6xGdA//sqLJ1jdFShz3XgLtxY
         AOwn6Jo+zpvqlydpzTA1cKAuP5J6RZPEBE3lUK7/wuMirYa8uT3fPX9I/FdcD2jvFGtc
         QZ8zl5Qryw6vaTTC+1L/fr5/EJwdcz42UPnGL0F7R3TmhUDo4kCcm2zLElAwhUeYThm9
         gDau1sk0pNrEgv422ved6MAO5F3o8lRnpvWLaCepXUPFj57RVpLkQG3H5nP5DhwOfdOr
         R+Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:openpgp
         :from:references:to:sender:dkim-signature;
        bh=yKGR5p8icf4ch8g/7zz309NuZ+U5UUIFNOlR7p6vlbs=;
        b=Kk4738dDjyNtlty0sUY7TWQbbvye69MLihpOs9pOUCRJLy04lBi3VbWTwS/G1NBryG
         PAFtNlUW92HVBjZ1+ppnQQJrMOnFA2BFlsR1citqEBPkrJALpkSBIP61uOvqxqz5P4C2
         Pc4fd257MQslHnJ5H3j1Ml37b5MbEaKWia1qlLBIdyn3lHt6buxcMZR871dkaTwlGwuT
         hbvOUZSfK8zBN28b1FH3XtNxuCReUHZaYTJdQHYZk9+U0ki9L1toMhLu26JAqEqaX2+l
         S8c7eXRtc0u9LI75/HE7NXoPHZJJy9GG6SepmlNQS1vXfP8LN0OMox5OvzWrnW6ISC7i
         wEYg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=O9BIEMmn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yKGR5p8icf4ch8g/7zz309NuZ+U5UUIFNOlR7p6vlbs=;
        b=oO2kt7Eu5Xx/488jmfzBHKiUBvtdluesQjEbag5Q/iKQ0GDhLj4HmQcx6vZkkK1G7R
         loee62gRc84BpxzDtg6gTShU99cIqRlb9htg9Q5I6mU9jVCHn6Q1zt6YcTDIbMbZc+iq
         83e3B1srA8cZ4HVLvrzYlMxXCadJFwDA/aWOYTIQL/txQ1QtaLr62FdncVBh3AfgY8ea
         S9tUUWEQr1fyQ591XJqVRS/SzDcfgcdwF8YQIEz5WbNrTJ+GjJHFf5pQAuY6Sy92ucK7
         mE/2i3fJG4/dLc/Pp8vu9+8bhj3aPyLRFXXJpw8MS/twGj869GQIWPCATpvWvutNc1uZ
         UBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yKGR5p8icf4ch8g/7zz309NuZ+U5UUIFNOlR7p6vlbs=;
        b=fomE43HRB6d7y0S08nocAKM9ptYTXZBt71y1WpXapq9XzP/RhIEAhLAI4TYbupPI8k
         z9RRB6ffOt2Fe9MmLvPsOBUHv8PmOhb3tpMPEMx11jFkOGwZ5K6ZOIomMzUS+C+6yoG2
         nBp8MGiQofjkZUAuRQwh/3ghUGamAAVnG0osJfWq8Fwvwu9xWaWnn1r0JUWo/Gst3Xxi
         /FQj60EDVxD3W+meD55OP5Ksvu2DQ1RbQk5D/XRzfJrZ0MM/ZMa3l3edPTAcIpyPkvpP
         tLFYAF6pzUE97wrmFpUOMIizrQLssfODNrE7fPAoDrw+tFqZM0rjdaCsnKBHC6p7JG2z
         VbAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUhvQHM/oCtbP18Zs2upmp7rtJ72s5LYsI+5F5vL3jDYGLh3EdO
	88nxMEK58drnqrlrP2Msyl8=
X-Google-Smtp-Source: APXvYqxavoF17O9ka63qsr4Dcs5pxvmz+u398qSQq+p3Arx0t0ApV2U9rGmliEe69Ue7z98Qu31gHA==
X-Received: by 2002:a50:b3d0:: with SMTP id t16mr429009edd.158.1562800075102;
        Wed, 10 Jul 2019 16:07:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:ada:: with SMTP id z26ls641360ejf.4.gmail; Wed, 10
 Jul 2019 16:07:54 -0700 (PDT)
X-Received: by 2002:a17:906:9147:: with SMTP id y7mr564548ejw.66.1562800074388;
        Wed, 10 Jul 2019 16:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562800074; cv=none;
        d=google.com; s=arc-20160816;
        b=eUXoqbf+w8Tdg2GZplhJZvWucfw08Oz97gdBcZOgbk1R+KKLEbCRWwMY+dq+XdOW+W
         upYibKiH3vF5szAJa+M2Hs16GJYl+iSbJdMJ9iJ+nDPKKbNPZH2SOhNlIXu1tmjgtPDh
         vLD0lj7ILjHeGyyj9O1PyNujJOm6qiI0AXIDMBkiVQMPBTlf5msDx/1Q+U2vxzBLNtSS
         mvfRDhrw6e7IEqz2Lr8+JZByyLe+lUqPwuX4HIgE8uXquJhx7KlVJD6OPZYzsF4w7RDo
         vaxINqQ2mXz8Gwj0IXZkkmBYNqYhrYiQP6uOzI7YlSSyQqE2WI44cYRge8Hxi7aMoiyt
         +12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=q8hzka90wMMgkPTiPVxzlQ0bEYOsri3hS8JVxrIjiyU=;
        b=GnIFC5T+DKPxqiKOSdVCKtYlLgMfUeurN2/XdVMrKuOP97gOtIy8RpopsJTevVdIRh
         xSwbQAjoMnu76bqWY6IJ3NJ9x89ac64St3PBQXmc4C14eEmWe+seH6r/VrH0/fwOZhP7
         BYsJLKTYjCtxMg3QIa+W65kK7V+ZDeaXd0KmWZ0fYU3Tc4iULrHNz1wh9vjNuozfLjC5
         nipiwZ9OFrlH9sqmNiSv3ch92CTVHlfq1vJ70MJJyVn7/8SEulcrQAyflb2PrqQFkjMB
         dtcFwY21P13af/vhEadBjPiy3w3JpG78Rhmw0XR5yiGFxSBSHrPTWUF1/09I/xCp9w4h
         5uvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=O9BIEMmn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id a41si203555edc.5.2019.07.10.16.07.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 16:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45kZbY5VTMzyYc;
	Thu, 11 Jul 2019 01:07:53 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 11 Jul
 2019 01:07:53 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <7f2b8593-b6bb-353c-1eb8-604076f7da6b@oth-regensburg.de>
 <521c1b04-ab40-e566-5625-5827d3a7f2e2@siemens.com>
 <46aff85a-01ba-875e-1752-cb40f9080b31@oth-regensburg.de>
 <99f6615e-3621-3a7a-7bea-33839e48653e@siemens.com>
 <f7f0f3d4-33e7-bc74-7bb9-79cdb8c52c0d@oth-regensburg.de>
 <c6c3d947-d6ac-be55-6094-9743a61ccbbd@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: Assigning a PCI device to a non-root cell
Message-ID: <3bd05e0d-d888-ffef-96e7-ef7ce023f2f9@oth-regensburg.de>
Date: Thu, 11 Jul 2019 01:07:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <c6c3d947-d6ac-be55-6094-9743a61ccbbd@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=O9BIEMmn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 7/10/19 7:22 PM, Jan Kiszka wrote:
> On 10.07.19 18:28, Ralf Ramsauer wrote:
>>
>> On 7/10/19 6:13 PM, Jan Kiszka wrote:
>>>> Ok, there's one chance left: According to lspci, the device actually
>>>> supports MSI. It's just not being used by Linux. Maybe I can somehow
>>>> convince Linux to switch to MSI.
>>> Latest kernel already?

Latest kernel doesn't change anything.

>>>
>>
>> I'm using the 4.19-rt jailhouse. Do you know of any relevant changes
>> upstream? Anyway, it's worth a try, let me test upstream...
>>
>> At least for 4.19, it looks like I'm not able to easily switch to MSI.
>> At the moment, I don't even understand why the kernel actually uses
>> legacy interrupts, while MSI cap is present. Something is odd there, I'd
>> expect that MSI is, if available, the perefered method. But even the
>> root-cell after boot won't enable MSI. Still investigating...
>>
>> I hope that I can switch to MSI with maybe a dirty hack, but I need more
>> time to dig through the kernel's PCI stack (PCI starts bugging me). You
>> can find things there you never wanted to know! :-)
> 
> I suspect you are using some 8250 derivative with a similar driver:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=172c33cb61da0df5ccbdf1a8e736c8837d165a00
> 
> Check your concrete driver for its interrupt allocation.

Thanks for the pointer, this patch is really helpful and almost exactly
what I'm looking for. I want to test the required changes of the driver
on Linux without Jailhouse first, before I'm going to test it in a
non-root cell.

My device uses the standard 8250_pci driver. So I hooked in there, and
tried the following hack:


diff --git a/drivers/tty/serial/8250/8250_pci.c
b/drivers/tty/serial/8250/8250_pci.c
index bbe5cba21522..55f8144ef3e0 100644
--- a/drivers/tty/serial/8250/8250_pci.c
+++ b/drivers/tty/serial/8250/8250_pci.c
@@ -3640,10 +3640,20 @@ pciserial_init_ports(struct pci_dev *dev, const
struct pciserial_board *board)
        priv->dev = dev;
        priv->quirk = quirk;

+       pci_set_master(dev);
+
+       rc = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
+       if (rc < 0) {
+               kfree(priv);
+               priv = ERR_PTR(rc);
+               goto err_deinit;
+       }
+
        memset(&uart, 0, sizeof(uart));
        uart.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
        uart.port.uartclk = board->base_baud * 16;
-       uart.port.irq = get_pci_irq(dev, board);
+       uart.port.irq = pci_irq_vector(dev, 0);
        uart.port.dev = &dev->dev;

        for (i = 0; i < nr_ports; i++) {


Luckily, probing succeeds. For the device, lspci reports:

01:00.0 Serial controller: Device 1c00:3253 (rev 10) (prog-if 05 [16850])
[...]
	Capabilities: [68] MSI: Enable+ Count=1/32 Maskable+ 64bit+
		Address: 00000000fee00438  Data: 0000
		Masking: ffffffff  Pending: 00000000

Doesn't look bad so far. MSI is enabled and in use. And as soon as I
write to or read from the device (echo / cat), the MSI interrupt appears
in /proc/interrupts.

But cat won't receive anything, and echo won't write anything. In fact,
echoing to the device stalls until I abort with ^C. In both cases, no
interrupts occur (according to /proc/interrupts).

That would have been too easy.

Thanks
  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3bd05e0d-d888-ffef-96e7-ef7ce023f2f9%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
