Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB4PMXLTAKGQEVOTGKXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C713EB6
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 12:09:54 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id r48sf9015003eda.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 03:09:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557050994; cv=pass;
        d=google.com; s=arc-20160816;
        b=G8Dnnsm8GmzQhDWLnTiTZTZ+Eq8rdTUJUCWSAgkTFnGkA8S6e4wxyNo+H2oW3eZfVw
         rxvybslIF0Zlk01TYkY6mh7WRjTt3LixZGMKpS6FFS6nHARFLulEgV1u3GqXM7rmlJy2
         crh7eohR2hr/hRaJEe0QAynCiydraBcffbzuqROOtp8ZaNk7Fb3zmHw2ShDQElH8JKiW
         6Nje9Kk/Xp3V7x8K9hqXkWDTaGgxn7uNJ5X5ADtzvxx4aEuUoNQElQNKojHYfpyWcogc
         2JgCLugA4JKd+Mx7e0ktMJNjHIvZJeSlvSwKTtPzmrI+L5iVMA0bTGv5iFo6Np7v2+Vz
         qf+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=hcTaEK3+1aabArZ1sd+QLK3DzZADVbljUw30Mptz9rw=;
        b=RKboLVg30XIkqDgquIrm/fzIWmOSUcObB2kmzTZrFpQFd6JvWnl84a2lbPqUY4KoFV
         UotQbkrvB/WjYqD/75BznsLlNNKGutCrBBV0x+X5KlSL8YXS57JvUSWiYWbpn58VUHv6
         IBQvx9ej2nLi+r82QheGYD+G9BiJzG7Z0Nc701MV7bc86Uqyl1KFIpm/IiJE+6VscxIW
         BFE1RJlC8oDYEzwL5xlnY+fzsxiAki2R4+6gIVvxb/OLuezQ+1GofKpiFpDGtMECJUeD
         aRbmbISb3jFm9IyiaoXrPhQDOcCButitMpkf3f5Q8oDwGUvVqELNpydfTcC/OdGxSAXw
         zpWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=CfZnx1eR;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hcTaEK3+1aabArZ1sd+QLK3DzZADVbljUw30Mptz9rw=;
        b=tnYHJuLtY5sn8Q2EDaCBgdZuOYMazHa3OPyeRC1LpjFsU1tyIpzMgFEvZJTnWfkgFI
         RfU9ZMYEuGTgz8vNrnXpUgMbFSs7oP+CZuvdlT/CRkTwPH7V0GiZmeBzWtAvNAVSbP/o
         mPg4qn2NAU8JY4L+7zikkspZaebE6pd1+1KDsbNc8PqVzg8x0blYFxLSBOoKaltKdQUe
         PiXnb3KbV6tz7PIzHegCmPa+hzA3CECHZBVuBXjvvlrPgW/9+2hdIK3Af/LmoKZ8APj2
         tSra2HufR6a5smX3Z9nXkvlwelyMgVle323wzjt4ufQfgGo0Xt1y+OQBobGlSOEedcaH
         7oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hcTaEK3+1aabArZ1sd+QLK3DzZADVbljUw30Mptz9rw=;
        b=nlnY+g/X5CZiYF9VMQOfREXwXr1OiUQcyTRrF7v2+UOA0tT0Xqluq/IJfPMbBTK7Vl
         Nu4AiGbqs9CGWow9YUijy4tqltCK7Kk5q3n3sEQ1iptqwJGnDuICD7deXe2tVOf6wQmK
         90fTIyTypNwKraGv+UBDVG+6ajU5Y4Yddx1p0nlPIwBKpvs7jakJnBYTB98gRsmwDaZ0
         yalGOxZ2qOSYK9I/8MIFMUT6H9vSFxwFeut8HqDqBuFr6NStED/qKukhK0Rn36pPkFsT
         ehNxzJaXJ51gczEQ+WSoygn2ie/AoieV97xtLrnJSUQAJoMKLm1dA1pcpI7p6FH0Pgbo
         tNDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVo0IebeGw1m1w0Fxb4iQXHZsD5SWftyGKr0yaw3kpw6Sp8cvHn
	ISnMWEoS0sbfc8r28LcaMn8=
X-Google-Smtp-Source: APXvYqzNMslRtHMEI5VZNYOQfBmJxOXHs+QuuNRar3Q/hQVIMdvId7hT1pUkb4c4eLhuERopciFC3Q==
X-Received: by 2002:a50:896a:: with SMTP id f39mr19286127edf.293.1557050993948;
        Sun, 05 May 2019 03:09:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4553:: with SMTP id s19ls1248550ejq.10.gmail; Sun,
 05 May 2019 03:09:53 -0700 (PDT)
