Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB6WJRT4AKGQESIPYAMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 4299321582E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jul 2020 15:19:55 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id x24sf17264092ljm.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jul 2020 06:19:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594041594; cv=pass;
        d=google.com; s=arc-20160816;
        b=dsU4t+Ax8rpS2Wy5hUvLNxF/cXfFbolB08+gPEdtQAVNADxfGoltzBe/99lCLS2w92
         VcTBzxLqpRiZBmJBJ8N7EN6HdvLB2L5dGJqihM4NtMUB6NV7/CI1v1wHF/pLnWDfwA9z
         oO+L+fap2q1iaaEYsaCh+lT8dkBL7316J7cM+V4II1WQhVqS4wUDc/39MUvt3jBRRpIk
         cOynIcm/Swg5MLjglrgqte4xpslGU2oF+UAt0wr2XDiTFdUxmzDhUYdp0tDgO9wDg30f
         hMUvIyLiOa5aZrwN6SOsK5OkeiXg9yJgZXrg0oosm+9uGTbp4k0G0MUHL3F0k6gsrzFP
         0q+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=UhFzAA0fnDS8IdUfNmh2lFowjIVtq+9l9xol3jLP9OA=;
        b=KrWTdvNvaZ7RjZRWxB7Jtf+vJ4F2FIyiA0oa/lr7wuaJWmHeQBh2NkIl4fx+V3et98
         0KyD+JBtTmtcI591KEGm/srdwDxV/VIObKrmM+9LEX1bBMPbZpQFZazMKo9a6wZbBwJQ
         UK9eQNH1PLvv3pB/TcDQV6Klchg7czw3gxgKlzmVCT81jxaYfSsE6lsNVi6b0KO+kgnI
         lEZuMeeNPkyZ/nFDZaIwVkI48uLChBqslJR6Xe/xXF65JbhMdY1xHi4wMCYvkUfZPfQL
         7RE/yuprQM5rUCEAzGJTvuAjnmLgoDNVwvT062ygA58NPa5FN9SZcZQJDOHrsPkH5wmI
         BkDA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=FLi+brko;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UhFzAA0fnDS8IdUfNmh2lFowjIVtq+9l9xol3jLP9OA=;
        b=eZ0AGZ/YhBBFC3mkuTEbE+lyyjOEuOt39ONWefIJQAae8Q6D51Jk2WXofDiVRPVG5V
         bjrNRX+2rspuMcLScBRJkVUr853FvYxp3PkPuWrrgt8MplsP/fKeRQwkvrQ4Fgab216N
         vsocUlDk+rYUFYsnFoqfzOwkwB/N8udrRAtklZUeHCCZf8NgXIdP64C2eSdnOmHH97Ot
         zMZ85JxNARb4qIWjj5KO1ScVDeTZIEuogvWJnVOJLGHHLd7+430Q2XB9lBow5VIV77Em
         apZr/KAmd4i4RrgdHYxr21/p58cQhhgSk2QByexqbug0Os+vm2VN8z+i5EbILD/7NOsL
         mh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UhFzAA0fnDS8IdUfNmh2lFowjIVtq+9l9xol3jLP9OA=;
        b=Fh7pqiuHVXc93ZJQ1VFcr0uYKb9PcAYnFSM1AjfWjqMqGmgNWbJKftRJp+uNwW65P/
         L2E9CUpkgOlN2Yso2E/sBEYHDajdenxRVFbNQAWlzEbRg0hR5m3mmfTYAlYaU5vHeCyx
         nLgjXIZZisPdAGEm9Oi9mel8kIemwMnFmXyN0iefU1VuQKaPaY2eZwTPnwDhpgAb1JoY
         V++9Fr38nukObcYormyMN9IV07GC9v5yTa27wXUz2I00WCR5Rd0Yg9wHhfwYnr9QT114
         KXicSfnWeKzymMV2v2NSrdFM4mp5ZsGMZSv4c+dH49UGw6c87YuR1sF+YhdyjWVGeAvu
         7MVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530N4Zi0tg0ouPfz5/fp47sPpBcGZkve4zj7V4kLCVHYKxpCdUUU
	I3vPNNIX6VaRhS1tmsnIguw=
