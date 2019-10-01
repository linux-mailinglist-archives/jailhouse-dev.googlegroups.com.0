Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXBZXWAKGQE3P3BPGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id C8161C38F9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Oct 2019 17:28:58 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id c7sf2776492lfh.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Oct 2019 08:28:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569943738; cv=pass;
        d=google.com; s=arc-20160816;
        b=RW2DJqmigEYk/mDcax6OczHAGG5tP2IFr482JpcJU15milx+Q6iasr8gJrwRbWYo2g
         tr5jQ9HAM+zhAwRhX7yMM4fMGBXIifv/NeT8btbBlo4vmaIsWYYYSHWtmTiB1I0g+O2q
         nafo7PHxQh8MwBY0VmeVTArf9OMlQ2qm/yaMEpK9WmwNzTaQTKLAjPZbSP9aaYFZhyHn
         jlFY71pJB+rWuwpTxpzVd2ZcUCmFzj3S/CQ2/IO68VIanYZagPZAH95CY569ScCmPkVA
         yR2+O8Pxz2+2KI2wKKhfieITqKUTqcrf2d03suDQC9Jd7FT3qWcOSfVMJbS5MH/KEJYA
         w8tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=mhUchi+aGqnnekjkJOAUiyGGQpPRKU/Of5HWKBj8y1I=;
        b=wsKJcrdxW832jnxuLUkfjWjXiC5DdGu551CvJ+k/JQS9p7AKPmUVrNSCN8ufGTmVx3
         2egGY2DVhYrHXVtZeRBCpQuvZHPw+E09/1ozmOIAbCbA0DoEo7W63ERBAFIePUAkwz9g
         5bAy48rdJ2jTlAUQdBJWotxPHKbEOLjKkTmPSPJq8eTJASQf+Xaqhp/rNXdBa2UU63sV
         xQ4+hh3/bx/pMNyDjrGEdIiJkWYBoUg2dnxoJzWL/oQbynPbX8CQarLWjzLqE49CycI3
         P+oeZkjqKziK1kAErr/TgHW19A9ZJ8BG7p+dsKtb627gn0HSTQZSEW3Gyk6Hb8aXLi6o
         Qk2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mhUchi+aGqnnekjkJOAUiyGGQpPRKU/Of5HWKBj8y1I=;
        b=VwxZ6mI761bYnSMzs+ID/u23eln/PaPUTzvwKAf+syujVqaV4xGLioRfMaAMxBYRzl
         ml3tnCIcRKIt8PYwrP/rR8EzhMA9Gr0J21PNzeBzDvzq5qxbxckfR8m5REvj5ta3hHbB
         lPInn35m+fdH75lPYdQpejTFjF5tWlk3tbEDox/GTSqRcHjb9q7sTRXrsFOqS7k+3qf9
         4CUowSxO4MlLyEDO1CA8l0UDx/YWA6riT8FBIojShf9vB111D90Sru60SAlE8jQzAw59
         cb2rX7Ahz5JTrhr5lZKPlruXS6OEiZQjYGGz30LaBXfP/9x4MzQNuU+YF+ZrjtmC3fuZ
         nGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mhUchi+aGqnnekjkJOAUiyGGQpPRKU/Of5HWKBj8y1I=;
        b=HJxQeJJ6vbEGpu60LrNVzcMA5bAUMBfGyKw9KTNi9kh98qkb+omH/PNXOsAfkfaEgF
         J0IP76I7JnyyVDGbNsh63JRTmMfTHrDsbL9yOenG94XwG9Coy+VWAxaqewave/v9Hzkh
         lQ9OqGCXm0OwGWSS5bB25Fg0ueL8Ctjx/35PWfFJCbj5G8ZLRvZ1xcuXWPQ+qml9YgFz
         UYKODU+882EWX8S8Vik3xAfz9IeppLpxXeSCZPjakHXFteZeZWs20h0djhSD8yPA7j6W
         gVhUGBBn5jJMRTrSq7KYT+TQ+S+lMyjAYnP++GdQ4nBgI2hD50Tjv1+VhOK8VIozF42e
         h5mw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXgWxaXBlkVb0V64Htboz/YpNIzuJ0wFm772TK8sZJNZAQlPyc9
	3pRIMmb0YBRB3zNxpTxM6lw=
X-Google-Smtp-Source: APXvYqxOFha5zfMLaSoQfOmGKv643XfJ0aBJkjETy5cyTbDPWKqAWO5KtpXsQ5qxGZwc+aYXhTS0Eg==
X-Received: by 2002:ac2:491a:: with SMTP id n26mr15745931lfi.182.1569943738395;
        Tue, 01 Oct 2019 08:28:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:f613:: with SMTP id x19ls1559637lfe.16.gmail; Tue, 01
 Oct 2019 08:28:53 -0700 (PDT)
