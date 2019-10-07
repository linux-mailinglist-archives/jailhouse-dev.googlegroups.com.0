Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB6WW5XWAKGQEHUWF2JQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F93CE990
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:44:43 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id c13sf1622476lfk.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:44:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570466682; cv=pass;
        d=google.com; s=arc-20160816;
        b=UjUaATtMcYgAdc1ICI0g+TRrs/PEri6GtzwUHYDaesyheLXUK3jS2WjZoocIXqtz6Z
         jQVc93JPVVDDiniCi9Lueq+6xv52VH+i94g9VtZtSsHne2dugN34vqS4dSgEfDZ9Q7pT
         Jkz8bR1xjwPOgqgEKx+8v7VLfisGg5MGPr2xc3shT1ErXkpRRZOjkxsOxhZvJ8SzdOsv
         mwhVKxK/m53gshRd0k2uT21QPZgqJaXSoYfJWWeFwybLppWQlmYjp09H4wHsMHy5GggU
         4OPQsjWkF+RZZ2nSa2w2GRtKu0dNqMuVPXdis4PexQllirOQ4+yhTd9jTzCI4+eHvoIZ
         6SLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=6cZg7sVZ6nuIgWdqCS8gkzukuyvonNJt/yjX2AjjKc4=;
        b=SjCCn8oq6Cg0HD8kEHJ6/63zJLSjPVqHSWBlciDmGoVRJSEb2K5/MH+eAGJnaBoIGT
         UiIG9WBm0QRzLyQMg9DTrwWLI72rARNskn/pXHVCYe7bJ/uu9IT+ocNsgl909KZ9hftQ
         Ptl/O5GJ+3V5HOkXq3d2i3k9sMQI+pbb1fMAt+jdXvFAWRzzEkKJohGf2MY9f5+3erT3
         CD49aQI86Y7i1x4j202VLVHAyM3sM8AZLSuJHqus1BUBgG5cITHTGB+E9Y+xhXoFCi2w
         Kw2iYGPx5A5H9s/wvKodJF0+VHN/TaIynWYUCPtcccyDIugzV4V5+RxugQ1A0kZE3Jiq
         BaGg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=W0z8xUom;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6cZg7sVZ6nuIgWdqCS8gkzukuyvonNJt/yjX2AjjKc4=;
        b=hk3i+DjkypbZ01GChVV5ot5KE3IoGR2yDrUPaoEkfpERthovJQS4KHMU+MWbQgNCn9
         wfvWzLKGd9BX+1Wp3NxFVVpu90wkq/Oinx4CYZmUJMldqbjkX8ioJmPozv5frykja2ft
         qleLFl99D/oSu3/npWIz0R0KQPLYuZoFetLOjdTUP+zUDtMJmUrsKUmMLTy60CMSc5BI
         ZQPFFoae0dnnCO2SWtmKH0e+ixvMIwTMHq5uYFaSiJVG4hDa0CwWF4Od0mLnesZfY3y8
         Z2SgHIaCX85XQFxgnyB82JkxctogU0XOL7zsc8zw4mvQTrHHAFP5fPzs5cKvZkulXdlw
         pgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6cZg7sVZ6nuIgWdqCS8gkzukuyvonNJt/yjX2AjjKc4=;
        b=uOzw6x1LOObAUn//eZeT6McnwnTEYzPBoYUdgV966cRPqs06xbWWzjzhPBgM66723q
         EH7qjNocJzy7Xz/xvBhGGGmzF7vc701uxCt5f9sdcRrBiZJVBn840Fxld5ryg4oojUtO
         jzr+EaPqDVHcTRtZRwVhqCW/5yTIyUlTxYXMUUym5ake1gY3AyvMfrGRMJkmmN4CD9Fb
         sJGlyVt7irCJ2I7SLhRvCjNxF7H5/Iaju8qWUdnlvgU5kjwLhsVwKvsTGCuq1P6WLIrL
         qLfHKrtwV2ppnq/JC3jti9g7ogdsm153xUk7g74H7WwYaRxHMt8K0nDMDiJ87RhOTrxK
         qokw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU1r7J3vJaadUQJLXl8gKfD/inrM2VcIfMhtFvZBTFGQ7xfu+8N
	WxfcpQgBCj3JgrWvYhs+G68=
X-Google-Smtp-Source: APXvYqxEwpC2ElgRdon/FzE/VzEG40+l6HijkMZmxfgG9Bh0E0EyPYIWAVjjd3mSfdhTD8IYNmudEw==
X-Received: by 2002:a05:651c:1032:: with SMTP id w18mr16641805ljm.256.1570466682774;
        Mon, 07 Oct 2019 09:44:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:42d1:: with SMTP id n17ls22529lfl.5.gmail; Mon, 07 Oct
 2019 09:44:42 -0700 (PDT)
