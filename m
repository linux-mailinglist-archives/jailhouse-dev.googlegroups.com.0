Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAGV3PUQKGQEPG6C52Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id A39A9716B7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 13:07:45 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id f24sf4074471lfk.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 04:07:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563880065; cv=pass;
        d=google.com; s=arc-20160816;
        b=0LQXIhv+GYiHiBGFosI1O7kHOqbC+xUd6LQn5LlecdLpbEQofb2cW0WVOFDry5dAyE
         vzp03p4VRZEmbVSuMi+HC+HRzveMTikOGTknagkBCxi0zm1bqsIa1VojNceRmTitaKo7
         1+KS4OgyrVqo2cAHlwEoXpN1VeqrQipMrRXcsIpOdehdvp92TlKQpSHrHnfTKEd5+BXW
         C+iE1gS0d5zIpSbiEgACyBH6/Y5GNKD6J9QkuCJ3ajgWHFsLS6zFJr+kykpFw405Rio2
         GximeZepBGn7LF5ytIqkXSkxosJpikT5nHU3t2V85z/dTbmHd4/2xuBmxq4AxMzFhEgR
         aFfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=LuLMAutFopP+0Zh96oEfOVF1eLL1zzPh3SQk37Qsw9c=;
        b=g3vgNJDm0gpiD6+IybQjg1Sv79XGY+lpehWQkYy3CW/cBEYfuH1/hjjgh15QBoFV63
         Z8mySGdVhCQo1KmwyrB9r1A7bwwwKk05o2rrh1z9zGN1+aI3JGuiIfGNr287jsiZgBg/
         P6T/NFYp/2/kdj2v3j+HqFjGwdqZdsvVPL8pPNY4qrc6LyIefR8lnkGQ19Bp8IwfPeSV
         e8gEY7gZ3yaszzFTdQ3p9D0fZkgSxsDv81yZealzEVpyTYGkF/z0ej6kBhCTaORwJNjn
         yFVXlbuQxS7if4ALN1EZ+2RkrBdMjm275AH/1D5hGVbFkDHA63kZqLM1OxDJi1GcPJaz
         tFnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="nHS0+QX/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LuLMAutFopP+0Zh96oEfOVF1eLL1zzPh3SQk37Qsw9c=;
        b=Gfi/ygVH+RuypyksjtO9aT5acgBeG38RVOQa7/LAV4OvKG+6PCn0/yIk0gOrRnzNG2
         fAYweTmsdcOhejbEj8I/wh7zDwbOD88rmy0Uthatukz82JipNR6VKcfECA2g/llG8NFd
         ROb3ccqTi6sYEVx6bcfPqPbkquEKpK/kopvrgf75aTcpbKk6t1ZQKY9JqKalN9oQioFg
         U4/4mrCAi79hI7ywXVUELJv+GTXSCPo3aBCTIXr9Qj7038zZxfitf3CMT5EuDB9bp2x9
         ReOog9XCi+qsUIVEMxsLXWXN7NQAdzdrtsQFIYgFZ05ibfRh3EUPuacOJp23JHnNGsMT
         AeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LuLMAutFopP+0Zh96oEfOVF1eLL1zzPh3SQk37Qsw9c=;
        b=JxsH0iMfyNSK3ebFEC+fLXtivUcY1uoOuBboeHskqwbLKJ8eXLXgd+4POhZjSzYXbQ
         8JIO2VVbMqiX6f4pJHEIFdl2QwdGgaDKcTnfLYigFTaByHMoni9+/bCrQ1KzMZuRHjr3
         hVVRKGsVEhtc+tz+r6kWWBzojuHDxyuBo2qu7JcvtUzyLXSaAKZWqByAMVNQJxX5ujCN
         xAq2eukWYqJQpHkwgoChNQHKaNhfDqFoiK9fNPKW8VrDbXhMNpQD/ybh8wlTfpe3M4ba
         mxtbz3kKILbCX0BMQSum6F//6jd5gi/xApBp1V9FAZkpIl1D3Jg/6Q9j88pcCfIrNLdB
         ND1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUXrcCmFZ1pKPegLIyOtCmJ+PhRxw69dduTkTOwSbDeOd1LZ2+3
	qG+/a4eIUH9vOx7rpxvrOv4=
