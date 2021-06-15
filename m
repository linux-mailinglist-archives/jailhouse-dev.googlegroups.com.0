Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBDMJUKDAMGQEJIOIRRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 344D83A7C4D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 12:44:30 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id f22-20020a1c6a160000b029018f49a7efb7sf379335wmc.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 03:44:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623753870; cv=pass;
        d=google.com; s=arc-20160816;
        b=FSrMINcVHYgcE0js1IOuTuvWG/ucQwZrRSUudrOnK26ZJzKPVg/+hTNdQDKvTWaa2A
         mVFuZCQmTQJrWQ0BhZSjF9ULVSqn/dhxlUmAGMhEJF5fOrxTmDyESi6Y24ClUOTihSaW
         wTFC+5r2LlN0xNr8GrpmUq1VxRIPypfA7YiVPU2HprGmaYRzlsHuHZUeOYH1J0tV7TNg
         WWZM1Udvs+bkM7rBk6NJf2Emgt48NS4F7AbNp1ZkyTWVO1QZPYPXSYK+CagLyPI0kG7x
         TtSUFfObW4NHl1liaB4SV2f6SIUU0sv81WHbh2AgAeCR6kB0CruZLEAnLkE0CV25WNpF
         TAKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=5ZBw+sXRTqo/0FPWpjYvaJuGrFRG+dK4GUb5h1nLwqc=;
        b=SsQUs5Dp/sUnID6TNnc0sQ1sDe2+mZnNapXjY7tRwO++m+k4k6A37Fcol7dS4MfOtF
         z/GpqMo4u1cqbEsK9s5GSnVL60hA64q9nR+C1VqYlVnQvSJSG8+1SK/P88ZbgAx84bBa
         gGD14hibMBf7NvaP3Mt+D1DQlh5ZyoKvZBHDEce+h5pikLWMHHd4qrjXupcYudEZ/wpH
         rt1Ao2HEeC3/tmiHy06Ug6R/yWQQZQvdIalu3rcui0FsiVS3hTKeN/Jcvxy4HGyzZd89
         LuwMl4D8o3jL+lE1UN9iu+VeKri0NsXH0OHZtpgjSzVLeJJkNUH+bhuId+v8UP0PwOo0
         fxCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dvBI3iZd;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5ZBw+sXRTqo/0FPWpjYvaJuGrFRG+dK4GUb5h1nLwqc=;
        b=gjh8rNLQVVMBXmkjWMciHtpcgcAJyhYO6L8vpKtNkUgl9RkEJkxuFFnkL7E8BkMoqe
         7t52w+MWx387I/TnCcNnxk+zWprcNqJHj7pij4siHMPnfaS8CNcAVkkzZlIZsqJIiaiP
         OLyLIj28mwFPi3zfEQX13Vv5dpQccCIXlwe7ImNI8NYrZq/M0bK6+VrwCpiCsYMaZGR/
         mQxjKjFfLnObtNe2pdzj33w50VKsK8kizWSl5392qfcqedCgfRTUy8wqnIDsQI4Za27O
         1o6MFtVSHp82ACnOM8TA1l/+4QktYPWWIzoe3I+2bIBl21M8QXL7wDGxd12MXsG3r7AM
         4GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5ZBw+sXRTqo/0FPWpjYvaJuGrFRG+dK4GUb5h1nLwqc=;
        b=LpuUl78GPxVrSjVpP3qaQ/Vc++JLQBr7BhkW4eqYIMsXy97HRpaukMUkUETJVeSk+I
         f4DAckXE02PqIvj5qNDkTS/dGpstaadbDUQw3J9RkVL5CCXAiD1PJsFEf0sPoFNoO0ti
         sYIErlQZP0CvwKh2A62a2fq4dyui1wKgDvwnfWCNXfb9YoM32rhRKr9khI5T7MMMfrku
         w0yeiXXZw5XcluzS+uShaMSFnVzExU455IbNvRsCl1pGpxNf8d/7DGOsSDu2lep1JFyh
         zSsE16ZDRv0qlZZbCNWQvLyvMz1PmX5YYFS43jBsZzFokeAda4zRxVeFG3pDm4Jnvmmd
         VQvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533KFay1+2gTOYI0GXMm7szeAN2FTpUQ8K506jhYnP42Ud5+vsn4
	FFuP4YVCCteHbSht8n9EQ3I=