X-Received: by 2002:a17:906:890:: with SMTP id n16mr14173086eje.28.1557050993423;
        Sun, 05 May 2019 03:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557050993; cv=none;
        d=google.com; s=arc-20160816;
        b=TrVBSxnBNK5VVchv1/ldh0hcQJORzANh4AFXzK2bq8zp4zhZZmES8To89+JuJjjXww
         lk4b2SD/cmJKr/VAB4KU0wEY536VjlzofrfbJEI5PoR5E5RcGM69rHjhJbEciVR51/9J
         Qj0uivjldo8OfIUvXol22EEgPajPKxJ9EPoCz0tPYxf5RdR0bmPuu1vBOqul1BlYIPne
         0PkCW3JoPSOU5Rt9KeU2X5lVgCJVsWlCXnT8rMMQyyI5dzETdaoxKgWEmhOv8qH/0TY7
         sOtf9eNvIlOYFZLHWQp3I3L7mO+VTPRZP7Nwec4VAHN6rfDnG05/5Yzycz33dcdSJ0Gp
         sb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:dkim-signature;
        bh=59IW9tAAuLPHAesxHqJDDEimIgrBWXR7PPrpuRbLAKw=;
        b=Le0Wd0DeHNFbaIlrVMjl4vp7b/Ekh8S7uS3fk/MABRhyERYLNcCTYQoNN+juPz4WzY
         3gGhbNqK/MJ1OE8FkS+MZSB8sfgKaPS1z/P/w8n6lQTdWSbVZZhwwuVS6nCUb9V95sGA
         skTSRQWHoP1zitH1FVXTF6T+svh1xPGXCcAw+UrdHEkxmjakVA0+bMGSc5IZBfsZJ8Cd
         yPHdD5U9SXCPi5R6afGZSjorlL6xxsry2ZsVEf/GMf0BAI+BYuj8g5YwP9/rxiO1j0n3
         Pon15TkC/2gRVXRClLN0Kh2jUrX8zDr8gnXWK2oheUhbQIqaUBdL69mW8KA932TesiFO
         kdlw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=CfZnx1eR;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id u16si232865eda.2.2019.05.05.03.09.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 03:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MRkyX-1hCXtJ3Pjt-00Szf7; Sun, 05
 May 2019 12:09:52 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH 1/2] inmates: apic-demo: Plug race around message evaluation
Message-ID: <9e743f60-c26b-4576-44b8-3290be26a9df@web.de>
Date: Sun, 5 May 2019 12:09:52 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:wc7GUQdjA+JfDmrteOYQxTjHE/YTLaqBNl227MoSXMkxQIMnG7E
 oN+pPoh70YhMW8gnZLhDJeaWFjAsnSrj8rTYnIW+0jgTmqcA5db8Iw4ImfN3+aRTHQT6gdl
 QeG6pPZSd6XLf4Ttw6l4Qess8d3BHucvQ98ZvwS1eCCUszCWhUqnA9M1h6dFkdcdEPl4vG7
 x8+2yHe34q1Xo/JRQ6x5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oLmFAzO9syQ=:VXTvRdGte1c5QhGuaXTxE2
 nay4PV9zzM8iiAA5df8ic3J3Ffw1RetZxxV8cdQsl+UWvRj4Mc3f9Q4Z+QbRQX9FjAEuhW9zO
 j/og/BoU7N1D3GruR5tTR1vRiwqDrKUmcvQRLM5palp1B7QAuqgDLkSay8M3snpFrAkCAD40f
 5KHWgEePSM+Pt5ngAKCTK1YdzbpsXpGii2QQmEiEBb+0/mcYbysaq4KkdkKalaPCWP8oiaj7I
 QNDzdZ6pAxl3bVpHHCGlUUNqCXI8IZj/8oWxBfr077ExyJaHVOBMbuKE/9PFmPaiCOnSwmfaE
 ZPscqZmLJ6vQGNCwuRcB+Z/+1QHh5M0a4c2qECZWYR0p/VWOZeJ66+n5nGnDXbPMO7UQXHVYC
 7Tj58La2RmloexYEM0xEgJuZTXO29TXEcj56sJQEzAHgGqN+g6c+pBRR+LEwVnQ0a7wpGvVtv
 Xkq9spMJuXUq2t/OK3pb+9GI2L7kxp2QJxj0GqD1Atg390iAP5UZ5IFTmTbHvNsiYN7OgBpHj
 +RMwXwjgVRrWZd034Vn/TgZTEFuThT2WMd/J8OCgrnO91b1y4142rypGDdT7rdDxceLfi40hj
 gc0knqMVNQoEb1zLs8kJyg7xmF6pSkDre3+JuchqPXymjTGa6SK6CqxUP4JmDEDbihtTMdKKL
 A6AvaNg51hW7CZp5A69qkrNbpLDMOCo/u1sY/xH8dCNqI5pfvzYMgSe85UmsFZ4Rm0ha66rM+
 Me3U9IX8omWbJuapORsZmy0SMoN4LLC3DQf55otA388pQgeullHoaheg8M6eYREM7laiAEI4d
 vrOJIxq/eJ+FBFxagdgCoFKsWvgectM1IZ9Qqb+KX6kL+AvcBsg0uAIcSCiJWhcDqJsM2Q9Tt
 yE0KQE6Bvi6BoVl8AdZyUxKg8BEjj4wsqbMs/hs7nX4LYJcQHu0SPzkgsFVKD/31TAEWTWUi2
 CW7daAfqxNw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=CfZnx1eR;       spf=pass
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

If msg_to_cell was not JAILHOUSE_MSG_SHUTDOWN_REQUEST, we took the
default path which also sent back JAILHOUSE_MSG_UNKNOWN - and cleared
msg_to_cell before that. This created a race condition with the
hypervisor trying to sent the cell a message. Due to the hlt, the race
normally didn't matter so far. It will when moving to polling-based
idle.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/demos/x86/apic-demo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/inmates/demos/x86/apic-demo.c b/inmates/demos/x86/apic-demo.c
index 920fbd71..2f3a6070 100644
--- a/inmates/demos/x86/apic-demo.c
+++ b/inmates/demos/x86/apic-demo.c
@@ -147,6 +147,8 @@ void inmate_main(void)
 			} else
 				terminate = true;
 			break;
+		case JAILHOUSE_MSG_NONE:
+			break;
 		default:
 			jailhouse_send_reply_from_cell(comm_region,
 					JAILHOUSE_MSG_UNKNOWN);
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