X-Received: by 2002:ac2:4427:: with SMTP id w7mr17546526lfl.143.1570466682153;
        Mon, 07 Oct 2019 09:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570466682; cv=none;
        d=google.com; s=arc-20160816;
        b=KI7ErWgQsW8UykwR0l1X7QdUKn/DJtIdIFsH0wDcrYRWeWDFR7TTYa22CR43JhFK4H
         CCHYPzUzuBhm/+vwBv6QrP7oZ/1T4tBB1LGf8uIs5x/bUjsGQ94YVby0/WMdAtQvU96T
         lBTWv8VbZ4z70/kK6mPH1lF0oSVQgUylF3VpVv0Hw4iLER4teL5Q5jhp+RJI2xeAaN5q
         J8ji3vRBgXGh1d72ZZJYxaER9ENGypvGSdJnNH+VvCJEeyv9vLlv/YxEyGrZT0NPBIbt
         ZTRa3b2L7s3o6UyJbNFUGYCQVu2ugojTKfRzzFmqL4aEih3fnegqOo1HFIiF0yelgVT2
         sTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=LI14XXmY5N0/ZKqBuiM/47tXsF6+5WROUnMT6MIIpM4=;
        b=C33+QrYZkIKQxkz0a8tPuZu8hyjK38E3ChOhGuEVDnP0h9xPjUvNMxJWvVhAcvldBY
         2guvExrahNX808RvgWLdCEhvUArTSML+7CghYwIhQiwC/fmDcD4hBOHdJU8Y4zzE0KIT
         5lmmxxTl0LdHjn/gQdeO5eS6ln/ZdRhMFQW1XYTHGoM0+kcEWCQxs6s8a/tFz1MT6Qij
         rhg5dGulAvPhW7TPXS2+DDiPWIwi1ViKMkS4kiSowEy7WQ34Q9QODdE3VusTxNgjFt0B
         ZfumMsCbavYKvjtuVcpkBnZAcYLvrX9qwak6rO0Ccc63XBap3krB+rL++9T/12aFEUQb
         CPjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=W0z8xUom;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id d3si924028lfq.1.2019.10.07.09.44.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46n5tK0C7vzy7G;
	Mon,  7 Oct 2019 18:44:41 +0200 (CEST)
Received: from [IPv6:2a01:598:b900:3f4c:904e:cc61:5355:8726]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 7 Oct 2019
 18:44:40 +0200
Subject: Re: [PATCH v5 2/2] x86/jailhouse: Only enable platform UARTs if
 available
To: Borislav Petkov <bp@alien8.de>
CC: Jan Kiszka <jan.kiszka@siemens.com>, <x86@kernel.org>,
	<jailhouse-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>, Ingo Molnar
	<mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
 <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
 <20191007162636.GD24289@zn.tnic>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <85502467-d13b-084e-cdb8-d891178e97d8@oth-regensburg.de>
Date: Mon, 7 Oct 2019 18:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007162636.GD24289@zn.tnic>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=W0z8xUom;
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



On 10/7/19 6:26 PM, Borislav Petkov wrote:
> On Mon, Oct 07, 2019 at 02:38:19PM +0200, Ralf Ramsauer wrote:
>> ACPI tables aren't available if Linux runs as guest of the hypervisor
>> Jailhouse. This makes the 8250 driver probe for all platform UARTs as
>> it assumes that all platform are present in case of !ACPI. Jailhouse
> 
> I think you mean s/platform/UARTs/ here.
> 
>> will stop execution of Linux guest due to port access violation.
>>
>> So far, these access violations could be solved by tuning the
>> 8250.nr_uarts parameter but it has limitations: We can, e.g., only map
> 
> Another "We" you can get rid of.
> 
>> consecutive platform UARTs to Linux, and only in the sequence 0x3f8,
>> 0x2f8, 0x3e8, 0x2e8.
>>
>> Beginning from setup_data version 2, Jailhouse will place information of
>> available platform UARTs in setup_data. This allows for selective
>> activation of platform UARTs.
>>
>> This patch queries the setup_data version and activates only available
> 
> s/This patch queries/Query/
> 
>> UARTS. It comes with backward compatibility, and will still support
>> older setup_data versions. In this case, Linux falls back to the old
>> behaviour.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  arch/x86/include/uapi/asm/bootparam.h |  3 +
>>  arch/x86/kernel/jailhouse.c           | 83 +++++++++++++++++++++++----
>>  2 files changed, 74 insertions(+), 12 deletions(-)
> 
> ...
> 
>> @@ -138,6 +147,53 @@ static int __init jailhouse_pci_arch_init(void)
>>  	return 0;
>>  }
>>  
>> +#ifdef CONFIG_SERIAL_8250
>> +static bool jailhouse_uart_enabled(unsigned int uart_nr)
>> +{
>> +	return setup_data.v2.flags & BIT(uart_nr);
>> +}
>> +
>> +static void jailhouse_serial_fixup(int port, struct uart_port *up,
>> +				   u32 *capabilities)
>> +{
>> +	static const u16 pcuart_base[] = {0x3f8, 0x2f8, 0x3e8, 0x2e8};
>> +	unsigned int n;
>> +
>> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
>> +		if (pcuart_base[n] != up->iobase)
>> +			continue;
>> +
>> +		if (jailhouse_uart_enabled(n)) {
>> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
>> +				up->iobase);
>> +			jailhouse_setup_irq(up->irq);
>> +		} else {
>> +			/* Deactivate UART if access isn't allowed */
>> +			up->iobase = 0;
>> +		}
>> +		break;
>> +	}
>> +}
> 
> WARNING: vmlinux.o(.text+0x4fdb0): Section mismatch in reference from the function jailhouse_serial_fixup() to the variable .init.data:can_use_brk_pgt
> The function jailhouse_serial_fixup() references
> the variable __initdata can_use_brk_pgt.
> This is often because jailhouse_serial_fixup lacks a __initdata 
> annotation or the annotation of can_use_brk_pgt is wrong.
> 

Yep, jailhouse_serial_fixup can become __init, I didn't see that, but
you're right, thanks. I'm curious, how did you find that? "We" didn't
notice yet. :-)

BTW, we refers to the Jailhouse folks, but I will rewrite that.

Thanks
  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/85502467-d13b-084e-cdb8-d891178e97d8%40oth-regensburg.de.
