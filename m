Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBA5KVD5AKGQEWM3XXOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0D325661C
	for <lists+jailhouse-dev@lfdr.de>; Sat, 29 Aug 2020 10:42:44 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id l14sf646610wrp.9
        for <lists+jailhouse-dev@lfdr.de>; Sat, 29 Aug 2020 01:42:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598690564; cv=pass;
        d=google.com; s=arc-20160816;
        b=XKymGRdPO6LZMkhOng6wWbhXcvsA8B9aMR9g7R9NHTBeoGP9mtBnGhzHBPMX5WjlRZ
         5wcpBxvzdOYBAaSImxxyGxK5In5eogbEhxpPE0eq5wiwpGDcmnUt0P+ip+Kw80LJQYDv
         tprzX8Xxw+9kqE0n4v7GzHjrF0oj+C44LyViqZ5VM2hlnG0uBFGkLVQ1WY0LVkAdG8KO
         +Pl3L/nUgKysPF36YZ40ELNQo+E1DbNjmgHTaUWXmownUr7jQeQgkTe597mTTM109KLA
         qZPj5EMNJ0dGI8p8rSb5sY8mrpHivsOV9/1ZrG8JLQWuYDEyE9P1x8q2MmBe4Ix0QS46
         AaGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:autocrypt:to:subject:from:sender
         :dkim-signature;
        bh=MsgGkaNM//mIyCxn27ENoxkLmt2Z5U6hP0P8c6A5U2w=;
        b=RnUvkAKVmwLnGDZw3A0GzU0RzJjhDiSs4OGnwz1pMcuNEo8Tbe4wns3231HLI+pdyP
         FNLdf7UTLCSEQZUo4Ki/u/tXXX3NRQ3YCgnoN7kJX4oA0Cq3/6MNt/cEMNN1LVWoGc7F
         lb3+PO4sveAkfOPtwvF8b/6YcyAkxT5yckm4FFFI8w49Az0NtjTx/9/OZKPLYTRKG4fo
         oorrNqorQg7yWsXJJ9hhXZ45PMj7ZQdJCF73qQFidDnf7D/ATWL41o+qAzJr9vANPNyj
         S39MPF1kS0TXO1H8AttVBGmVGiRN0sI92hCHXsEhJ4f326+7HrThtdjnASICwxU5gUsa
         ZZZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YGJf1ZJg;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:autocrypt:message-id:date:user-agent
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MsgGkaNM//mIyCxn27ENoxkLmt2Z5U6hP0P8c6A5U2w=;
        b=WBWQdYR7WzUuhzx2kYNirDwkhadRkhzDTAtuVJD50613Cul5ffxxKJib2DeF49a8Zl
         0hwX4gUATrEUBtqwQbuPsVRHchH7WqPz2zOlGmxGgwseYKitlNMxt/AlLZpFSSLw5NwT
         ahV5qglQuM4lNgaV/lRp136Fq8h0tiJ7eLKdga9idWFQWWK5gHLmStR4R0qpZfw9/beK
         rPdLFIdmBqS0Xnt6fttymfdDfGBwZPjd4PqEPrGquru0qnFC3+Z7OnrgfYeC/bx3wWS2
         XDkfd1iiIM7r03p+mhoMwUq/taJ14vwX7wq/baEyntOjvcyWF8/Jh0nrefXGQ7/TtKsP
         C3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:autocrypt:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MsgGkaNM//mIyCxn27ENoxkLmt2Z5U6hP0P8c6A5U2w=;
        b=XAZPwRtx/ZdmwRCVRVWHPcXwSNR9dQUxj1K6kpg/NxSHzPEhJZCBjWOv2CDuIBgG+G
         k81Q/5dMdT464SuKquxjOY2eKmRLvPLvNsrv7TCLVRJaGC7iVc/ApPpdsc27Mf5Io8DV
         7sbLs1NzGOkXy45BCTgCz0iRwwtM2IQ/pm6I8frFWJeR2Gfnd6FO+auoa1N7LJ3lpsnU
         jCmJZrvmoHDyD08LGC8uAWBcGRaN+BWWuVruY+cAd94XAOoUyBdcqHFow+2DoAlF7zs6
         BgUGNMq7SJMdgfRnC1huEbE6u2+Fh/lXVsbQssvufdmptiiHVm4Z6LOQgZtKIKbtGU0b
         J84A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532YbrrrYoQ86MR/GZhrGGH5BP962IBy0FQa5FMaEBDVOgl105gF
	2JUS5Hvv2Cs33LNhdXKDozM=
