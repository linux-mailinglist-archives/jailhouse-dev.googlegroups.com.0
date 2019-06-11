Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBWHR77TQKGQETU5VN3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F43D5E4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 20:54:17 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id k15sf22046277eda.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 11:54:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560279257; cv=pass;
        d=google.com; s=arc-20160816;
        b=A2fc/059DdMV5aLXJuOPmcCAHn0leUAbgOND6+AcsvpeQoMU/ftCV0TuROz76kLJ9r
         W4/+Qb12u1Bs+eaFu2MZKNNXlETCjqsqs8632b+h1e9ydqyv4ToWDoVeKRnSHjtBT295
         J0ZQ3oNukt8lfP+7rCEEYZAUUYVJl1LtmtIOeGvnv7V5b1GKz/wKf5ULCVmnx+7SvHQu
         lift9wVKK9dAlbS3r1QGxeXDJvdtJRL29dtGbLVS5WsiHmMnyr2qCuFBZnZEVMv67cq/
         GtOFDcIOen6XN8nVPNfoEm9wIp3FvdH8JWcsGBg9T1fu1kdAahZfgIw+N54QMBW4FPBc
         81BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=Wr805JIu4L0eouErSWZrhGed9VkNWyOFwHZInq5Xw2k=;
        b=A5bySKvwIvRG5Zjjx8Kygb/8FtRR/e1S8JAVt+01d0lxferCuR/FZLpAoE1Q7txbaq
         XeJFKUAQHYvrU2PI9Lv6jM9YF2MoWvwffNr3OMYSFMrKMlJfBVxT3I4Pxu1AH349ktF1
         gflqhEr5Jv2YWf2v0CFQ0e+9J27NUg7jKeyzQ8OrYFUpSGvdorRe9Y7i41cv+/YGSV/4
         kXI6KLhqZwb5HOuBmD600moOxOXNLqmtaR+cYANLUBlyHCwMalBQDs8klwT2gsRGDpfb
         IxF3g4pCRIei+xa17Cdx2TxtgF4MNCWXrhyGABK44bKvbHLD+JfyZG85mcE+HutxuuJg
         4zaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HZphAAsE;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Wr805JIu4L0eouErSWZrhGed9VkNWyOFwHZInq5Xw2k=;
        b=Na3/PqT79lb3cjvN5SGNJ6qHkeATwnC08Y78Fzl1rnZnrTZdQlCEEYjw3idt02y4OK
         VXGDeQ9kHsVfZ2yaBicNw9XUGYANTfRC6xU8Niv/IkKC0/4pZczsSiEfbvG3562M72P+
         zTZwBPCyDkhmB9n2N3P5BQyPnFT2YnfTeELOFRcnzfafhzkXWIQu1CK5P6sy39htNYSD
         gEIGbZhHLAJ5X7hFFmJeZxUuMxW/6PoOqC1CUM99pH7qVxpHRpnSGtBX6tsuhI9WrCfn
         Q9VieKIhJBogBWYvIZ9/L6k2HaOa/FEQrV2A8Mrf9wwAqfpRoPLBcXgDiM1ZuqsEo/uJ
         U63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wr805JIu4L0eouErSWZrhGed9VkNWyOFwHZInq5Xw2k=;
        b=BGiPlFZwbYgF5P+y8Atgv+0sZC/EN1YYOgN640/b9sbM55WzlvtLqi/dcY5jC31t0Z
         XYuXkYO+Gj+2eXJSaudlxrtWqy/L6dVYUJj1RbL5AtmUM8O9zosHWi8B4LRqNDPMCGAM
         EdflI+FfZIgqX5EhSdWijmZMVotAZrrAiAC7QNz/t+CLVNxidHaStbMUYzwHXXLK1+W2
         XI082zNuHvYdYBJyew53MQpmz4dXD8pDADBqqmyYeoHe+TMZBgnova8osK4rlZoVda0e
         yLnHMtuBVlFMs7NNTSxa/H6xjw6O/KeXYfVHWZLU872r6rjtVF7xwsPeA8utdeSnKp2o
         rsEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUxYgHruCELJjIrwVLI3hAfRIot1izQOdeTHPI4w8SBh+2RIDfz
	4KIdDRTB8Qq3GS41Tb0icy8=
X-Google-Smtp-Source: APXvYqw7FoZK3c8hpkNvkxzUK60oCL2oWaNFo7m98DNuxnzbid/uHRu9YVlYrxOYIPSrm3mv3feB1w==
X-Received: by 2002:a50:fa83:: with SMTP id w3mr4934487edr.47.1560279257055;
        Tue, 11 Jun 2019 11:54:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7807:: with SMTP id u7ls4929068ejm.13.gmail; Tue, 11
 Jun 2019 11:54:16 -0700 (PDT)
