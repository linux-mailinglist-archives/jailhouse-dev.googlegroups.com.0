Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBKFFUHVQKGQEAVPIVIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D595AA29CB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 00:33:12 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id w193sf1055303lff.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 15:33:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567117992; cv=pass;
        d=google.com; s=arc-20160816;
        b=OW2zbrSTEwjMSj54W8oZV4rrBGxfaG6nok8c25P+oqlwxHlSq7XEPQAQLBJk9zyG91
         X653zGXyT1oZBS0jAfh+avTxl5guPOOUw4Mi7ToeNtmBtCGoFf6OsrBWoLsBc5Fw/riC
         prcbhtsmQlpx0kloaHlmxEnhSAoiY5GF+MRfuA2pCZCqKYTrQb0ySuFJ6n/aSd8Y22Zg
         cU9yNZyTQaokqtTMQZujtvpwPHj3xIajB2GZrr2S1QSlIi97DX/YDRThddN1EzdUMUY2
         2MU8wi6eC65eUSQc/LDHVL4XTJzXjRSbFJhwqwHp0uUhHyeAIVOmw9jC+r6ws6lN7ye0
         mxDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:cc:to:subject:sender:dkim-signature;
        bh=dW9aQF4E9Dp0B3GMhNWwseh2AUDAdLOniVnEs/9uoGc=;
        b=01T/ddGCHPMQpg3QdhIAACHeBG6RvOTaAx1i+hf1kjiNSWkOrDsfyH0W7/TIL22WUm
         jHJYmnNsuZs19HS9UYySBiV2pV6QcgqiHxv1e/SRmEot70+w9H81ttFbUCNKf7hqkoRz
         jTSrBa3ay9goEwR4d5YuPyoPB0J+9hNZpQJad53T/IDSQNM4J5vk+GeRxWSqlXSNIAE1
         AMj4QzkSrbb2Un3+Wo/6Q4CfOl7n/8+uWYVff2xVV7IziPQq0WPi1xsSnYBoAfegs4eq
         WCWsRZq/nzBuUcQLSZ6VbimvKZGMxL7blzc1J8ETtrKDLrsS9QKS8Ya2IwI2Z9bzaQ2c
         3+1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gifvJAL6;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dW9aQF4E9Dp0B3GMhNWwseh2AUDAdLOniVnEs/9uoGc=;
        b=I/3EfGX2XeGTOEh2O+uTMFmTXitkYDtSorNECIK/wrCuMB3fwtKwpoTJmnxc04eCN1
         14TOBsch1fVp7/57V1jPzQz0YSfyrdUZ1W4RV/+rSUa9a1C8V4mcCVQrwA2WNh/VoaYD
         udAEJJgXdqkSO2I0McjsRhYiYNu3p77teoHPM11CI2gMRVQHyhbOW5D5onyuPIqFgeKK
         tLLNiSNKaKc7DqVfZRk6YCyBUZfn8SVfrxYHhj4zvfAhjIZwJ9hyJ51/jlcemPwgOMiT
         5ixiOO51RTU4D/2rN5ET7ZU3hAFxlbomTb1k1eWfwNeyggKAHSonPedCkFaRL2ULlo4s
         oqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dW9aQF4E9Dp0B3GMhNWwseh2AUDAdLOniVnEs/9uoGc=;
        b=Xi5Nr1+9LgvDkyU/7e4R8LWGQ6hU+YSu/0jmCwWjKn6UKPXOIlCibWwbBmPPMXFsyR
         8Dp3H5Q4ICQXyWyRrCuLHF8kRLLDR7jEzzMQ41V/nxe/TMEgIka6o3IKSjNiKofYw5IT
         R1Mhpyj8/QaO26kd/NvB7lmRiXau2INcYj9zAMG9rpdBBHTm8FUEVAExTHUPaIDuf3M5
         QhdDt6MUt97ORBHsGBHHdUYUJzul367qOy1U+EAVN31bk38XNSebudsmBnvOAl0NAYY0
         xhzjjPXcy4C1fbHxY7U5z3f1rSZ9AUvQ1qjEY7oClZegURlwvpIL3t5Db6K0wBaqj0iN
         Znnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV1zqjZkTmV1RCHNSRChU9ob0YMrjWFBJlXIDxJEOzCG/dimO3l
	sjCEMquemMoIFWqsjRmpQYs=
X-Google-Smtp-Source: APXvYqz0f2FomfpBKUGhhjNaFk5t5EZJ/AKktOgFnLj+US5+I+Cy6jeF/1UJNm8MxHaUDcZhslAAGg==
X-Received: by 2002:a2e:9b02:: with SMTP id u2mr6761858lji.219.1567117992495;
        Thu, 29 Aug 2019 15:33:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:87d5:: with SMTP id v21ls492090ljj.5.gmail; Thu, 29 Aug
 2019 15:33:11 -0700 (PDT)