X-Google-Smtp-Source: ABdhPJwi3uVqngBYrNPWahV7Cu6fDDUgwg0kUfVwKgt0NcIpd8chfUtIfV+vBUsYqpg9IOp7qV8BmQ==
X-Received: by 2002:a1c:6445:: with SMTP id y66mr2536135wmb.12.1598690564113;
        Sat, 29 Aug 2020 01:42:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls1596742wrx.3.gmail; Sat, 29
 Aug 2020 01:42:43 -0700 (PDT)
X-Received: by 2002:adf:f08a:: with SMTP id n10mr2805243wro.351.1598690563435;
        Sat, 29 Aug 2020 01:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598690563; cv=none;
        d=google.com; s=arc-20160816;
        b=LGrh/G01M8XcBsC0wKzQs0jSXYkT6Fvnzk8LLmtzixwMiBE9WxeB0UiHJPP1i3/rXR
         hBW3AlYCN4ePJq3fz7t1Q/kdPIv4AvlOqnxIKgZ54pyt4FufoofO0iTwvPr64LET47QL
         AMuoxqAaYe5BnR60MH4PnLMvmyAtsU3u+FuOJljV5zyC/sfziKdKzN6nRx+TI6K78y+Q
         dwc3yJiNBwQcEYFJ37Me+/TCZrELv135Ep3MvX8A1QmBttp43jfEurCVWuuUvIoqwjH2
         Tmgo1ibenyjH+h2nwFlgGbWlPqw9NKiZlJWE1vZPwxX8FFCJEUaKfSMhAmPB9MVpMs57
         ngFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:autocrypt:to:subject:from:dkim-signature;
        bh=iBMv+3t7mFzgum44vffHBHRvjIaAFJUPUhzwSPugl/M=;
        b=S/GBt2C8uzoQQXsjIRvvHdyzfIEp7qhWwrLPECsnZ32KxlRD0KNmKwo7pAvGHMmXHB
         b46jfRrkZSxcaI+kY1rhOS46MzBTllXZtf26fab7rOVEOLZG8sOB8wSoRJ6ky7Gti9BE
         mbbzpsvCpiYotvF7oARCpAFZ4A6KXsVwwFD6UAW9rkL4KaDxVMlax01nr4Z9NouX+KEb
         GLjKTr05J59HQGLEHga+Wd2+F+ylHDI326gzxleczoHVvj7BQeLkmNDRvoIG4NJdq1Sa
         GAOe1BTBewYhan0rhaaX/oj703qOyfGAezFY5pLUeopfvAkhsVGRGSCwnlV4u8lo+0N+
         U2fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YGJf1ZJg;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id w6si85610wmk.2.2020.08.29.01.42.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 01:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MQvhG-1k1bPJ08Q2-00UHBi for
 <jailhouse-dev@googlegroups.com>; Sat, 29 Aug 2020 10:42:43 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] arm-common: gicv2: Fix byte access to ITARGETR
