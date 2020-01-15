Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFOJ7TYAKGQEPU4N5IY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6312713C657
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 15:41:26 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id v5sf11624646edq.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 06:41:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579099286; cv=pass;
        d=google.com; s=arc-20160816;
        b=aRr24Q6/cR7Zlkvx09BMGFQweH1cSUtWzUjpcFOnZtB/6hHJU1Q4W5EXmBK/xLPL86
         y8gQikgRUxDU2PdHLtxlMzY5EWORmtoSLieoh01i+x2SlCg2sNKbXF1zWYZK0cdgDX6F
         ly9qASp2JGtjhd70bhRKxtKdfqdjAoDh6ObJ2q/7cinKuNVIixyzEwRe7uE1iKJZzGjT
         Pdya45X7aVu3JhLMirBd5JH7QqpdHLYo+V3etRdtVSlQj81ufswlvJ+/HrLWRD8iPain
         ANQY0sMp6laekdENh43L4vHUVb17uPxF72IdTpIjhbqnrimrjhVuNlHbWhdYSylZca3G
         38RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=1egBtVirAK9TVxld3E9SwjEEKYttHeXzqsnGxzA9iIU=;
        b=RSBleWJTUxzbSU7lCc7tmtLw2up7vbxJWI1yO7YVY7R4O2Bgv4ySEx1B+tdzoY9iqm
         IGFFABR+OovgsnGtRGmZeqXxnlQ+yzpKhDZgNQfEDy9pHyzDSiDri9Irrx5X5RRbZlYu
         CAguD/ktehn+ErARa2r0RPscA+L/UTnAEzFI5o+Eos0sJedd6XcAPGMUwLavnBdtCTqe
         I6Tdr2bC23dRH4d/wK1nvUWGtqhLw+1opKhkmWP7h03CCYri30rX+SYV+m+EjjVtrj+w
         kYC802uEhkexKXYw8J7CfRfU7TH+c3BJZQH6GKm0qD1BNLnuEvJHgBGZyO9hK1qNE/Sg
         WAQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1egBtVirAK9TVxld3E9SwjEEKYttHeXzqsnGxzA9iIU=;
        b=GMGwPLh+R4TivoquY3oVrthQrik5q0JR0clStTAx2w9eN9Q9O2ICzV4Xlrs9fJGGX0
         qZVp12g+IWcVWcFtGC9KFbk2F527LUMy9F0R/8CxTODUfT4tPBcI0YgRo51Bsl0Cqc8+
         4y+5XwFT/3LJr2rDUTFdyX80ETDfsX3WwKzB0r3BxP5Wcd01t3H16r+TrQk/2DeA0hce
         xAIuOY4xrU3kr8kcKuJIUtbRiKc+jWbsfMKSXX7gpzWW5A2y5sCL5ShDW3BrZ1SFt/fW
         HjHtAUqy1kPUAEWqiVv7sfVWOEUt1cm/hXnIVCI9pinFa95GXIs8orqRzAQ3W00IkLd5
         LWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1egBtVirAK9TVxld3E9SwjEEKYttHeXzqsnGxzA9iIU=;
        b=h7cq3+my9tTM56z3avMqvvENxNYgYkzOX0gdAU3MCmrkMOMWubH5cLYnxKHyyMY8v7
         qENu7JN3RrjLrLYygCmFrNSY/XwrZvp2RfDPWbHqNRYrndeowAJoveOLQ1oUsN0MCSQa
         kAe+LPkg/kW7+9eVJMnsWNt5BdPgEmIpHbwxUtNTaAIz8Jc3NPDG3SDSMybYxYfL/l4q
         q2q+l1i5X+5H34tdz75iUnxZ2Jk4dbuzU9jxiivD2wa58qtZwb9WyGZ5MJ4TXjyOymdP
         kLfEqZZgn0UTm1rO4KbynpFyOR1Y/Q3kvrc2gs0lLPboP1QmhaGo1W+fTqjMMzVCfkyj
         cUHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWUBRpeZuOt0wV2IBOTltFdcGur+6CYkp7BD18wvQkj7AWg43cd
	HBkhta2an3fBbiApkNNt5OI=
