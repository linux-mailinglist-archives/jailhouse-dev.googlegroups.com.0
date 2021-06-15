Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAFJUODAMGQE2M44PZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E53A8666
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 18:25:37 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id q26-20020a19a41a0000b029030eb7c42df3sf3891200lfc.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 09:25:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623774337; cv=pass;
        d=google.com; s=arc-20160816;
        b=B/jyPpcXooVV8G4LmCTyQvEDkI+KwKXZO9etqimkkUTdgl+bLfhOJ69Kv4mWkOu+2u
         +glYC37DzkqDQ8sWsOJciupxOnJWw8p5DunofBKwNZ0JMHPoplb/HVHabFR+1yYBQA4/
         K8O92VisbY5qU3elmwb6NVuR8o8PPiIxBucH65H1j5niJBycQD9EKQHKSn9P1G36JPMp
         BJczFAFIxE7tiAV4jHH3oFZHuAhcmZtb7lcaY2XDke8ddzFtR48JiKtG1v5Z2DcHf7Fk
         tiljq1VIGfulCtnPxoGzUSJOGuDlvrmb/oLf1cUSh6i7vdRvEj2BXO1Cu5hLFs57R4hU
         tBTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=A/zDv3dqFTCvSCOP5ifL18dTt2HgwjbRtHSv5qUg02Y=;
        b=BOgkFTkhPDFcFd4U0w19ABcVTbgHLAYL/vDJnJqsU1/wj+lJT8IzdIqbvM8o5Ht6dY
         /OGxDoJu6QXiHhW4yOFyNmek5beikCL6laWmtgWpmEgHZxJIzxZO1HS97+qpBvUjIu88
         nLQvNPC2I5RwAKdPKoviYD0BESJZ7dTG7dmzgbZpkvBYn3ancoU8eWx8zf+Ryvk/qMZb
         l6C2Wcqj7czFGTfsUJmm4SOWmldDcTEuRQFZzjMnbB4KAJ2nydi3M1JyB522LifEIiAb
         pEagaMbSUYR3ikNyFSW+0oZopwPzcLSOyrqtjsaLYaGO7Jjl9HTnla59JwkKcj9JueFY
         tTRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=UChfQxGZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A/zDv3dqFTCvSCOP5ifL18dTt2HgwjbRtHSv5qUg02Y=;
        b=O+Bed6TghOntGMF3Cg3MlCRl7myLgNhhOLrZbqYKVPqyoM8fDU7ZsPc0YrIaI8ipb5
         GRJIeJFWSbn7Nskn4kwQCVzus41hI986BISU9NxZy3Spt6igyLmlH/UVnd7omUQJrhlX
         6EIevhCM1Lx7ZXr505HaphelPJRDwj2S+2GpXQAiikv5xKHF67JjzqI/CfeAOX9T7JWR
         DFow1rbx5q06QW0l0dwbOCqiNvEiEqvQvgqv01aHycFc37zbky3jwzl/M+Hu2RtScchN
         qik5ETn0H+Ipl5qxKcuUb8NW78AJSQJTuWVG0He9ZaxkEsh5GkhR40yx932Vp7dsQYzP
         /VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=A/zDv3dqFTCvSCOP5ifL18dTt2HgwjbRtHSv5qUg02Y=;
        b=ni2OdtX0Oe4ibLL2UPcgz6szEKTVWSkLTcIEwzs0ydX+Y/etlVEAw22ZCUOmuwnD8c
         iFce065DVn+wrxx/RyZzfcXDTKU5ax4PSM5xSrD0bjVndJjywhl85Bs4EQqR1m6olFNN
         SjTutkWatFH6e4PgnSeQvVpjtja5tzYyf7o+LzCmGxMTD1u7A7PFllJ/q2dHRhOg12l9
         M3kj4a4kSVLc+dTd0ui7enO0NLh8bKQPPen8qHX5/7MLFhAC8aUXkXL47FT0sA9Iq0kB
         DNBD2Cx/Lz1HefVvTS6d+3Rea329jsrXtGBNIgxmRZG+Zz8ncgVt1DXYtAMAj77C489i
         L5tQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530J14NPLY1Qw5vw2vszuyJwamD+3ZcdNHtgMKM1f40VpchcK2ax
	vhaAuZUgjBTDCrLfXeBiC/o=
X-Google-Smtp-Source: ABdhPJxWSwP8TcT0i5+T3qoMSKTE0HhRalbSuh6sYm/aFZJkjtqJx4iAD4SV1omzQYKZRhdVPxXFgQ==
X-Received: by 2002:a05:6512:c23:: with SMTP id z35mr139116lfu.549.1623774337109;
        Tue, 15 Jun 2021 09:25:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:39d:: with SMTP id e29ls4650855ljp.1.gmail; Tue, 15
 Jun 2021 09:25:35 -0700 (PDT)
