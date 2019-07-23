Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBX573PUQKGQE5OOFAUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 07097715F0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 12:22:24 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id e14sf9164038ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 03:22:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563877343; cv=pass;
        d=google.com; s=arc-20160816;
        b=WeBWdWmJ/q3CtJtSUoh66N//7ZQKT6xctfkqNdF4XE90DxR7pGHOjqvOBKduRSxAMq
         WX6tusc0kmAxKTh9K5NO1wTl/XxP6oXLR2FvMtRbPx3GTZkJ0I/9Wlmerj9DMlm4tdkt
         VRmSCLRsOKhJm5zJsZqnVYOedX3XaO1q3hyav50ihdn7TsiSyH2D6yqMs1+oqXgZsiIp
         EssPJpQSSA9ljDm/ayfm+zCWhZ6t9IAToNBhJgoJ0V4K3p1LLaioPCpSb+RkOdDF7sPz
         V8pw3qGyKraJbCrArO7HJtTwtM1imrcMm4WyL47FE6vva5YZTs4bOf+sInsP9JyPWFnT
         gjTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=3t44YljT0lkU/JaRu3wfY3w/bay4BcH7h3iXZsP5tow=;
        b=Z6AxsYoM08aTJtSQEy4RjNhgrBJ2I9Zky0uCw78lx6V9gbPBy9+IsRGhvwp35ZiUpN
         dfkwZKQ+8CoBL1MYZNUCI0izM4YpPcIivktjZD5nKk+39k6SH+eT/KyJ0QAJD1qj1lMu
         1nyJJm8Nt7b4hly5Z96aO5hWFuYzRfnCDVodurT5GEQFON81tsV7JDweK0Uc/hsBwlcs
         5x2SV4zwNpUbTb5gGXqxVOzX8TOf4oHvbKKUpQLQe82wXZKwkmshFazGZGdFqiRxLYkq
         qo/LuIV4fk34qPRLS8k1DBD+nZ4gcCHwznP+DSD7QW2hPSZOYp1iedqk/n6RGDujAuTx
         Of0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3t44YljT0lkU/JaRu3wfY3w/bay4BcH7h3iXZsP5tow=;
        b=qQrvTcVL1zKejaEiR3hK7uZa/HA4m1GsgiyYDRn+VspH97WlGedUja+0z+Yfpmd7LK
         7C4gHXonzFhyKL5wp7zlc30iiRqwya28TBq5cvblxcEhS4hAD405utFee+cEHk+2P3iI
         R3RkGc+7me4avxt5e2LLlC97JslJe5i3pw94X96agZYEwB26CfRzLY1UpWkZJEjl7zwK
         UNlx3QddicV+7HxzxcK0+i8GDRBJ1gy2c2bnF11h8qHuC1BBh6kTMTAOl6R8/oEbYfBa
         GipZSRCksXO4OdzTwYGiDZVHdeQZqwicwyEdimAhW2Ossdi9joKzXPzoTvyGR4CyV7EV
         uA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3t44YljT0lkU/JaRu3wfY3w/bay4BcH7h3iXZsP5tow=;
        b=daSA/UfvubQ8KEc+iN95HVq8I4gIIAwZ4Eze6w5QIAhMRxoOcJ5WdOSF2ovJ+g7UH4
         XlBIPKFSLOSgYMbfJnmh8o712YUwgBD8g0hXV/798fCGv14AQKro7GsmIhe+yRAZ7GPC
         CNmsbRDnM7vSAupSd8FnwJKBaXaPnkk9c6kU2uzvg+y3TF+tEt1UKEO7pETr3slPDR8h
         TfKuVTO1HT4lax7JCjtj1DgLqsGQaWer07lUpy5sG61xijN8zsf8eX/xMK2d2678xD5Z
         Mbt4jqpc0SQx/KGIBS8ca6e+9ElyAMnoKGhGI0zTxcaI71Z3i9rbYzRaM7JelMtS2Le+
         XfgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVD1v9+0+EM7mKeVH0LatumEPxlvYhH0hMT3VvxRbnUJuyrmYNI
	LjeIt5sNr/51D9k3KvqIz8Y=