X-Google-Smtp-Source: APXvYqylmNcUNP2MkGFHgR0RT2XWeoKeLRtRW45VriXLhzTf3XrzKhKMW4dTaSwUXWnZv2zBJI7DsA==
X-Received: by 2002:aa7:d853:: with SMTP id f19mr27610937eds.319.1579099286030;
        Wed, 15 Jan 2020 06:41:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:bfe7:: with SMTP id vr7ls5398623ejb.1.gmail; Wed, 15
 Jan 2020 06:41:25 -0800 (PST)
X-Received: by 2002:a17:906:c444:: with SMTP id ck4mr28712736ejb.224.1579099285269;
        Wed, 15 Jan 2020 06:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579099285; cv=none;
        d=google.com; s=arc-20160816;
        b=RZvA3wsbOu4lUDVMUXGAk7DLJSGXW2hlFRWQpJH+oT4DjquDGQ6TETSpLVgEU+x9OG
         pwHiWqivPGV1M6QmHrIAHylL/4dsaL/XvPT2dJ8U15r2JKMuRMvPdhsZrcXZMqJ34lXT
         3xt9qrPrQ3tROs4+dIpZ241RB01g75dIKCr5ya/JO0ZTsV3z/K6YHY/mdkpyrHba6SWH
         LTLwD2ByFkKeTXQPj+MKRIebXpi2H8FoubVqxCAyhRYI9NwNTN9GRcYBzvZvQ7ymb7Iv
         G9zj50o0J9Fnzz7KhPcXBuT/9zZFiPD3CMn46BQIYtgAli629qM5yRprobWc0lzIhcTB
         GBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=/QKdxifsjnTy4Qq6i3kU1eiNlJ/5aFj2EjDUr7wTBsE=;
        b=co0zRwfF47v5g86J272OEyBkW3QMsm1Qlxsx+0Q4DSx/LarmcgPNTNmqxWxvPCIYss
         afu+4OqKbT1DXrV7H2LyKbFUg8a1psig2gaG8+3V8J0bw/dJiol6DT8b0BTbvVZZNwai
         LYH7w0Mmip6QwzE0IyqppZUGG4zo/iUilx3PILd+2F/PXJPp6oNBeFzfB3gxWXT0ZUvG
         ryhbTF39JWUZu843iDN1nKEjhPbJ/sJBiDg9N67IrAsiJ1C9rDDdmauL/GZAdSY7XdOf
         DvUJA2BxAgEbvVx8zZM8/96/4tgOA2RCbYJBcTDivsQJh/MEt8auZ3hYF9Klh2jk3Hf3
         WImQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z20si738746ejx.1.2020.01.15.06.41.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 06:41:25 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00FEfO5A015956
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2020 15:41:24 +0100
Received: from [167.87.12.136] ([167.87.12.136])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00FEfN2S002013;
	Wed, 15 Jan 2020 15:41:24 +0100
Subject: Re: [PATCH 08/19] arm-common: Provide vpci_irq_base via Comm Region
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <cover.1578320435.git.jan.kiszka@siemens.com>
 <8607243c30ace3c194d56ae9b3f0273cced0bf1b.1578320435.git.jan.kiszka@siemens.com>
 <03a4d22a-ef52-a348-43e1-d2237a74e7b7@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e2368291-9380-acf1-3da1-7347595842ce@siemens.com>
Date: Wed, 15 Jan 2020 15:41:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <03a4d22a-ef52-a348-43e1-d2237a74e7b7@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 15.01.20 15:24, Ralf Ramsauer wrote:
> 
> 
> On 1/6/20 3:20 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Allows bare-metal inmates to find the base SPI number of its virtual PCI
>> host controller.
>>
>> Increment the ABI revision to conclude this change as well as the
>> previously generalized vpci_irq_base field.
> 
> Hmm. And we lack documentation for the ARM specific comm region ABI,
> while we do have documentation for x86.
> 

...historically. Yes, we should update 
Documentation/hypervisor-interfaces.txt eventually.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e2368291-9380-acf1-3da1-7347595842ce%40siemens.com.
