Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBRMV63TQKGQE7LRRHKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9D03AC78
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 00:40:06 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id a1sf1436477lfi.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2019 15:40:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560120005; cv=pass;
        d=google.com; s=arc-20160816;
        b=A+bjQMr0eeg58AHCIYD9EW9ClBvV+YFQWHobNZfOW9znj4tFFffY1lYS1O8DOSSWYz
         1Jli/NpvtaRjiNmafa/lXbqdWMXnb6MVm0tVos2aisQl6bXX2yUZDEwbsxVsmVuP3xdy
         K3pqqBOevE0a9cQMcXs3sO7m0BEvEMwZXY3UwQxYFzcYZ0iWbSGh7glxzF0HSfAVTVmW
         Ovp4XTqTkeS6py0pcKVBpCcdzZE7EG1iGqeiMqEfkWuuquU43B5QOw/N0zqGc9lrhQG5
         mLG4nHSLv8EebP0YhhgEOTdYgngtVKoltEPlwkQgcl/n7icF8GhsjKzeUrcI9eRa49x2
         /Igg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=/fnThG1T9J/xwYYfESyWWIJ2hdF2eDKnecxb8h/wDJE=;
        b=SY/nslLNC/ZLZPRazW3Ng6etiTISb9f11nq3L7S260QPED4A1ItmZZtpygV0L5jscX
         kINuX5QjLj9hktHOYpjY5kbgePC/4d07yhUB1ZBo9LIMCQrV/KT28pZXGE1S7oC1R5tp
         cO7x54n+re4ySYiqSONIQm7D6BDG2c3YQzIOydw73DDXmuMJWR3+mnllOVWRsdAaeHeV
         TCouIT2dCW3C2RaEfvmZE3wl3nA6F/qQDG50xqvVlCJpqRzwizMvW3ywnij1RmmwXCGM
         gwWiimLQbiShmhNPthdCmqvDoyHzRoqUNV4l4kIJh7nHDVScjUdLu/F9FPMc3h0k2PTQ
         MJfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PN2xHssS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/fnThG1T9J/xwYYfESyWWIJ2hdF2eDKnecxb8h/wDJE=;
        b=H6qz50So5TrxCR5kQpa5DjyVzfmm0jWugvxK25iqWV/ErFEFrz8DxZkSqMzft0010O
         uzs5CppZDWMaRWxC4eyN8Jk/T2iYPIH7wr/duPV27Ntua2CNPJD+/BfRPBBQ2ypetfW9
         3ckOckPV1sTM86DkjPwDWAmnxHnyIiC8lDvlfWrR0tBDaVe1jRxXbbAqt7nl5zDtPATw
         1AJRkYAr2gSUqVwAG+1WL9QKsnbnRaZoboEucaidT7Kgeka4D6Rwo8kL7cQ+DrT8xOsQ
         TfKQTayfHLgiamRt4XrPsELdEQJzF/UauEtOW0TvZ0OrKXzPeXt3Z5gtimnrxujR4ksp
         uJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/fnThG1T9J/xwYYfESyWWIJ2hdF2eDKnecxb8h/wDJE=;
        b=X6jDsWuQyXYRq5rn38T7UGfqNB1VSDBSsKVcDd6Qb4hwADPOKF49yEhO4+d5QUcXM4
         MsZ26s6/Ot9cMuDQDOrIonwE4PkfRCH7xBu8TFXaEGCgDHxQ68V/+jVMm+pWkJG71YWt
         Q26o2uYO6fT+oGv/h7xH32BN8AZubYppybNGYSI/rqVc2CzSHS4SoebtWvNUcvChQk7U
         vKMGWdxOKS5BzAm+drJEDOlAzt89ilEW7oO7rEcX0APvwKPoFIP7A6sJeyMUHA/qsQML
         P21GtaMe4/dHvNbaKbH7NCmAjCt8nrbo7jl755Ha3exUVMl9nM3BMA6GI4uilUCO6e2J
         LY4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWrq+YLBqxShgwmhq5Fyak21z/O+j7pwvhEr9DsQVwEWEJ/h+gD
	kdBNVfI7OFKpHVpHekon1VQ=
X-Google-Smtp-Source: APXvYqzdjQzpte5T0Fc/BS3+2bFhPkYQcAp5QIaIIV0hARFAx8b93ABk1FIHbWWpMlQ5YOV/gdXnuA==
X-Received: by 2002:a2e:9950:: with SMTP id r16mr634992ljj.173.1560120005626;
        Sun, 09 Jun 2019 15:40:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:2d4e:: with SMTP id t14ls1207423lft.7.gmail; Sun, 09 Jun
 2019 15:40:05 -0700 (PDT)