X-Google-Smtp-Source: APXvYqx4qjMfBcfpEC0hhkhZj5WOblSkpxLnuAjVrI9HANgifbtqu7pDJmNWY+7wiriQ1zuj/izCiQ==
X-Received: by 2002:a2e:989a:: with SMTP id b26mr38815332ljj.31.1563877343630;
        Tue, 23 Jul 2019 03:22:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6556:: with SMTP id z83ls4803196ljb.11.gmail; Tue, 23
 Jul 2019 03:22:22 -0700 (PDT)
X-Received: by 2002:a2e:b60f:: with SMTP id r15mr38825945ljn.172.1563877342942;
        Tue, 23 Jul 2019 03:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563877342; cv=none;
        d=google.com; s=arc-20160816;
        b=TMS64TekeztSVXnNUHJCxQnIFLqMQi//2oJhkOyRJk+Ui9bkC0Q9diIlTWs5q09svA
         vOvJ/fqAsFrDg3DSi/lfI4pIGSNzFjWS1kLJESKg+zdPU27HiFdFBlPA5KdzxD8Jeebn
         EgU70y8xxCfMCg31cxOy/0wzTnwMFYrrSoArVmZCsng9TFpTukJqvDFGYZPRPIeU9otQ
         qEUL2e9Rzb5xLC5b23lN1UD7Q3ZIfwx9pjIRbFRm/cf9CdqVCGJRm7dtZUeH2c+9XEz6
         S/o6tlkFo6IblQqv5vnSWjkuZiRDQubpDGGim+Fo6aiLLp6vXLmUHBp/kWtbGd1PVeGg
         l2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=a0xZkRkBOZaGtl3ys5bgwUSePNt0LqjA8qTfOFOMrLE=;
        b=pcga0YYtFVGnLEOXLjyQM2QuBqsD+w+t0JL2XCpJU4aqpHAAHTT0Ay0cl0vhehgqpE
         7TRSVK5ZkGPzxzCGhAv8b9JaP+s5IavRYaOr+EkwjIU80TRFYDQKhy02Y1PVAg680Bct
         8hPdyogkFWWCQ3xrKN7+fTYWvxBj8WwuiLSulAM9+uW556YueHZDkcu+eYo8SsgVisgT
         5OULPe5i2ILEi4AN/2ZkDSHdgby2/NjBm+fAKPO5i8Yy+rtdQgkeUmitp47QYks8NrBQ
         0Wrf/FzgTVk255Qctqj9KXYXYLRdo+PfmrI+5e3WfAa38W6cXS9Js9LibGL0oBUS5eZ+
         Cmbg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z18si1904380lfh.1.2019.07.23.03.22.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 03:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6NAMMv8005416
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2019 12:22:22 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6NALn0C013694;
	Tue, 23 Jul 2019 12:21:49 +0200
Subject: Re: Assigning a PCI device to a non-root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <7f2b8593-b6bb-353c-1eb8-604076f7da6b@oth-regensburg.de>
 <521c1b04-ab40-e566-5625-5827d3a7f2e2@siemens.com>
 <46aff85a-01ba-875e-1752-cb40f9080b31@oth-regensburg.de>
 <99f6615e-3621-3a7a-7bea-33839e48653e@siemens.com>
 <f7f0f3d4-33e7-bc74-7bb9-79cdb8c52c0d@oth-regensburg.de>
 <c6c3d947-d6ac-be55-6094-9743a61ccbbd@siemens.com>
 <3bd05e0d-d888-ffef-96e7-ef7ce023f2f9@oth-regensburg.de>
 <cea81495-4bee-2f8d-a0f9-a1c7b57027ec@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5ef2896d-0ee3-b93d-2049-4b6c3472cef0@siemens.com>
