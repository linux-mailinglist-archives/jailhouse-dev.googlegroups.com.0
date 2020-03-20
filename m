Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKFU2HZQKGQEDY4JASY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 882C218C73D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Mar 2020 06:52:41 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id j3sf1793563lfe.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Mar 2020 22:52:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584683561; cv=pass;
        d=google.com; s=arc-20160816;
        b=pcHT4BKNzU7YDcxGD3zBYcobeZ3bkB6plGf3aKH07a4MhUj8axSDdy8YVUSvjL6gTT
         CmRCL+iaogHhq5EXNWMinGTDJCmFy9XNzRm985Yg4E+1KQKUt6zM1mPRUzLLLf8S8d9s
         gwbpQkG8NrNN1yySCmErxV2u1+begVouZ5bhUn9tT9OJ2gG57PmUiSvVBTcIUv4EoXi5
         GCuPPkWA0iq6eighzlwpC6LX5oQol6w1JPALm6kM1MzEkZyYEb61MexwGxYzg9p7Bvuw
         K4j2T6f7LIAZfcF803/Orm65MUdgI8GdS1bu3Y5CEKc9LB1CAHl+gXI4dcZfRx9I/NUD
         QsVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=eBMmrajk+lqdZobXO1Fgux2ZL2OgSEPqmssbFXEm0FM=;
        b=t6RXowWiPJohTYHCuAGzforLX+PvONzYhfBDoTz/KO/QjenyQgcMhZG1LhtGFfnaiO
         rX2auOQGWLerdeTdV7hPHMGN+rAMG2ZOJeCbSxs9t2WWOsmPiu16zPjWFyU2EYwEtm57
         4oVkvWrMOlCykM6W/PWKsIaT3a2A5uZCCg3pVM1vWlsXvxmcZndEub/sEZp/bh7uTnwz
         Ys4WOx4ePiNrJfVAuPWTs43Oq6gI/CXM8skh7+fzOC07r9TlRFkye/KvPBLudEigisQT
         Ou4+yzUTGBNXJycBaXxjy80i43VTVFXRqXrdiI9QmUiPZCGuAL5KWQ2sDaJIq3lcBoyP
         ZGGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eBMmrajk+lqdZobXO1Fgux2ZL2OgSEPqmssbFXEm0FM=;
        b=eVZ/xszx0Tq1xWO5lVaIKh9F4aFhYoKWxVxsiN0uoJCN5MB38wOL7Mi3IupLAcrA7+
         dGXy36OYzgqIiSYeRQHqewTzvqKEHdLFZKEsMhW2cs5Ci0cHPp/u7UKUa013Ods9gfJf
         XshIo2Nu8T5tRQtVQorI/yF1Mlev6gQbjGhpm2/tSh+pCcajm1JRxnbfqqZYHTNmIHoE
         m1pdjjBg9P7WQtJ1PgLV4Ww4a/MnSBAIn9bBWvQn0EgozaaFSHsFSH07YkJiq4Tk+4zy
         ZpMW9wvrsNrxvXsW4Y4aFuHzHoJ1iKEfB7woxQhADRB8dyTTRS1aEcYTttya3XIYUvBF
         aIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eBMmrajk+lqdZobXO1Fgux2ZL2OgSEPqmssbFXEm0FM=;
        b=RxicggL6kCvCnyE+Na76sPZOK2IpzOMhrr0b4QrarP2rsARFhs02p6Hnvg8LRZGZOR
         TI1/55LCmd5uNOPP0K7vCPavKqTZhx4RlRJpla4gTxcFyPholDO4LqYWsS/jF9Sf52hL
         C98Ktxt6eVRXkV+XOXeQOT0GNbS+xpgxGdSk0ySJzeBRY/3MxGoMCRFhE67m6chQXNL4
         fEdIueCKkt8ORHr0nJ60e+WU4+0SMz9JUGRrh6Uh9oPBpdOUpF+O60CXAkQEqubQFGkQ
         SYJlv0OnF7ZrdlRnyjHw0TQC/ZisERjBA4Iid0Ntu5Tmn4dSLxp8OckThZhJooJsSB2P
         m+1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0T/zgs09FqjsEePxA3gs2jDDVZKJEjG4ZHY40hVU8WEK4eBcqv
	Kjmhlkwp1QOwqrbs6iodhd0=