X-Received: by 2002:a2e:908a:: with SMTP id l10mr381747ljg.160.1623774335873;
        Tue, 15 Jun 2021 09:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623774335; cv=none;
        d=google.com; s=arc-20160816;
        b=0LdiXZv6bcsnnejzdcTDhg+vJHlAk5mNELnbtthQ0TvsNKsSO1uCiQoQefqQBvLWSi
         O0gV0tKFELT8rWxlqr8gGn3862yUwl3IRCaueUWqlqcNQkiofQ/fCl47jQzT9L1/5XIe
         PROzSqnENXDCdLxSO6GnevX2eiio7SOZn/2I33+h9Jgwhp8zMxJ7d/xB54lW2hkIe7o+
         FoWMo7ALsdZuEz50a+uhqG0+5ZQSsmahIBKrrH1m/fqLoVM+Vn0Y6LTtrpnTlShNwsoa
         RraljACEn4lGotILGrDTsOVc2nI72UCi6Wk8SE8jASG3R4SQKTCLoLBhVXanpqSx94IG
         RbIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=KJ+nAPn/ueBTH8ylxtNidrSXW55OHblv9IUu3X+JI9Q=;
        b=SNZXJkneT+E0VLwOWNy0Y3OhvyqsU5nx1BGXuduoxgIbNplqaAPlYD9Ef3Md3SQljY
         33NOGxc8GA80YQvI5kTisPCb7VDVyU3+DMQGLRlnnps0dXaI2+vFbzJ8qGgrEBYm83qb
         k/64k/7NLusc9Pr/6pcVKF7WjXvjM4EO4gE3NSS+bmeY7k8NwCl9bdIqy1qXlecIMS24
         zkJ881ba5FWo615u2Ivb5E3aVoK0nTSovn3BjrKlcuLkvT2Qpbf+IMxmQj7U79R8zWdL
         QzT3O3WN97bdD5ZoMAbDEXoEfZa+jcBK7H8cd8MWDfl/g9lzkTdQZ0A3Mwf54MRTGiN1
         Bctg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=UChfQxGZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id b23si130618ljk.2.2021.06.15.09.25.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 09:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4G4DFV0l8Szy0M;
	Tue, 15 Jun 2021 18:25:34 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::d104] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 15 Jun 2021 18:25:33 +0200
Subject: Re: [EXT] Re: [PATCH v2 3/4] tools/scripts: Remove python2 specific
 code
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
	<jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
References: <20210615093225.162909-1-florian.bezdeka@siemens.com>
 <20210615093225.162909-4-florian.bezdeka@siemens.com>
 <365e8552-76ae-f78c-d786-de6d41ecf161@oth-regensburg.de>
 <3f18f978-83c3-d9af-f8dc-0f00bb1e2bd7@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <89c6f195-39b9-557e-761f-d12e6f3fbf60@oth-regensburg.de>
Date: Tue, 15 Jun 2021 18:25:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3f18f978-83c3-d9af-f8dc-0f00bb1e2bd7@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=UChfQxGZ;
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


On 15/06/2021 14:24, Florian Bezdeka wrote:
> On 15.06.21 12:44, Ralf Ramsauer wrote:
>>
>>
>> On 15/06/2021 11:32, Florian Bezdeka wrote:
>>> We are now calling pyhton3 via shebang, so no need to care about
>>
>> python3
> 
> Thanks!
> 
>>
>>> python2 anymore.
>>>
>>> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
>>> ---
>>>  pyjailhouse/config_parser.py   |  1 -
>>>  pyjailhouse/extendedenum.py    | 12 ------------
>>>  scripts/arm64-parsedump.py     |  1 -
>>>  tools/jailhouse-cell-linux     |  1 -
>>>  tools/jailhouse-cell-stats     |  1 -
>>>  tools/jailhouse-config-check   |  1 -
>>>  tools/jailhouse-config-create  |  1 -
>>>  tools/jailhouse-hardware-check |  5 -----
>>>  8 files changed, 23 deletions(-)
>>>
>>> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
>>> index cad761a5..7a7f48a3 100644
>>> --- a/pyjailhouse/config_parser.py
>>> +++ b/pyjailhouse/config_parser.py
>>> @@ -14,7 +14,6 @@
>>>  # information about the system. For more advanced scenarios you will have
>>>  # to change the generated C-code.
>>>  
>>> -from __future__ import print_function
>>>  import struct
>>>  
>>>  from .extendedenum import ExtendedEnum
>>> diff --git a/pyjailhouse/extendedenum.py b/pyjailhouse/extendedenum.py
>>> index f3dd1bb9..9d6043a4 100644
>>> --- a/pyjailhouse/extendedenum.py
>>> +++ b/pyjailhouse/extendedenum.py
>>> @@ -9,18 +9,6 @@
>>>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>>>  # the COPYING file in the top-level directory.
>>>  
>>> -# Python 2 and 3 have different ways of handling metaclasses. This decorator
>>> -# is a support layer for both and can be removed once Python 2 is no longer
>>> -# supported.
>>> -def with_metaclass(meta):
>>> -    def decorator(cls):
>>> -        body = vars(cls).copy()
>>> -        body.pop('__dict__', None)
>>> -        body.pop('__weakref__', None)
>>> -        return meta(cls.__name__, cls.__bases__, body)
>>> -    return decorator
>>> -
>>> -
>>
>> Did you actually test and run jailhouse-config-create? I guess this
>> should fail, because there are users of with_metaclass that need to be
>> addressed.
> 
> Yes, that was tested. But as it turned out there seems to be something
> wrong with my local test env. Generation "works" but output looks quite
> funny.
> 
> As I'm running out of time I will no longer take care of that strange
> Enum type. I will resend v3 without touching ExtendedEnum.