Date: Tue, 23 Jul 2019 12:21:48 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <cea81495-4bee-2f8d-a0f9-a1c7b57027ec@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 23.07.19 12:16, Ralf Ramsauer wrote:
> 
> 
> On 7/11/19 1:07 AM, Ralf Ramsauer wrote:
>> On 7/10/19 7:22 PM, Jan Kiszka wrote:
>>> On 10.07.19 18:28, Ralf Ramsauer wrote:
>>>>
>>>> On 7/10/19 6:13 PM, Jan Kiszka wrote:
>>>>>> Ok, there's one chance left: According to lspci, the device actually
>>>>>> supports MSI. It's just not being used by Linux. Maybe I can somehow
>>>>>> convince Linux to switch to MSI.
>>>>> Latest kernel already?
>>
>> Latest kernel doesn't change anything.
>>
>>>>>
>>>>
>>>> I'm using the 4.19-rt jailhouse. Do you know of any relevant changes
>>>> upstream? Anyway, it's worth a try, let me test upstream...
>>>>
>>>> At least for 4.19, it looks like I'm not able to easily switch to MSI.
>>>> At the moment, I don't even understand why the kernel actually uses
>>>> legacy interrupts, while MSI cap is present. Something is odd there, I'd
>>>> expect that MSI is, if available, the perefered method. But even the
>>>> root-cell after boot won't enable MSI. Still investigating...
>>>>
>>>> I hope that I can switch to MSI with maybe a dirty hack, but I need more
>>>> time to dig through the kernel's PCI stack (PCI starts bugging me). You
>>>> can find things there you never wanted to know! :-)
>>>
>>> I suspect you are using some 8250 derivative with a similar driver:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=172c33cb61da0df5ccbdf1a8e736c8837d165a00
>>>
>>> Check your concrete driver for its interrupt allocation.
>>
>> Thanks for the pointer, this patch is really helpful and almost exactly
>> what I'm looking for. I want to test the required changes of the driver
>> on Linux without Jailhouse first, before I'm going to test it in a
>> non-root cell.
>>
>> My device uses the standard 8250_pci driver. So I hooked in there, and
>> tried the following hack:
>>
>>
>> diff --git a/drivers/tty/serial/8250/8250_pci.c
>> b/drivers/tty/serial/8250/8250_pci.c
>> index bbe5cba21522..55f8144ef3e0 100644
>> --- a/drivers/tty/serial/8250/8250_pci.c
>> +++ b/drivers/tty/serial/8250/8250_pci.c
>> @@ -3640,10 +3640,20 @@ pciserial_init_ports(struct pci_dev *dev, const
>> struct pciserial_board *board)
>>         priv->dev = dev;
>>         priv->quirk = quirk;
>>
>> +       pci_set_master(dev);
>> +
>> +       rc = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
>> +       if (rc < 0) {
>> +               kfree(priv);
>> +               priv = ERR_PTR(rc);
>> +               goto err_deinit;
>> +       }
>> +
>>         memset(&uart, 0, sizeof(uart));
>>         uart.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
>>         uart.port.uartclk = board->base_baud * 16;
>> -       uart.port.irq = get_pci_irq(dev, board);
>> +       uart.port.irq = pci_irq_vector(dev, 0);
>>         uart.port.dev = &dev->dev;
>>
>>         for (i = 0; i < nr_ports; i++) {
>>
>>
>> Luckily, probing succeeds. For the device, lspci reports:
>>
>> 01:00.0 Serial controller: Device 1c00:3253 (rev 10) (prog-if 05 [16850])
>> [...]
>> 	Capabilities: [68] MSI: Enable+ Count=1/32 Maskable+ 64bit+
>> 		Address: 00000000fee00438  Data: 0000
>> 		Masking: ffffffff  Pending: 00000000
>>
>> Doesn't look bad so far. MSI is enabled and in use. And as soon as I
>> write to or read from the device (echo / cat), the MSI interrupt appears
>> in /proc/interrupts.
>>
>> But cat won't receive anything, and echo won't write anything. In fact,
>> echoing to the device stalls until I abort with ^C. In both cases, no
>> interrupts occur (according to /proc/interrupts).
>>
>> That would have been too easy.
> 
> Turns out it is that easy. Code above works perfect, but the serial
> card's MSI support seems to be broken. So I went for another PCIe serial
> card, and now it works fine.
> 
> Let me just advertise this product, in case someone else runs into the
> same issue. [1] comes with two serial lines -- one PCI function per
> line, which is pretty nice. Didn't try it yet, but it should be possible
> to assign ports to different cells. Yet, the kernel needs to be patched
> in order to enable MSI.

Would that patch target this particular card? Or a chipset that is different
from the one in the broken card? Then it might be worth pushing it upstream.

Jan

> 
>   Ralf
> 
> [1] https://www.amazon.de/gp/product/B0073LM0S4
> 
>>
>> Thanks
>>   Ralf
>>
>>>
>>> Jan
>>>
>>

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5ef2896d-0ee3-b93d-2049-4b6c3472cef0%40siemens.com.