X-Google-Smtp-Source: APXvYqxNV8OOwai2yO6IXXG2nsPKQV5fZnodIJutyvugR5cyjq4ojFD4hsROzTb/sIaAThRSRSBHaQ==
X-Received: by 2002:a19:ca4b:: with SMTP id h11mr33039343lfj.162.1563880065224;
        Tue, 23 Jul 2019 04:07:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8917:: with SMTP id d23ls4819014lji.14.gmail; Tue, 23
 Jul 2019 04:07:44 -0700 (PDT)
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr21885468ljs.54.1563880064630;
        Tue, 23 Jul 2019 04:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563880064; cv=none;
        d=google.com; s=arc-20160816;
        b=lOBTscd/WlnVxsZY9vuq/u4AJ8vKLesJwem+XIBGEy3TDw2xO73qB2SpgpdnITq8Pk
         8/w2EXWvOLpGujmgM3KIt0jjldoIFkox5Q36TaZaY+4xbUSuamqaRn3rdS0ElOCGKxAz
         QKsRTRRzWs3vgtg+GfC7GyyMfz7YDsTmA9/PqI3uBpU5MYVsDiGLie2S8us2GBdW193x
         Iix3eQtp65DyYe7sDj2ZS0Y7aqvZ+GlwciUewSZcu9K2Mj0E0iuCDZVh/VpfvdVLGOqO
         qkF4IPF7sr28QdvRIXgJFCH/bWO7XMHcHFUSKzFtf6L/dh/EH1rHuk3UEIW1WOeU5kHL
         FI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=283iT3DWcvYDG5Ck058uOtxrC/QUgPPPQ/AWdfYQyQU=;
        b=ZREiUzmn+xfzLy+c0Jm6EJkXz9XgCino+7mxldRVPUJAUkIznQ/TO35rPFIZLwOIFl
         IWZCWxJMrgrQIR1qjch1SYFs680zAMTp1xXZfXrEb390G6Rt8vX0sE1w3cUQRmOUU/Uj
         1lUyg0VCxpvLXqvdDkIKgAoPhyd316+5MbqVKh2inydxk9FmugMsCUAZf992V+SXRVRo
         R5i4CMpkKi56wQWvxypFuZWkZ7DeNlr0k76ft4+kEioSE3Tb1ry8yWSdvNEVtwnRfjQL
         yu/fvxCpowWH6H8P3g+zK5BtqwMYvTh3pERq3Xrew/2CLSL6yRFNALOlsdTu+91XQJHi
         hRow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="nHS0+QX/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id h11si2296454lja.0.2019.07.23.04.07.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 04:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45tG0b680Dzxys;
	Tue, 23 Jul 2019 13:07:43 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 23 Jul
 2019 13:07:43 +0200
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
 <cea81495-4bee-2f8d-a0f9-a1c7b57027ec@oth-regensburg.de>
 <5ef2896d-0ee3-b93d-2049-4b6c3472cef0@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <ce2fa8f3-1bc4-60ad-18fa-331fb87d5789@oth-regensburg.de>
Date: Tue, 23 Jul 2019 13:07:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5ef2896d-0ee3-b93d-2049-4b6c3472cef0@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="nHS0+QX/";
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