X-Google-Smtp-Source: ADFU+vtJVsWjhVfxChxgywRhlXSShOIwlQ46TlFnaRtgONJ67LObajWOLhFkbcVU+P05mbJV8Lefcg==
X-Received: by 2002:a2e:9797:: with SMTP id y23mr4247129lji.183.1584683561030;
        Thu, 19 Mar 2020 22:52:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8189:: with SMTP id e9ls845251ljg.4.gmail; Thu, 19 Mar
 2020 22:52:40 -0700 (PDT)
X-Received: by 2002:a2e:8105:: with SMTP id d5mr4312317ljg.172.1584683560061;
        Thu, 19 Mar 2020 22:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584683560; cv=none;
        d=google.com; s=arc-20160816;
        b=UDU25xIsYV5sT5Z2sJFAzwsU8chUwNXb00kEiYvxnTSAEauFK6CJGEtJBSTbZEWV4Z
         BFjFX2m0NU9Vv8ELa20zb8Bq2q5OmbfjuZauUVUswRVwKHaU9AYGoMkv6NgizZSVyICu
         B+Nb4p8urvHwjb6mLNS7KvGg4n2TyjXGAkZe+4uDpNcbtaspbDmZBzSgnZ7C/GlIKBJS
         7xhjsW9ZrVmUHsSgnIxEf6rru+40X9txOiskNoZhd1VyIqBUY1aOZBhW85l9d5pz1+pS
         MmBz6pn41U9/He2Agg4KkkrRsFci8RkoTLx9bKi5E3QG9VwMLDCRliY58heEQ1fiFiRp
         aAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Ee5vtDgnqahd7w+X4Lt/RNH9MW+yRr8b8i6NGKN3rGE=;
        b=JZXbzYh+71Lz+vNw3VS7uKvLVUGqZxI+Cg3I7H1FofXSX/HxKshmm2e5/DLQ4NmINQ
         OZTutW8jcw9FWCv5qYZlLGOJRv3g6qkqRjb3rw7lSzWde2KcgmYcsFbpHMng2ThIi7+7
         0AxkSYTmSjcc3BrPQ2cI9tLfbJDuDuVCrJRWugCWa4JJERyMcAbfELzoRL8SdzBO1Esd
         rUqFw3ZSwuIpcyG6LrEimkQF3baopjc7yc6J+FZjFCXAonLbpE6yHYBQco1548NAsTD8
         mhdYzCjZVmdOr5kzHOeULhejKswATP3sW77BYn6/c/EvWSrGN34tUjHdee5MnLwPHiGf
         5pxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id b26si289660ljk.4.2020.03.19.22.52.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2020 22:52:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 02K5qcsq010130
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Mar 2020 06:52:38 +0100
Received: from [167.87.245.142] ([167.87.245.142])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02K5qcnv006344;
	Fri, 20 Mar 2020 06:52:38 +0100
Subject: Re:
 mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb:do_dpkg_build
 Summary: There was 1 ERROR message shown, returning a non-zero exit code.
To: Parth Dode <dodecoder@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <36eac3b7-b6bc-4774-826d-9942dae992d1@googlegroups.com>
 <e680e1f1-e368-5d84-8283-47ef95e3ad80@siemens.com>
 <0a8c17d5-087a-484d-b972-ae286795aafe@googlegroups.com>
 <46d73528-b64b-9310-4a94-bab84dc7ace8@siemens.com>
 <0968c391-e1f3-4edd-bd10-9bc8665b11d0@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0015c8f5-16c7-e43f-f0e4-f163dcd3d1a0@siemens.com>
Date: Fri, 20 Mar 2020 06:52:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0968c391-e1f3-4edd-bd10-9bc8665b11d0@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 19.03.20 23:02, Parth Dode wrote:
> Yes , you're right. Why is it necessary tho to not be root when building it?
> 

The user you call "build-images.sh" with is propagated into build 
container. There, one build step of the non-root-initramfs that we 
import via buildroot performs safety check that it is not root (because 
it need not be and it might be a security-wise better to avoid that). I 
recall we also stumbled over that while our Kubernetes CI runners where 
still using root as user.

I'll post a patch that turns this check off, it's not really needed here.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0015c8f5-16c7-e43f-f0e4-f163dcd3d1a0%40siemens.com.
