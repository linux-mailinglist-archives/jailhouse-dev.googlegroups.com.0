Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVVNUODAMGQEJETF3JA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B43A8699
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 18:35:34 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id u23-20020a1979170000b02901d2e8dd801dsf7295105lfc.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 09:35:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623774934; cv=pass;
        d=google.com; s=arc-20160816;
        b=bFnb+sWkUh/vlO+SCc7TCcdclxiP/OaOrJX1h+zVW2F7NmrnH2OHsraVWq+/WO+bTQ
         W0PIxEy/RiFyMUzuDIAWMBrw/ghvxnu2xFJvd8uSUhMbjiAqiMyZA2vZ8oAk+mTgK3eo
         e8SfWM2qjezcYXX8pO2Pk1phw4MGw6T1hBNtcKW6Sss1BubS1u7koN8JtM7H6gGhrKj+
         xMGULhHMD9LGgOniWhUqxvCwS4q3Po47OklTMOXLx92aobMoq6+vH0d4sMprGGskIpik
         s8ZfodwROT4F0JxBV/MbWp/wrEoeTBTACaRl4xqiu5GLI9U+tTQYLcQXmnIiYZEeCwNP
         Iv6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=jrQ+d32UtegzOpfZ1EL4qynyG4B7WbA/6KCkAZokk2Y=;
        b=RLeyoZ6MnHZUvIj+LHba1ciCPXpEfodIM0Dp3wBdBtlbAxzbt1+P7EOk+dDxz/A+Q6
         /2GGriHMaUtAmsswIVnokbc7wx+V9uqCNnUIT5mEGcqNBFo2hHSumgyBI7C9YQFdCeYg
         VqRaShEBTCT9FNDRtvJGwYfznTsgywsWkiE1G//7dHT4BaBYo+4EJ2C7bfxgo9qgUL5Q
         hsXD1+XOgyJwEjJGRUDdOO883XeCWv74mW+jtQJhxBYv5n+eYKHt/m+WgxGPAFwf5zT5
         iGCHpCMGlTWN8vpOMIw7c3c74MHtiknCeasl59fBHG7WBpv6ANkXJprLSbvZ7oOiOtVO
         Ekjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=CMSaqIUy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jrQ+d32UtegzOpfZ1EL4qynyG4B7WbA/6KCkAZokk2Y=;
        b=c5jA1Ns8Mk8haQlOT9IHBPT4vp8k82JSJnDfFbcgS/h6Hf5wRstPRXu2iPAcQKsS5W
         OJySK5iiDu6wQ2ewTQhqnfMpyl+2g/v+8Dwf55r0lLGqhzPxeFx6KnrgVu+CvE/GEysi
         juRqz0eIerAkZ4HJl5ZOOHqhUTGFDyTPVIHYIVM42NYDYl4mRbApcRc6IibR4lh/EbNf
         CKpyYLY+RMSvxVFJUh75SDa2lj2LII900PTH97EaQGWi0GQrhjwC/UaegwTmM7HaVrmt
         +wRxzmvoop8uZmNcY8mWG++kEiQJcArjdTI0ZlB20KxoIVhzaqqI7dDY2B7D9IGKoo3e
         vo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jrQ+d32UtegzOpfZ1EL4qynyG4B7WbA/6KCkAZokk2Y=;
        b=a/gtT4OGI5JIeGgBcqlaRxi0LgSiB08IrwxY3JId3Du92u8NPEnCSkudg+5N8HxG8L
         B1lKfglwdHNAm7FFCy1lD8k+SR19stfGtcZvdYBsbvPn3Dl9p8fKh0VA42yaeXMsoKcP
         Br+QubmbQGTRk+9ftKOgwsLmVxE2B6jSE2werB47RFmVLPxwt4ghqWb5q+ICOM1hu1BN
         Xf73jBX1/eOByDHLGuXlYboHu7is4xamrlUTGbVi7nriroDeDmH/uxCEjKw22VW3Iax3
         s3+hoAXqaAIlwfj2ajKoGXWVQV7Qf4jSQeeXhdn2xZ/J2yTe8PIx3uXYjWwHzQSIej8A
         zSTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533eyq2wLDeIdhI179klky0JzVg3E/CLELSpEPyS5Y/iKgj6vV4F
	bMXZu6zQIlDj+48v3AJscyw=
