Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBWP62T4QKGQEZJ4CBMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D868243AC4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 15:25:47 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id f18sf3922653qke.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/uZLOEBRVfYm5HkuRUzE2EF+CXjxJQoePWoQHhtrcHQ=;
        b=kAm8ZaisW9K7DZdeNnftCZS6aoQqtb07jdBnRNwJkzdZo79YjosvHQuuR0BnhU32aB
         y/So609Dn8BC/X4KRLlL0GIlDRmDL1RS3s6uO8YMFwSGqABkJeQIkSoaw26hmGKTlwfv
         YNJSNnW9ZahhAhBEIQhyANz1DR05ZT75asSTni/5S+/qtbg1IMrZ3fJeeIRD5f9yPewA
         6WK5iQpWsdWRUrWvfjR+rJzK9DS/91+mwteqdsZ21dJFqoWV7KTgmQn95Wvxdud/jtl6
         JqBqNq7m4kwnDFNZvoHSaaFujb8BEfvjsnnjbrJdsQF8fsL/cYLhcxZW8+67Zp3IU3nM
         HiYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/uZLOEBRVfYm5HkuRUzE2EF+CXjxJQoePWoQHhtrcHQ=;
        b=aJkL+GQoZis51XpDQ5FYU5NMqFQ18nn9X1Fkmz7mUGPOATmJ68mTu98z9Tc9YW13Zz
         9OO0xf843AYxe2wEAIx1Ny8P8UTQD5iZIZfaOEibFh1bpa15Jygmy+SzSKW0H39Q+pUO
         MMSps51xZtcXk1N4Syx4PRUcvKR4YmGRBqAEt9fLpRTEf5H3CkNS2ubhUwt8QA2LACW+
         prYaHd7sUlcxwr5T6yoEgjxFP/uz2CNKTqoXqqQdMpZhK5qtRViJsjXYgCaTCTho/qys
         Pp3enIvPelrvQHH/uLf55c08NMz6srOkeqGZ9j87FvGIbgXAK+k1HVMZz8+89H/k6Gqo
         RA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/uZLOEBRVfYm5HkuRUzE2EF+CXjxJQoePWoQHhtrcHQ=;
        b=X/ySUMqfMWPELGz16842v52cOLtv68WqoKcHk0dt6fLbuyHQqAtYv8+B28+9MQGNDP
         x1YWhASeqgn3pBoE9H5gMN+GYkKCv7e2JUrBr2WtnSNhEZbzzKvkHtdmWNR8HnigvXBC
         TOBXfO6QyPzPw8NP7MYMljSEmuUET/WmRg9GxJadY2CpAxcvWLxKovr5QAaFDnC69oDZ
         xCvXRp5RxvHP7rXdXDGznnFX275UnUbWis7BtYkDOEqbCYDTdYDIVcLkITpP0u7/lvme
         bmU+BMkuYLP63JzQfkrqOgsxZY/3ESKoByQgEqYmPW0xDqk+54U8RUDbaI4oJArH/kg5
         /mhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hJ0ykl7YzFUnHHepJ04AZZrxQ2qpoP4IOc1bbb3KS9+FP1S+P
	Uqct2w43xuIdOPnmb2/K3qo=
X-Google-Smtp-Source: ABdhPJwOUYvJrkwh3lpzkM51mmRz3wQJpp57AfcZINGYNha5gKCiKsECtO0telzw6L+1FKsPY3lNfA==
X-Received: by 2002:a0c:e883:: with SMTP id b3mr4414513qvo.133.1597325145636;
        Thu, 13 Aug 2020 06:25:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:7d2:: with SMTP id bb18ls1376314qvb.6.gmail; Thu,
 13 Aug 2020 06:25:45 -0700 (PDT)
X-Received: by 2002:ad4:4ea5:: with SMTP id ed5mr4521581qvb.130.1597325144936;
        Thu, 13 Aug 2020 06:25:44 -0700 (PDT)
Date: Thu, 13 Aug 2020 06:25:43 -0700 (PDT)
From: stranzjanmarc@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o@googlegroups.com>
In-Reply-To: <ce8b7368-3da1-fc89-d1ea-628b25bec62d@siemens.com>
References: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
 <ce8b7368-3da1-fc89-d1ea-628b25bec62d@siemens.com>
Subject: Re: Starting jailhouse on real hardware without QEMU
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2154_765066992.1597325143693"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_2154_765066992.1597325143693
Content-Type: multipart/alternative; 
	boundary="----=_Part_2155_1978357594.1597325143693"

------=_Part_2155_1978357594.1597325143693
Content-Type: text/plain; charset="UTF-8"

In the kernel log (dmesg) I've got:

[19616.932538] jailhouse: request_mem_region failed for hypervisor memory.
[19616.932542] jailhouse: Did you reserve the memory with "memmap=" or 
"mem="?

I have to adjust the kernel parameters (kernel command line), right?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o%40googlegroups.com.

------=_Part_2155_1978357594.1597325143693
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In the kernel log (dmesg) I&#39;ve got:</div><div><br=
></div><div>[19616.932538] jailhouse: request_mem_region failed for hypervi=
sor memory.<br>[19616.932542] jailhouse: Did you reserve the memory with &q=
uot;memmap=3D&quot; or &quot;mem=3D&quot;?<br></div><div><br></div><div>I h=
ave to adjust the kernel parameters (kernel command line), right?</div><div=
><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o%40googlegroups.co=
m</a>.<br />

------=_Part_2155_1978357594.1597325143693--

------=_Part_2154_765066992.1597325143693--