X-Received: by 2002:a17:906:6413:: with SMTP id d19mr16042543ejm.147.1560279256447;
        Tue, 11 Jun 2019 11:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560279256; cv=none;
        d=google.com; s=arc-20160816;
        b=nEWcqLXgTSvbi2meQLFS4nmY2ktt3O1lNUZtIp48o/P6JXqgiZJRGmf+2w/u+G3FO3
         Nr+H6h4mzkXNXKxhT0G4OpL35cctyi8J42zf48VY5Zy2miEFteEdrGdE7bK9uPXkLqvt
         pJhXR/q0Oo29KOVxmaIdZjPhh/kIyGwyqzsVbPJdAxo8NmEvead30NMFBnq4M3fB1UrI
         lrmO52eGNsede8/d6ne40TK6LWw6ZyI6tlVwQkDeSuRucdMSS3AM50dX0T0+RKeZ3l8X
         60seYwenkFEkspprBBExdZW+ZDHarZBsfK5bcxvyp0wEhusFxpc3gR+yDhBnmb/Nl6vz
         M1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=NfTiJ8ARVE9pD5uCTAeGatseisdEGiWnVt20YvfLJYM=;
        b=xLlcVrkqT6fIQIEpKNWRiTdoOXUd2uC7xhJgNbVW6CafU7BU1k0oLCeBlpmLiYlh2M
         /PAJr29NGrCFQOUC6BFwjDPamtkzKggkhyKJSP3B9ZirVbLSGYsxbp67oJhFk7tl7Xhs
         qsTMef13SDXDdzGa6UfxVA9Ievd17pPDTfAshyXBo7G90XdSsfi7L7WPkhwP/IgvbYaK
         vAtCgGyhRYZUQFZ481htcdJYZZi5rCXf0cs2+nY5DVfYYzOCD+64VuXJ2IjDVQ3Wnahs
         QW4Nr3lBuFbichKwsJuAcLjvsTlakH96wcZP8pjhZwzZzddKdFW2CsHLYxxnE4rsRr4R
         CVrw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HZphAAsE;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id r19si728566edy.5.2019.06.11.11.54.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 11:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45NfLH6Qz3zy5p;
	Tue, 11 Jun 2019 20:54:15 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 11 Jun
 2019 20:54:15 +0200
Subject: Re: [PATCH v3 10/10] inmates: x86: Add SSE/AVX test inmate
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
 <20190610230330.21419-11-ralf.ramsauer@oth-regensburg.de>
 <00ddbdcd-b488-80e6-fe47-4d5aa50f038d@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <c87fcec1-e509-8851-50b8-1fe26a962f90@oth-regensburg.de>
Date: Tue, 11 Jun 2019 20:54:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <00ddbdcd-b488-80e6-fe47-4d5aa50f038d@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HZphAAsE;
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