On 7/23/19 12:21 PM, Jan Kiszka wrote:
> On 23.07.19 12:16, Ralf Ramsauer wrote:
>>
>>
>> On 7/11/19 1:07 AM, Ralf Ramsauer wrote:
>>> On 7/10/19 7:22 PM, Jan Kiszka wrote:
>>>> On 10.07.19 18:28, Ralf Ramsauer wrote:
>>>>>
>>>>> On 7/10/19 6:13 PM, Jan Kiszka wrote:
>>>>>>> Ok, there's one chance left: According to lspci, the device actually
>>>>>>> supports MSI. It's just not being used by Linux. Maybe I can somehow
>>>>>>> convince Linux to switch to MSI.
>>>>>> Latest kernel already?
>>>
>>> Latest kernel doesn't change anything.
>>>
>>>>>>
>>>>>
>>>>> I'm using the 4.19-rt jailhouse. Do you know of any relevant changes
>>>>> upstream? Anyway, it's worth a try, let me test upstream...
>>>>>
>>>>> At least for 4.19, it looks like I'm not able to easily switch to MSI.
>>>>> At the moment, I don't even understand why the kernel actually uses
>>>>> legacy interrupts, while MSI cap is present. Something is odd there, I'd
>>>>> expect that MSI is, if available, the perefered method. But even the
>>>>> root-cell after boot won't enable MSI. Still investigating...
>>>>>
>>>>> I hope that I can switch to MSI with maybe a dirty hack, but I need more
>>>>> time to dig through the kernel's PCI stack (PCI starts bugging me). You
>>>>> can find things there you never wanted to know! :-)
>>>>
>>>> I suspect you are using some 8250 derivative with a similar driver:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=172c33cb61da0df5ccbdf1a8e736c8837d165a00
>>>>
>>>> Check your concrete driver for its interrupt allocation.
>>>
>>> Thanks for the pointer, this patch is really helpful and almost exactly
>>> what I'm looking for. I want to test the required changes of the driver
>>> on Linux without Jailhouse first, before I'm going to test it in a
>>> non-root cell.
>>>
>>> My device uses the standard 8250_pci driver. So I hooked in there, and
>>> tried the following hack:
>>>
>>>
>>> diff --git a/drivers/tty/serial/8250/8250_pci.c
>>> b/drivers/tty/serial/8250/8250_pci.c
>>> index bbe5cba21522..55f8144ef3e0 100644
>>> --- a/drivers/tty/serial/8250/8250_pci.c
>>> +++ b/drivers/tty/serial/8250/8250_pci.c
>>> @@ -3640,10 +3640,20 @@ pciserial_init_ports(struct pci_dev *dev, const
>>> struct pciserial_board *board)
>>>         priv->dev = dev;
>>>         priv->quirk = quirk;
>>>
>>> +       pci_set_master(dev);
>>> +
>>> +       rc = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
>>> +       if (rc < 0) {
>>> +               kfree(priv);
>>> +               priv = ERR_PTR(rc);
>>> +               goto err_deinit;
>>> +       }
>>> +
>>>         memset(&uart, 0, sizeof(uart));
>>>         uart.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
>>>         uart.port.uartclk = board->base_baud * 16;
>>> -       uart.port.irq = get_pci_irq(dev, board);
>>> +       uart.port.irq = pci_irq_vector(dev, 0);
>>>         uart.port.dev = &dev->dev;
>>>
>>>         for (i = 0; i < nr_ports; i++) {
>>>
>>>
>>> Luckily, probing succeeds. For the device, lspci reports:
>>>
>>> 01:00.0 Serial controller: Device 1c00:3253 (rev 10) (prog-if 05 [16850])
>>> [...]
>>> 	Capabilities: [68] MSI: Enable+ Count=1/32 Maskable+ 64bit+
>>> 		Address: 00000000fee00438  Data: 0000
>>> 		Masking: ffffffff  Pending: 00000000
>>>
>>> Doesn't look bad so far. MSI is enabled and in use. And as soon as I
>>> write to or read from the device (echo / cat), the MSI interrupt appears
>>> in /proc/interrupts.
>>>
>>> But cat won't receive anything, and echo won't write anything. In fact,
>>> echoing to the device stalls until I abort with ^C. In both cases, no
>>> interrupts occur (according to /proc/interrupts).
>>>
>>> That would have been too easy.
>>
>> Turns out it is that easy. Code above works perfect, but the serial
>> card's MSI support seems to be broken. So I went for another PCIe serial
>> card, and now it works fine.
>>
>> Let me just advertise this product, in case someone else runs into the
>> same issue. [1] comes with two serial lines -- one PCI function per
>> line, which is pretty nice. Didn't try it yet, but it should be possible
>> to assign ports to different cells. Yet, the kernel needs to be patched
>> in order to enable MSI.
> 
> Would that patch target this particular card? Or a chipset that is different
> from the one in the broken card? Then it might be worth pushing it upstream.

Yeah, I thought of this. Would definitely be valuable. I would have to
patch 8250_pci.c. It would require a whitelist, as it's not a good idea
to enable MSI for any card. There's at least one card where MSI won't
work. Hmm.  I'll try to find some time for that...

  Ralf

> 
> Jan
> 
>>
>>   Ralf
>>
>> [1] https://www.amazon.de/gp/product/B0073LM0S4
>>
>>>
>>> Thanks
>>>   Ralf
>>>
>>>>
>>>> Jan
>>>>
>>>
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ce2fa8f3-1bc4-60ad-18fa-331fb87d5789%40oth-regensburg.de.