X-Google-Smtp-Source: ABdhPJyhpMBEUOiMdoKajEx+bnOvrORfcR29zIzlcXjDipXBQhCw0tx6JlszYPhQLwFixIql8pQslQ==
X-Received: by 2002:a05:600c:a4c:: with SMTP id c12mr4441713wmq.38.1623753869871;
        Tue, 15 Jun 2021 03:44:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eac1:: with SMTP id o1ls3054720wrn.2.gmail; Tue, 15 Jun
 2021 03:44:28 -0700 (PDT)
X-Received: by 2002:adf:c392:: with SMTP id p18mr24297672wrf.373.1623753868900;
        Tue, 15 Jun 2021 03:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623753868; cv=none;
        d=google.com; s=arc-20160816;
        b=UprKKxJqkBzKMNoViaP3gOXBezQWpexBQcr1j/e1ACMVyC2/POPmCvX5AA9oHRWpLO
         CRrLONs47F+VQ1+jwvHy2ONuSnyWL/zoraMx3nF/SQ8jC4Jyb3dsReiBrc2zB1fREHIt
         GkDkRfW6QHYsiFfnTzhbnKtrf0yOSogtJER4NSKPbGvZWCq/2+26JUoVslYvKU9UFZk0
         3Xym0oeG58ruT7H6GmjLIhpkM9hUWXR2WmNhus36rB9QCwIDkPJEia8bV4SnvQ/IoRKr
         rucrRXjxsgi8/PwMIyZl2E2g29fAd0fQZAhpZZiCHdJJ1sqjHhAC/kPdmaUmIdUmRqG4
         wjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=q8mr33otT6+7w6W5h8OcD01KzGsEsrZpi/QE0YB4FCQ=;
        b=KVDdJw/2VesUeLdDCnSlZriRDmN0kMjN2a5yaId6oz/mDC3IOxE9+kLDz3jkRXBPES
         2fKvYJ4Z+t6CkWWfSDZqh4E+fxHKEpTOzxcY0pC3wXt+amCrEoXWArTtEfz8X4MEndbW
         fo5x4SJxpDKSok6JwsMp9gvn94xXFzwQ8Squn2+7gIyB/YrPqCVZllcxljwGRXw+3NDZ
         W/jY91SwwUXM5L4QTVfIhsJrBqrT/WagHeXvYI77CbaLLQ1lKhDJJL9lJJRk+dFv1zAP
         xf9LGLWJ4rufEO2I9S97xHR/+KiRKeI84lqChOusYfEiv3sbVebRpS+vfabHCBtosiS9
         K3Zw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dvBI3iZd;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id c4si101988wml.4.2021.06.15.03.44.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 03:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4G44gw3mW6zxws;
	Tue, 15 Jun 2021 12:44:28 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::d104] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 15 Jun 2021 12:44:28 +0200
Subject: Re: [PATCH v2 3/4] tools/scripts: Remove python2 specific code
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
	<jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
References: <20210615093225.162909-1-florian.bezdeka@siemens.com>
 <20210615093225.162909-4-florian.bezdeka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <365e8552-76ae-f78c-d786-de6d41ecf161@oth-regensburg.de>
Date: Tue, 15 Jun 2021 12:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615093225.162909-4-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dvBI3iZd;
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



On 15/06/2021 11:32, Florian Bezdeka wrote:
> We are now calling pyhton3 via shebang, so no need to care about

python3