X-Received: by 2002:a2e:9ecb:: with SMTP id h11mr6854118ljk.6.1567117991602;
        Thu, 29 Aug 2019 15:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567117991; cv=none;
        d=google.com; s=arc-20160816;
        b=zwaTFKOdzlRk/bgRM3ivRNoh/a88CuewfXx/iSyBN9ijL9THbGPRAplU+BNhtTUlp/
         aGWqA7FvxCbthNtxKaaimG+F2YgwIjbalLOrsNYKrb7GS0LM0019UiZ2kXdtmiG1348e
         hc6DaVh2c3OBp8r5cHps62ffqiAEaBcNUU8Fl0nmT1P/biQPZJbWNPELfXNLy97bi3q1
         QEbyGJqfW0CnKt37MG+nIz1+h1NSFlnyOOK/TIhdoVB9R6b1RrluX0Of8RxsC4N0GUa4
         ZIbj4MzcpDBe9Ti3wF/GjIrLNsQ9+nXmDjbQFygAPve3XNl/4Ks8vPujB3DmfWI/pDT7
         0HSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=re3CHT5eR8aTHujCy74OHFomUsdAIlXuCx7nE+yjlGI=;
        b=qjWLFypkQH3YS2ukvY4CTKVQ19abE1H5mRJz6BTtWcDzOrWnkNeS98WysyVwdZefwr
         yptW3q4Qw0ODiic06xB22fdfyQZXaPOdsibRim6jM9dXN9Cyug+GleWx0SMkjDSS49Xv
         iDWgfcUTy4KNSKB4soaXcln10+B2WpCFgL9neTr/UziuFTUzueS89plJCh91IzyTrmBw
         XhnGLIqvq3mdTXZg9uBhtmSqSMWFShWNjXi0TFWbLLC0XF4DNEhgvdi6nTkI2CjfOerY
         +c0BZ6JAgxtw7OiNc/E/COspC3CXJrzQfCZt1xvjtXUKwxSZQVnBAjk1rXrrB2+x8RFE
         wQCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gifvJAL6;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id c12si301523lji.0.2019.08.29.15.33.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 15:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46KHSQ3n2szyBC;
	Fri, 30 Aug 2019 00:33:10 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 30 Aug
 2019 00:33:10 +0200
Subject: Re: [PATCH] serial: 8250_pci: Implement MSI(-X) support
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
	<linux-serial@vger.kernel.org>, <jailhouse-dev@googlegroups.com>
CC: Jay Dolan <jay.dolan@accesio.com>
References: <20190812112152.693622-1-ralf.ramsauer@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <740fc1e7-fb3d-c0c7-c17b-2ea3a8864d89@oth-regensburg.de>
Date: Fri, 30 Aug 2019 00:33:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812112152.693622-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gifvJAL6;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

*ping* :)

On 8/12/19 1:21 PM, Ralf Ramsauer wrote:
> There may be setups, where legacy interrupts are not available. This is
> the caese, e.g., when Linux runs as guest (aka. non-root cell) of the
> partitioning hypervisor Jailhouse. There, only MSI(-X) interrupts are
> available for guests.
> 
> But the 8250_pci driver currently only supports legacy ints. So let's
> enable MSI(-X) interrupts.
> 
> Nevertheless, this needs to handled with care: while many 8250 devices
> actually claim to support MSI(-X) interrupts it should not be enabled be
> default. I had at least one device in my hands with broken MSI
> implementation.
> 
> So better introduce a whitelist with devices that are known to support
> MSI(-X) interrupts. I tested all devices mentioned in the patch.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  drivers/tty/serial/8250/8250_pci.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/8250/8250_pci.c
> index bbe5cba21522..97992884c0ee 100644
> --- a/drivers/tty/serial/8250/8250_pci.c
> +++ b/drivers/tty/serial/8250/8250_pci.c
> @@ -53,6 +53,16 @@ struct serial_private {
>  	int			line[0];
>  };
>  
> +static const struct pci_device_id pci_use_msi[] = {
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_NETMOS, PCI_DEVICE_ID_NETMOS_9900,
> +			 0xA000, 0x1000) },
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_NETMOS, PCI_DEVICE_ID_NETMOS_9912,
> +			 0xA000, 0x1000) },
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_NETMOS, PCI_DEVICE_ID_NETMOS_9922,
> +			 0xA000, 0x1000) },
> +	{ }
> +};
> +
>  static int pci_default_setup(struct serial_private*,
>  	  const struct pciserial_board*, struct uart_8250_port *, int);
>  
> @@ -3643,7 +3653,22 @@ pciserial_init_ports(struct pci_dev *dev, const struct pciserial_board *board)
>  	memset(&uart, 0, sizeof(uart));
>  	uart.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
>  	uart.port.uartclk = board->base_baud * 16;
> -	uart.port.irq = get_pci_irq(dev, board);
> +
> +	if (pci_match_id(pci_use_msi, dev)) {
> +		dev_dbg(&dev->dev, "Using MSI(-X) interrupts\n");
> +		pci_set_master(dev);
> +		rc = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
> +	} else {
> +		dev_dbg(&dev->dev, "Using legacy interrupts\n");
> +		rc = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_LEGACY);
> +	}
> +	if (rc < 0) {
> +		kfree(priv);
> +		priv = ERR_PTR(rc);
> +		goto err_deinit;
> +	}
> +
> +	uart.port.irq = pci_irq_vector(dev, 0);
>  	uart.port.dev = &dev->dev;
>  
>  	for (i = 0; i < nr_ports; i++) {
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/740fc1e7-fb3d-c0c7-c17b-2ea3a8864d89%40oth-regensburg.de.