X-Google-Smtp-Source: ABdhPJzQQyccoMRFCqBA5D8sa3YfUasXT39FWM7sENQuPhpJ6lJjWYv6agvSH1ASUwHAm4u+tGCrEA==
X-Received: by 2002:a2e:b8c4:: with SMTP id s4mr26610002ljp.374.1594041594793;
        Mon, 06 Jul 2020 06:19:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9190:: with SMTP id f16ls1230068ljg.11.gmail; Mon, 06
 Jul 2020 06:19:54 -0700 (PDT)
X-Received: by 2002:a2e:9cc8:: with SMTP id g8mr13077532ljj.460.1594041594158;
        Mon, 06 Jul 2020 06:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594041594; cv=none;
        d=google.com; s=arc-20160816;
        b=FftlTLbGct98nF4LZXKeW+0WiNSeUW7NqNQYPbEeOqEy5lZedqzfreaykUwWsoxUL0
         r/xdbJGTzqmZaRpke8XEtmgZUdWyZgOtYsbonWy0PhHfwpG1XACJte8IktdMf35+HOvz
         +ZH6pOY+Jl0bwzMJ4K3HCq9k/AXQMxhGh7YSn37zRgHsyOtwr1oxp7gEza3bESgyTCGf
         C/ZgNVBBQzMLKSOht2eoE7QLrrHaSR581AE/ayUf+glofOvT1u8vafQ5EpCA89an+Jhy
         563nPRPf6o+ZdTeRWTvtBaOdkAWb5c8hiiqa64RxL68pfGCfpvUtlqAEGtKzyCgZj5hu
         KctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Km6wleHa8/E4dS3Cvey2UM2yXYa0X1TN3c5GMekdgek=;
        b=NIRBIJfgyp7Q2RvJIW+0LcWlfMOU4+LCam+IH2WE2nIz2hOrze785qF7lmDXHDLlf3
         0YdS158PgXHiJ6bUXEPkwpgyFNByxUpwol+E2gaWQwXxg8tIhfGkPinOxgDA5upgKGYc
         uDIWZUO2MDwwKaJIUmIuyqNmIyhJ6M9QCP9htKdKtWjfU3tE0cYKNW3d2e3QYu7GFd5M
         vvBlyx1bCZhonuuF5zYRxnWks9AdeFTqIJ0RR7VXDE6rFMZ2XPOk+Cz0mWTWGgw/zqUF
         /Cxp04NRWOsPXDWy0AkeqerPhDVTetXqlnlcHlbQsiOjXDsPoJme+jezOqyGARMRhIDb
         Eqtg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=FLi+brko;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id k9si1503439ljj.5.2020.07.06.06.19.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2020 06:19:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4B0mQ12TspzxvQ;
	Mon,  6 Jul 2020 15:19:53 +0200 (CEST)
Received: from [IPv6:2003:e9:af0c:8700:e9d:92ff:fe75:492b]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 6 Jul 2020
 15:19:53 +0200
Subject: Re: [PATCH 09/11] pyjailhouse: config_parser: add missing components
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20200630064730.7210-1-andrej.utz@st.oth-regensburg.de>
 <f36fe810-3cc2-9fdd-06c3-90863f4b5702@web.de>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <4ed47956-d2c9-9f35-4b09-633a2c07b0d7@st.oth-regensburg.de>
Date: Mon, 6 Jul 2020 15:19:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f36fe810-3cc2-9fdd-06c3-90863f4b5702@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=FLi+brko;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

On 05/07/2020 23:07, Jan Kiszka wrote:
> On 30.06.20 08:47, Andrej Utz wrote:
>> They may not be used right now but will certainly ease the usage of the
>> parser API in the future.
>>
>> Besides I already had written them long ago, so it would be a pity to
>> withehld them.
> 
> "withheld"

Ack.

> 
> While I understand and appreciate this completion, I'm concern it will
> simply bitrot if we do not start to use or at least test it soon. Any
> plans in this direction?

Yes, the grand scheme is change all Python tools, which work with 
Jailhouse configs, to use config.py. This would, for example, allow 
config checks during the generation and prevent debugging-by-crashing 
from the start.

But I agree with the sentiment about bitrot and will not include these 
last three patches in v2 but post them later when they are ready to be 
used. :)

Andrej

> Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4ed47956-d2c9-9f35-4b09-633a2c07b0d7%40st.oth-regensburg.de.