On 6/11/19 7:25 PM, Jan Kiszka wrote:
> On 11.06.19 01:03, Ralf Ramsauer wrote:
>> Depending on availability, this inmates executes some SSE/AVX
>> instructions, compares the result against an expected result and exits.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 inmates/tests/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
7 ++-
>> =C2=A0 inmates/tests/x86/sse-demo-32.c |=C2=A0 1 +
>> =C2=A0 inmates/tests/x86/sse-demo.c=C2=A0=C2=A0=C2=A0 | 92 +++++++++++++=
++++++++++++++++++++
>> =C2=A0 3 files changed, 99 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 120000 inmates/tests/x86/sse-demo-32.c
>> =C2=A0 create mode 100644 inmates/tests/x86/sse-demo.c
>>
>> diff --git a/inmates/tests/x86/Makefile b/inmates/tests/x86/Makefile
>> index 1f30852f..030e20e6 100644
>> --- a/inmates/tests/x86/Makefile
>> +++ b/inmates/tests/x86/Makefile
>> @@ -12,11 +12,16 @@
>>
>> =C2=A0 include $(INMATES_LIB)/Makefile.lib
>>
>> -INMATES :=3D mmio-access.bin mmio-access-32.bin
>> +INMATES :=3D mmio-access.bin mmio-access-32.bin sse-demo.bin
>> sse-demo-32.bin
>>
>> =C2=A0 mmio-access-y :=3D mmio-access.o
>>
>> =C2=A0 $(eval $(call DECLARE_32_BIT,mmio-access-32))
>> =C2=A0 mmio-access-32-y :=3D mmio-access-32.o
>>
>> +sse-demo-y :=3D sse-demo.o
>> +
>> +$(eval $(call DECLARE_32_BIT,sse-demo-32))
>> +sse-demo-32-y :=3D sse-demo-32.o
>> +
>> =C2=A0 $(eval $(call DECLARE_TARGETS,$(INMATES)))
>> diff --git a/inmates/tests/x86/sse-demo-32.c
>> b/inmates/tests/x86/sse-demo-32.c
>> new file mode 120000
>> index 00000000..1136c98f
>> --- /dev/null
>> +++ b/inmates/tests/x86/sse-demo-32.c
>> @@ -0,0 +1 @@
>> +sse-demo.c
>> \ No newline at end of file
>> diff --git a/inmates/tests/x86/sse-demo.c b/inmates/tests/x86/sse-demo.c
>> new file mode 100644
>> index 00000000..2d2ff379
>> --- /dev/null
>> +++ b/inmates/tests/x86/sse-demo.c
>> @@ -0,0 +1,92 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) OTH Regensburg, 2019
>> + *
>> + * Authors:
>> + *=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <inmate.h>
>> +#include <test.h>
>> +#include <asm/regs.h>
>> +
>> +typedef u64 xmm_t __attribute__((vector_size(16)));
>> +
>> +void inmate_main(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 printk("CPU supports\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=
=A0=C2=A0 FPU: %u=C2=A0=C2=A0 FXSR: %u XSAVE: %u\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=
=A0=C2=A0 SSE: %u=C2=A0=C2=A0 SSE2: %u=C2=A0 SSE3: %u\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " SSE4_1: =
%u SSE4_2: %u=C2=A0=C2=A0 AVX: %u\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " PCLMULQD=
Q: %u\n\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_fe=
atures.fpu, x86_cpu_features.fxsr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_fe=
atures.xsave, x86_cpu_features.sse,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_fe=
atures.sse2, x86_cpu_features.sse3,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_fe=
atures.sse4_1, x86_cpu_features.sse4_2,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_fe=
atures.avx, x86_cpu_features.pclmulqdq);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (x86_cpu_features.fpu) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 float result, addend;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addend =3D 123.45;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D 543.55;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Testing SSE...\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("addps %1, %0\t=
\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+x"(result) : "x"(addend));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Test raw result */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL_U32(*(unsigned =
int*)&result, 0x4426c000);
>=20
> "int *)"
>=20
> But shouldn't we use u32 as type here, to be cleaner?

Yep.

>=20
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 {
>=20
> Is there an "if" missing? If not, please format and indent in a normal wa=
y.
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 double a, b, result;

I use those brackets to scope a, b, and result. Not ok? Then I move the
variable declaration to the top.

>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a =3D 123.45;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b =3D 543.55;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (x86_cpu_features.sse2) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prin=
tk("Testing SSE2...\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resu=
lt =3D b;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm =
volatile("addsd %1, %0\t\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+x"(result) : "m"(a)=
);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPE=
CT_EQUAL_U64((unsigned int)result, 667);
>=20
> Why "unsigned int" when comparing u64 in the end?

Yep, that's superfluous.

>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (x86_cpu_features.avx) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resu=
lt =3D 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prin=
tk("Testing AVX...\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm =
volatile("vaddsd %2, %1, %0\t\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dx"(result) : "x"(=
a), "m"(b));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPE=
CT_EQUAL_U64((unsigned int)result, 667);
>=20
> Same here.

Again, superfluous.

  Ralf

>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (x86_cpu_features.pclmulqdq) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xmm_t a =3D {0x00017004200ab=
0cd, 0xc000b802f6b31753};
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xmm_t b =3D {0xa0005c0252074=
a9a, 0x50002e0207b1643c};
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Testing PCLMULQDQ...=
\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("pclmulqdq %2, =
%1, %0\t\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+x"(a) : "x"(b), "i"(0));
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL_U64(a[0], 0x5ff=
61cc8b1043fa2);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL_U64(a[1], 0x000=
09602d147dc12);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (x86_cpu_features.pclmulqdq && x86_cpu_features.a=
vx) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xmm_t a =3D {0x00017004200ab=
0cd, 0xc000b802f6b31753};
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xmm_t b =3D {0xa0005c0252074=
a9a, 0x50002e0207b1643c};
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xmm_t result;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Testing AVX PCLMULQD=
Q...\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("vpclmulqdq %3,=
 %2, %1, %0\t\n"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dx"(result) : "x"(a), "x"(b), "i"(0));
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL_U64(result[0], =
0x5ff61cc8b1043fa2);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL_U64(result[1], =
0x00009602d147dc12);
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>>
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c87fcec1-e509-8851-50b8-1fe26a962f90%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