X-Received: by 2002:a19:2c1:: with SMTP id 184mr15342354lfc.100.1569943733425;
        Tue, 01 Oct 2019 08:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569943733; cv=none;
        d=google.com; s=arc-20160816;
        b=y9+hNiX8qwlw3e0JECl+T25q+TN5eqMjM3FCBoDj04mxyfxyjB9STO1yr+CKHWHKlm
         jgivrplbyKf8KGOmrvSxBYtWR83CNMqOFLoyzYXZfywobFCB1DKXIDtkNrPMDKeVyY7k
         jNNPdBbVDwt4EhUYbgjK0i6U0aba+4DEvZ4QNGrS8Qb+HjRHSDb6kitdNm8c4CuOtl9y
         1efy3o6yXmtpZ295r6dymWcFk7eb0R2x+rr3HPwOKQljMJ5JbgOX7devIBeI0gvyBa4K
         U7CHIgJ8GQNZRLvr2+Y4jps2ucQQdieeZhufDr/V4E5gJesiLspdsewUltzsIn9fkE06
         24cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=HjS3Kyzr2KIN2PI3xvJVF2HsrfvzY4DVfFsHBomUSR0=;
        b=cJeofLYmP8vwyI1BHYbxqrViu7Lx/GGhMyzYje+WmYNpTwXf+eLgBOlcC5FtGwx2zJ
         l1GcXNFwS0ggBmj/lA3Vw1g+GzIDI3o/fowlXmy4c3f0Y7A699KPq11IcCzOjF8o25OU
         Yedn/lrELQsXdlvNLDOhXeATZ+ljswnhnGGT6lURioBf8Pimykd9dtaez/S3IAhoRNYg
         vm1q+JttrPkz+1SfeZlw4gPrewYk0LWAkwjfFNTIhTmf0/xH+gu6DNSQJGn0iTmXzPHt
         1fosCYUiELz0tljmsm7OwH7+K8AFlGoNFxhrzNUyhQFUC3327vVvh0BrOxQjnkrqU0he
         1uwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id k24si1145945lji.3.2019.10.01.08.28.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:28:48 -0700 (PDT)
Received-SPF: temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x91FSlbb026925
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2019 17:28:47 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x91FSl9Q006889;
	Tue, 1 Oct 2019 17:28:47 +0200
Subject: Re: [PATCH] configs: Fix qemu-x86 /wrt VGA access window
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <180104b9-95a8-3c54-211b-65d18da70d49@siemens.com>
 <9b69ab87-55e4-99ef-7138-6e0d2a2d35f0@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2b2842a9-bda0-3fc5-e390-d05e1730b591@siemens.com>
Date: Tue, 1 Oct 2019 17:28:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9b69ab87-55e4-99ef-7138-6e0d2a2d35f0@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=temperror
 (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS
 error) smtp.mailfrom=jan.kiszka@siemens.com
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

On 01.10.19 17:09, Ralf Ramsauer wrote:
> 
> On 9/19/19 4:11 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Copy&paste mistake, other target were correctly set to a size of 0x30.
>>
>> Fixes: 654594bc0be7 ("x86: pio: use a whitelist instead of a permission bitmap")
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   configs/x86/qemu-x86.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>> index f9877a21..03768f12 100644
>> --- a/configs/x86/qemu-x86.c
>> +++ b/configs/x86/qemu-x86.c
>> @@ -205,7 +205,7 @@ struct {
>>   		PIO_RANGE(0x70, 0x2), /* rtc */
>>   		PIO_RANGE(0x1ce, 0x3), /* vbe */
>>   		PIO_RANGE(0x2f8, 0x8), /* serial2 */
>> -		PIO_RANGE(0x3b0, 0x8), /* VGA */
>> +		PIO_RANGE(0x3b0, 0x30), /* VGA */
> 
> /proc/ioports of Qemu 4.1.0 reports that vga is from 0x3c0-0x3df. Is
> that correct or do we really need 3b0-3df?
> 

The "hardware" provides this:

(qemu) info mtree
...
address-space: I/O
   0000000000000000-000000000000ffff (prio 0, i/o): io
     ...
     00000000000003b4-00000000000003b5 (prio 0, i/o): vga
     00000000000003ba-00000000000003ba (prio 0, i/o): vga
     00000000000003c0-00000000000003cf (prio 0, i/o): vga
     00000000000003d4-00000000000003d5 (prio 0, i/o): vga
     00000000000003da-00000000000003da (prio 0, i/o): vga

The 0x3bx range is for text console IIRC. So, yes, we can further refine but 
should not exclude that part.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2b2842a9-bda0-3fc5-e390-d05e1730b591%40siemens.com.