It's not that strange, it got strange, when dealing with python2
compatibility. Using Metaclasses have diffent syntax in Python[23]. The
dance was required to have one common piece of code that does the same
thing under both versions.

Could you please check the following patch:



diff --git a/pyjailhouse/extendedenum.py b/pyjailhouse/extendedenum.py
index f3dd1bb9..799f8c62 100644
--- a/pyjailhouse/extendedenum.py
+++ b/pyjailhouse/extendedenum.py
@@ -9,25 +9,13 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.

-# Python 2 and 3 have different ways of handling metaclasses. This
decorator
-# is a support layer for both and can be removed once Python 2 is no longer
-# supported.
-def with_metaclass(meta):
-    def decorator(cls):
-        body = vars(cls).copy()
-        body.pop('__dict__', None)
-        body.pop('__weakref__', None)
-        return meta(cls.__name__, cls.__bases__, body)
-    return decorator
-

 class ExtendedEnumMeta(type):
     def __getattr__(cls, key):
         return cls(cls._ids[key])


-@with_metaclass(ExtendedEnumMeta)
-class ExtendedEnum:
+class ExtendedEnum(metaclass=ExtendedEnumMeta):
     def __init__(self, value):
         self.value = value


I think that should work. Feel free to add my Signed-off.

Thanks
  Ralf

> 
> Stared some minutes on that "Enum" but unable to figure out why it is
> implemented this way and where the difference to plain "Enum" is. I
> guess there are some python2 specifics I simply dont't know.
> 
>>
>> Thanks
>>   Ralf
>>
>>>  class ExtendedEnumMeta(type):
>>>      def __getattr__(cls, key):
>>>          return cls(cls._ids[key])
>>> diff --git a/scripts/arm64-parsedump.py b/scripts/arm64-parsedump.py
>>> index c695706f..54f4fd66 100755
>>> --- a/scripts/arm64-parsedump.py
>>> +++ b/scripts/arm64-parsedump.py
>>> @@ -14,7 +14,6 @@
>>>  # the COPYING file in the top-level directory.
>>>  
>>>  
>>> -from __future__ import print_function
>>>  import subprocess
>>>  import sys
>>>  import fileinput
>>> diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
>>> index 6d1743f3..a1650912 100755
>>> --- a/tools/jailhouse-cell-linux
>>> +++ b/tools/jailhouse-cell-linux
>>> @@ -10,7 +10,6 @@
>>>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>>>  # the COPYING file in the top-level directory.
>>>  
>>> -from __future__ import print_function
>>>  import argparse
>>>  import gzip
>>>  import os
>>> diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
>>> index 4c5289fb..7a634212 100755
>>> --- a/tools/jailhouse-cell-stats
>>> +++ b/tools/jailhouse-cell-stats
>>> @@ -10,7 +10,6 @@
>>>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>>>  # the COPYING file in the top-level directory.
>>>  
>>> -from __future__ import print_function
>>>  import curses
>>>  import datetime
>>>  import os
>>> diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
>>> index 62db24c3..d6ea7079 100755
>>> --- a/tools/jailhouse-config-check
>>> +++ b/tools/jailhouse-config-check
>>> @@ -15,7 +15,6 @@
>>>  # information about the system. For more advanced scenarios you will have
>>>  # to change the generated C-code.
>>>  
>>> -from __future__ import print_function
>>>  import argparse
>>>  import os
>>>  import sys
>>> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
>>> index 2095f4e2..c2cd5952 100755
>>> --- a/tools/jailhouse-config-create
>>> +++ b/tools/jailhouse-config-create
>>> @@ -18,7 +18,6 @@
>>>  # information about the system. For more advanced scenarios you will have
>>>  # to change the generated C-code.
>>>  
>>> -from __future__ import print_function
>>>  import sys
>>>  import os
>>>  import math
>>> diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
>>> index 7a41b48e..fc8ce4f1 100755
>>> --- a/tools/jailhouse-hardware-check
>>> +++ b/tools/jailhouse-hardware-check
>>> @@ -10,7 +10,6 @@
>>>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>>>  # the COPYING file in the top-level directory.
>>>  
>>> -from __future__ import print_function
>>>  import mmap
>>>  import os
>>>  import struct
>>> @@ -20,10 +19,6 @@ import sys
>>>  sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
>>>  import pyjailhouse.sysfs_parser as sysfs_parser
>>>  
>>> -# just a dummy to make python2 happy
>>> -if sys.version_info[0] < 3:
>>> -    class PermissionError(OSError):
>>> -        pass
>>>  
>>>  check_passed = True
>>>  ran_all = True
>>>
> 
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/89c6f195-39b9-557e-761f-d12e6f3fbf60%40oth-regensburg.de.