X-Google-Smtp-Source: ABdhPJx4IcecMwA/+bGowpWFcATisvjldhSNAFuQRj6gOFoYM11fi2WITEAcfz8vxu07uau6BHDcqw==
X-Received: by 2002:a05:6512:16a6:: with SMTP id bu38mr216602lfb.92.1623774934326;
        Tue, 15 Jun 2021 09:35:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3a86:: with SMTP id q6ls1009916lfu.3.gmail; Tue, 15
 Jun 2021 09:35:33 -0700 (PDT)
X-Received: by 2002:a19:4810:: with SMTP id v16mr207461lfa.254.1623774933071;
        Tue, 15 Jun 2021 09:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623774933; cv=none;
        d=google.com; s=arc-20160816;
        b=Yr1CP771ezhCN0738sfs0cNK39AJmkovVxoP5ltxSoAqC6TndXr3oCfbmP5JQ9ridu
         YCPO+vekKHUhNYZofebmaL7LWPIQ65yAPwwwriWzxHqMinm7AS222c1i6Nm2ijhxhLOE
         4qO6b+4+Qi2P74DMmjMnQGWwvexBfDy6QhwXVGHQUpv575cg6d2gPKgP1P+arlygKZTZ
         rT5zcPYbMdh3QPQBPIX8jDRPRHOlK9BT7kk0AJaon5Pbw/OujPsLc/XUNAsCa8xemTwh
         fanlhXFpmFXjN19HDnuytbIxqi0SilDfpX4z3K+oSlR9+W8Inl3yDkZvIVVXrunD8LjP
         is+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=JeSUi83uSYPn7gX5WuRbrR0aKfX9ZxPIfRnbcFtpEcw=;
        b=q4TNdcWkS1cRo5uqTxG88GxuG0DNA3ctkqDAyV+RE//YmB0KxzbNIUBTyNXlBEZbvn
         B0B2P3lRdJx24OAfO3sC+3wCicjaG1kv9j16zT+zwOcnyQPCZm7ZxqipDJGrhIUPoHQY
         BVlG7POSSMNwltAaApE8XwKx/YiMMEbsfQlGQ3KueOTj221+jjviD7OWQz6fLEdW9ng/
         pac2YvwziI4pdFpV3DZlwD2MSXr/bW1He5VrZ2g7CfJ/c/Q1odhgoUh3nMJ0NHzQx97r
         /ux8pPBnNLpb0A48ALiwcNNfZMXCeExhVFdSmWyWRI8ivAxocsCSzmbbC4H/4BZEohNT
         BdBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=CMSaqIUy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id d3si114576lfl.12.2021.06.15.09.35.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 09:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4G4DT01pVMzxyt;
	Tue, 15 Jun 2021 18:35:32 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::d104] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 15 Jun 2021 18:35:31 +0200
Subject: Re: [PATCH v3 3/4] tools/scripts: Remove python2 specific code
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
	<jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
References: <20210615152550.356561-1-florian.bezdeka@siemens.com>
 <20210615152550.356561-4-florian.bezdeka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <4c50dc00-796c-4eac-dfd4-1eebaddc19ff@oth-regensburg.de>
Date: Tue, 15 Jun 2021 18:35:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615152550.356561-4-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=CMSaqIUy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 15/06/2021 17:25, Florian Bezdeka wrote:
> We are now calling python3 via shebang, so no need to care about
> python2 anymore.
> 
> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> ---
>  pyjailhouse/config_parser.py   |  1 -
>  pyjailhouse/extendedenum.py    | 15 +--------------
>  scripts/arm64-parsedump.py     |  1 -
>  tools/jailhouse-cell-linux     |  1 -
>  tools/jailhouse-cell-stats     |  1 -
>  tools/jailhouse-config-check   |  1 -
>  tools/jailhouse-config-create  |  1 -
>  tools/jailhouse-hardware-check |  5 -----
>  8 files changed, 1 insertion(+), 25 deletions(-)
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
> index f3dd1bb9..bcb959bd 100644
> --- a/pyjailhouse/extendedenum.py
> +++ b/pyjailhouse/extendedenum.py
> @@ -9,25 +9,12 @@
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
>  class ExtendedEnumMeta(type):
>      def __getattr__(cls, key):
>          return cls(cls._ids[key])
>  
>  
> -@with_metaclass(ExtendedEnumMeta)
> -class ExtendedEnum:
> +class ExtendedEnum(metaclass=ExtendedEnumMeta):

aah, you already found it out on your own. Yeah, looks good to me!

Thanks
  Ralf

>      def __init__(self, value):
>          self.value = value
>  
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4c50dc00-796c-4eac-dfd4-1eebaddc19ff%40oth-regensburg.de.