X-Received: by 2002:ac2:5595:: with SMTP id v21mr17813458lfg.54.1560120005094;
        Sun, 09 Jun 2019 15:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560120005; cv=none;
        d=google.com; s=arc-20160816;
        b=nfasw6xNQyOZKk232mbB0mNHqOYvoPC/sPp4O+p2f32braJ1JeI3NtjzhkH8rE/pJ1
         vPdQjAtt5VmwlHg59yNNNIomJjd4GV4xuatsVcaIlsC3tLTBN6KLFFvRdIdY4FQ5OqiW
         OqsGidEkj8OBOVtw6FWjTK4hGAagw0ol7dKIOmAIBPez3P30T/46CNDQvY6JlfPbMd9E
         PL0i9uIbLgSCznZ1Pgz7EGk3iLVAAg0P3QwkHtCL9pPD82Vy4slsAJFjMQr8sHvn5cSe
         bTdjfhA+6HwZuA99/anfPB5TQtYIV6HTqK24UAmDTenVrt6DqoIPACbsrcopwcefRdCN
         WHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=4NeCP9OJfLfYXNWIdGXIPtekpuRQVomFhr1bKvAjtKI=;
        b=WYA6lIMuFI72cWJ65pc2E5JtKbQZ8VOt84UoiVEOB8OXsJ7yIjp/xN4pEPa8TJJRSJ
         jrFS5xivUzQv6MwtY/98jbY3ph6tspTfbulBHxsvJgw05UsHafLvtkbs/FR8UoMR0eE/
         teCEKVB7m11txWECobiad1eGkF4eMffk97N9tO6E8BLYERmxdx0+9ISwt2T+xh1yDgFo
         rSdkbr3SVntmFWEWmOqVc0HZxUOYEjDxOJJvFZWxKvWlu6Dc1KVgMf/IeODQi5Iw5eGM
         TzcHgkPB1g2gvDWRPvCYLcyVVKocUVVHA4DZCyplAQMRjrPvdK8o//KEaCAc3OOOqN0v
         1Aow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PN2xHssS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id a20si483802ljb.3.2019.06.09.15.40.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 15:40:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45MWRl707NzyBj;
	Mon, 10 Jun 2019 00:40:03 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 10 Jun
 2019 00:40:03 +0200
Subject: Re: [PATCH] arm: Account for non-compliant PSCI_VERSION return codes
To: Jan Kiszka <jan.kiszka@web.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <a9ac4f9f-8c5c-6133-b9df-77cf2a8ccc31@web.de>
 <4a7ef1a0-b21c-b224-7768-2b0929349bec@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <b76f46a9-afd3-216d-55fc-026651ad9bd7@oth-regensburg.de>
Date: Mon, 10 Jun 2019 00:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4a7ef1a0-b21c-b224-7768-2b0929349bec@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PN2xHssS;
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

On 6/10/19 12:07 AM, Ralf Ramsauer wrote:
> 
> 
> On 6/9/19 8:58 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> U-Boot returns PSCI_NOT_SUPPORTED, rather than the implemented 0.2.
>> Filter out all negative return codes.
> 
> Oh. We should fix this as bootloaders are out there that do not stick to
> the specification. Nevertheless, should this be reported to u-boot?
> 
> I remember that I definitely tested the series on a TK1, nothing
> exploded there back then. So at least the TK1 seems to behave differently.

Oh wait -- the TK1 in deed returns -1 for the version call, but the next
call will fail. This is why it didn't break there.

  Ralf

> 
> Anyway, tested this on a TX1 w/ and w/o firmware mitigations, as well as
> on a TK1. All configurations seem to work fine.
> 
>>
>> Fixes: ea924a3fec98 ("arm64: Initialise SMCCC backend")
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Tested-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
>   Ralf
> 
>> ---
>>  hypervisor/arch/arm-common/smccc.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
>> index 5affa965..7734b999 100644
>> --- a/hypervisor/arch/arm-common/smccc.c
>> +++ b/hypervisor/arch/arm-common/smccc.c
>> @@ -23,8 +23,9 @@ void smccc_discover(void)
>>
>>  	ret = smc(PSCI_0_2_FN_VERSION);
>>
>> -	/* We need >=PSCIv1.0 for SMCCC */
>> -	if (PSCI_VERSION_MAJOR(ret) < 1)
>> +	/* We need >=PSCIv1.0 for SMCCC. Against the spec, U-Boot may also
>> +	 * return a negative error code. */
>> +	if (ret < 0 || PSCI_VERSION_MAJOR(ret) < 1)
>>  		return;
>>
>>  	/* Check if PSCI supports SMCCC version call */
>> --
>> 2.16.4
>>
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b76f46a9-afd3-216d-55fc-026651ad9bd7%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