To: Jailhouse <jailhouse-dev@googlegroups.com>
Autocrypt: addr=jan.kiszka@web.de; prefer-encrypt=mutual; keydata=
 xsDhBEq0i8QRBAD2wOxlC9m/8t/vqjm1U9yQCT6OJ2Wbv/qys9DYM0CvcOTDMWQwmV1/VsZj
 KR5YgB5NPt+To7X6x5cjz15AGnx5Fb8Wnrq8EF9ZfHMwb7YMx1LdPYPDnXr37wE3XupFmkHB
 Mes4htyX7Dz8LvKDLnli4IsAmWG+kV1JI6LWKXLpSwCg8JRq4SWoB4VCQxbH3GjntgvwNc8D
 /2q5Dj0urJ7s7sdXhrH0hcFkpSFRmU5Yd6MCwcbFHm2paL5gqVjNNUUwDBKAL9eZaQVIHKwC
 44BvNGO2gcQ26R3AuCHUQ+pZHg34tok1JCNZ6IEZccb+33Qq0qbcDMJJiDYp7ppp6ozifvc4
 YaqJECX48IydxfE9+41oV7T5vNAzA/QL/UMJyTnu5jiOXcyn5iFQw535lXkwKsqeXzCowLho
 HICZ2jITJPdTT/+9pGWwMQqST/SS35Tx4EnS3z2BWsNMCLuXCPkxF1elaMJqMfMJxFD8rAgS
 9GK6zP6fJlsA1wq/UvKSL8v4QPOnTNCVOsyqJVasGV0ZPcDfcj+ClNO4zR5KYW4gS2lzemth
 IDxqYW4ua2lzemthQHdlYi5kZT7CYwQTEQIAIwIbIwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
 BQJOpoNtAhkBAAoJEIrUrG965ecUOPUAoK+Rh12KgCjplHAS0AoiGKwGOuq7AKDEVnBtRAoy
 VRvp3lOlOx+P2Ay56M7BTQRKtIvEEAgA2/PlX6oyi7dToH0CJCHq0eKmZaa7CmGaVnxyeepK
 vIfiM8n8Td76AbG64fjREMwgSpb4F/UytF3z/03tj4e49W/zKjbBRB2/wmFRlZBC9crg22Q+
 bgvMOsxnC6uHXaWN8fL+jVei/5OoHOoFqaMsX8EvploitlI/BPj+VgW26jksf3YZyk1hncls
 Z/IYhXzgRmVJo4RiTW/YLQAkwndwc+fKPa/IYLEDW1Jc4kNLoK0P90b45zju0hpl0C00pVOR
 TOtzFK9G5Ha7qOAWJfAVJORHKAkkvwftf3hkpPdLyvZUWRHXvUexmA61fLvDBAFhRxYGD8t5
 gz88SF5Tzq+0ywADBQf/YSkaYrEslPWiCA2wU6EW0yaqBQAobFsOMvsufJ6o2ntq5Ncq37VI
 3KCT67eHPE9x+zPcENoZWsRrC9S9PCf1LOsi7ybZsR13AJqDFlRzJZ4klh9QwgwFZxUBzOdI
 vttwzG1QkzHx06RKZluFYpPF3DRduSMukdIJ2wmWCU+ohB+mYefe65JGjYQfHVs8mgYVFOPx
 bRea9VJACCMuspoZWpj43UdR1lLLyIUFYz+jqcPW7Hd/GTIw4N67pYl0dwPDmFd4ohJ5g4Zp
 q61toNysBGEuEm5GCcn0VmGtQpSYnR5cVm5b2yPz4bIuFOSuZUo/l7vitdY0iy0/wvKbBC+N
 K8JJBBgRAgAJBQJKtIvEAhsMAAoJEIrUrG965ecULvAAoKGvxs5T3IhyQT8I8sMsyAvCE4wH
 AJ46S16yab+OxNkvOeoOEX0EnHVHaA==