> python2 anymore.
> 
> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> ---
>  pyjailhouse/config_parser.py   |  1 -
>  pyjailhouse/extendedenum.py    | 12 ------------
>  scripts/arm64-parsedump.py     |  1 -
>  tools/jailhouse-cell-linux     |  1 -
>  tools/jailhouse-cell-stats     |  1 -
>  tools/jailhouse-config-check   |  1 -
>  tools/jailhouse-config-create  |  1 -
>  tools/jailhouse-hardware-check |  5 -----
>  8 files changed, 23 deletions(-)
> 
> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
> index cad761a5..7a7f48a3 100644
> --- a/pyjailhouse/config_parser.py
> +++ b/pyjailhouse/config_parser.py
> @@ -14,7 +14,6 @@
>  # information about the system. For more advanced scenarios you will have
>  # to change the generated C-code.
>  
> -from __future__ import print_function
>  import struct
>  
>  from .extendedenum import ExtendedEnum
> diff --git a/pyjailhouse/extendedenum.py b/pyjailhouse/extendedenum.py
> index f3dd1bb9..9d6043a4 100644
> --- a/pyjailhouse/extendedenum.py
> +++ b/pyjailhouse/extendedenum.py
> @@ -9,18 +9,6 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>  # the COPYING file in the top-level directory.
>  
> -# Python 2 and 3 have different ways of handling metaclasses. This decorator
> -# is a support layer for both and can be removed once Python 2 is no longer
> -# supported.
> -def with_metaclass(meta):
> -    def decorator(cls):
> -        body = vars(cls).copy()
> -        body.pop('__dict__', None)
> -        body.pop('__weakref__', None)
> -        return meta(cls.__name__, cls.__bases__, body)
> -    return decorator
> -
> -

Did you actually test and run jailhouse-config-create? I guess this
should fail, because there are users of with_metaclass that need to be
addressed.

Thanks
  Ralf

>  class ExtendedEnumMeta(type):
>      def __getattr__(cls, key):
>          return cls(cls._ids[key])
> diff --git a/scripts/arm64-parsedump.py b/scripts/arm64-parsedump.py
> index c695706f..54f4fd66 100755
> --- a/scripts/arm64-parsedump.py
> +++ b/scripts/arm64-parsedump.py
> @@ -14,7 +14,6 @@
>  # the COPYING file in the top-level directory.
>  
>  
> -from __future__ import print_function
>  import subprocess
>  import sys
>  import fileinput
> diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
> index 6d1743f3..a1650912 100755
> --- a/tools/jailhouse-cell-linux
> +++ b/tools/jailhouse-cell-linux
> @@ -10,7 +10,6 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>  # the COPYING file in the top-level directory.
>  
> -from __future__ import print_function
>  import argparse
>  import gzip
>  import os
> diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
> index 4c5289fb..7a634212 100755
> --- a/tools/jailhouse-cell-stats
> +++ b/tools/jailhouse-cell-stats
> @@ -10,7 +10,6 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>  # the COPYING file in the top-level directory.
>  
> -from __future__ import print_function
>  import curses
>  import datetime
>  import os
> diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
> index 62db24c3..d6ea7079 100755
> --- a/tools/jailhouse-config-check
> +++ b/tools/jailhouse-config-check
> @@ -15,7 +15,6 @@
>  # information about the system. For more advanced scenarios you will have
>  # to change the generated C-code.
>  
> -from __future__ import print_function
>  import argparse
>  import os
>  import sys
> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
> index 2095f4e2..c2cd5952 100755
> --- a/tools/jailhouse-config-create
> +++ b/tools/jailhouse-config-create
> @@ -18,7 +18,6 @@
>  # information about the system. For more advanced scenarios you will have
>  # to change the generated C-code.
>  
> -from __future__ import print_function
>  import sys
>  import os
>  import math
> diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
> index 7a41b48e..fc8ce4f1 100755
> --- a/tools/jailhouse-hardware-check
> +++ b/tools/jailhouse-hardware-check
> @@ -10,7 +10,6 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>  # the COPYING file in the top-level directory.
>  
> -from __future__ import print_function
>  import mmap
>  import os
>  import struct
> @@ -20,10 +19,6 @@ import sys
>  sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
>  import pyjailhouse.sysfs_parser as sysfs_parser
>  
> -# just a dummy to make python2 happy
> -if sys.version_info[0] < 3:
> -    class PermissionError(OSError):
> -        pass
>  
>  check_passed = True
>  ran_all = True
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/365e8552-76ae-f78c-d786-de6d41ecf161%40oth-regensburg.de.