Message-ID: <d3567670-47ec-e7eb-cc1b-295527292673@web.de>
Date: Sat, 29 Aug 2020 10:42:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:qw1EcAY+Tynx8bmkG1pA+K136QnIRX+ykGeveIqrxIC3AALqcwt
 aky9zEg11QGGHieA/LMovEsU1oDM7khkobwEfiyDAXsDE8lfgG4Ll8qGGtP7nIEhtXqAikB
 CBsv6bJlFTmyDUgcmI7mxZkHxgrhy7QUwAhHgpbRWB+5qb+nvbRqFLVfixKP+1u8H5Qp29L
 nDf1OScx6aJsTQlLqWk2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TA4dc7jak2c=:DsIMmYkXIjLMMzme/fegE9
 QlKTeA/v21Z+NWennWxsRVVoR9ic2eORJtMAAOBIndmIFdykbEolwTd9+TRUG6dAkdaZiwVzk
 7X2+lLohM6Cb6Lgn3cXyXkSM0hxwPnvQSkkoSI9pocBTak755tyjSy5Z9QYhjfArZjwx/5iAd
 N8J8hD9DaCvRaUD1hM02dgbG2Xni8xPw49BXVortMsPIR6lUutIRw2BnuvA5LxrUO/vZTgMU0
 +xglBreMg/kHEFmo0Tylq8Pw7L6QgnS2MoEkXDLLdk5JjQtnSmV3+uEiNZxf1wyFMgHx9nRS/
 bqaWrgrFpUsziHTRdIH32O5iAY1AiWLv3kmv+SbjiTnMWEEf9/XX+M5OANsMSVeAEtWLVF52M
 scpzfqTYLrLjMqa45jE9C+s6cNN19XBC19bHwXCrDVuQtEw0xCvnsiTdWoQ56C+ARwWjIarm+
 Ydsn03fpO8/zVIJ/+rk6sAJvWw/fXf8zg620EOM9igD38hR8wciLE89xTfcIhEhIvtyJlSlnB
 8k5NFWYNuspQRM9WYOJKA0c/eJzZ2HACOCuA3M4HXIbvEhP8CRcMYkYj6HPsSiCiid78P8M+I
 lD84zTtV4UnzMUPdaiRwQygikEvFX/9FsgkmyGfm15/z3a7H3z+nlPhAvC1GwwwdrnShh8ePD
 Pl/r/xOzrCgmxopJrBxi3MuysWgcTllw41hbnUfP3tsfZ6VJFx4050Go5SD8n9m+FPHkw7XsO
 1mAM1ugjspIKdBfP32D1/fi/dyCoqLp2VxcG+o09TNlO7T5qtSa6Ew//A1C6MQrGSn/Pu/APd
 XTmCAXJ61bVTvoe/zOD3YGSW3uK4wZ4RATwl9oUvsXFL5RN7OV3U3Jq5ic4x8ZvoND0aW44R8
 kTG6M73d1JwhJGr1oOjhMkxuRrt3Z6jMe0gXl/U7c808Ii0KrXvL5FBeFVRw6VQ7UauQPKnxM
 rK0oOXZ1MNBujrfWW48JzH+9uH64qQxmotY31DNfBsfoK2BGX62Dbklu1dhDSPixi5CaX8bJD
 TptP86d224jsw4vg0lTo3kITDW4U8l9rIerFleKhBGiLjDfaMgeUHBlygMRgJXtzGsxR8+Acr
 CKrs2yZ6vv6pFGSf85yccfhUQajGEQIKht0mQHBbAn4CORc6yjWRUZoziNBMIhGsCvNbgOqJU
 Aj9dfE+wx/cjyPCGSNzy3lsYT/BoQ/X3uEtJrpf58CZIhlg0QdEbcdo1R2X3xWktn186wsa2S
 Ut+yvPo1RmYF06iZHwWQje9Q7nu1Ge5MRc66R+A==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YGJf1ZJg;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Byte-size write accesses overwrote all fields the issuing cell owned,
not only the target byte. And byte-size read accesses may have returned
the wrong value. This was broken since the beginning, just wasn't
stressed properly so far. Latest jailhouse-enabling/5.4-rpi revealed it
finally.

Fixes: ee6b35ba9037 ("arm: GICv2: handle SPI routing")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/gic-v2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index 6a81f77b..b63b0fbc 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -421,9 +421,8 @@ static enum mmio_result gicv2_handle_irq_target(struct mmio_access *mmio,
 	offset = irq % 4;
 	mmio->address &= ~0x3;
 	mmio->value <<= 8 * offset;
-	mmio->size = 4;

-	for (n = 0; n < 4; n++) {
+	for (n = offset; n < mmio->size + offset; n++) {
 		if (irqchip_irq_in_cell(cell, irq_base + n))
 			access_mask |= 0xff << (8 * n);
 		else
@@ -441,6 +440,8 @@ static enum mmio_result gicv2_handle_irq_target(struct mmio_access *mmio,
 		}
 	}

+	mmio->size = 4;
+
 	if (mmio->is_write) {
 		spin_lock(&dist_lock);
 		u32 itargetsr =
@@ -454,6 +455,7 @@ static enum mmio_result gicv2_handle_irq_target(struct mmio_access *mmio,
 	} else {
 		mmio_perform_access(gicd_base, mmio);
 		mmio->value &= access_mask;
+		mmio->value >>= 8 * offset;
 	}

 	return MMIO_HANDLED;
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d3567670-47ec-e7eb-cc1b-295527292673%40web.de.
