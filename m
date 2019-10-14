Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCGISLWQKGQE5SUL4RI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB4D6774
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:36:26 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id b2sf10073864oie.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:36:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571070985; cv=pass;
        d=google.com; s=arc-20160816;
        b=SVOk/BAVeZ6XwDncK/wlTnesm3ANb0dZMSJ5IEx0wVBlmfZLASIiMcxHTiu+DwRTqH
         hM0gcmIpoHQqZJKTrrC5UKYRgyitb9veusJU1x+5A2004hqb+GZimpIJbQ82JOyEyUo2
         WVu4nTwV12zvM/QDD90wYfEVSHTpoaWc5fa+uCP2xEc9nc3sZkLy7jFGWM0JTkcIaQod
         yXw/dO/1aSfyjaqdRDkvB+jkY7CRWIUve8T83qQRpr2GkMYqRp2PEOGoPRU2TaMKmWL2
         9HnT69Qec/9y+zh0ofRIGV1RAKfLBVDYk+Im9D5Pw9P7iX3V9SgRr0IHt7/XL2mx0jTb
         OOmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=90iz4KX9woOZVFHBXRFwTOOoUQWFFrES/yDNxjLfrGw=;
        b=eiKjokJnh5n4XcuC49cupQWR8YSxt51ARvIB/5cyu0w9s63Z5d15U54EoGlF3seB79
         mvZmkKnOxXUISFA0RNDSzNXn27d2WS7gUTu6JOdjMM9zjlYtQFe2eJTgnU8h6YnBD+tA
         XXM6ZlFyVhz1Tg1cmYUFWTEmrM7IgTi71uOQmrxW36/ikLZVr6IWhmPL/chVBv3WJise
         wVFqHf4FrD7i8ZtEkN9K3ufwl/TVP7XwlJOZo9E7fZ1KFjiWmh3FrvPSGvw8wTqUHusx
         zq9PyLR4X3ttQMW63aH/PQmOQ8SnNH0refOLYCOQM2rngALMNShYu7CGe0WK6tnElZoL
         BEpg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mU0Fdc8Y;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=90iz4KX9woOZVFHBXRFwTOOoUQWFFrES/yDNxjLfrGw=;
        b=smBBuaFpAsYJy6OBQWRCxPrgR0opFRs2u3FZNyVs9w6kmLBEBf1Y39vioWddPb0TTb
         sRUU6gIN81F619EWIR66vSRXPupVPsMo+HMs4k78+r/AApVB3h0eH4scxAWWPYuMsqrU
         kitLsMLnoZgUx8zH9ZTOqwqyebBAD6PzuQBWqlM1kHRCNnUjxZJllOYtXaO2J9px+w14
         doENobVYcz5SEdpuHFeeKWDGOQA3ymcW7qtJOVg89tLVPDphAGsMittxoJuvgCvceOrz
         MzJRLhZ98l8pQy8hN82P7Qsvvk9PXmcAEpfd/Y+JrWP6Fruvjjy1NFMhZ+AKmmm7Ty88
         jHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=90iz4KX9woOZVFHBXRFwTOOoUQWFFrES/yDNxjLfrGw=;
        b=lIaj58gon3M9ZLvF8PhZshMXFUfuBLCAhqSMc4hjJpz0U33/L6OlEYRNYKTLu+bRD2
         7yt+6hOiEcXEhgRxvCaOUJBj89oUDg5pWpJ4kyOrIafFslWwtv+IM41fQ7IsQQHMH5tt
         t5zaYCVz/KAsFLtkhCyJkgRMrAEyhbTzfVAI+rEpuIV9JyZFMsq5JqeL8WnIsS43QtXS
         0ihnc2qJcHLMTiWxb6WLP4UpscSdmCwcqrZqJpAFIgSS1y857vCf/OTLpw2hf1/xX846
         tYqz6ZQSaK/x5oJVZG1ykQTMNV86KaqamKXiZ3Wv93HzVOOzfn16o9g/vB0kxMeXpFuo
         yXqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU6Q8vcFBFqm3daoxGywvvPb9MTsU3RB9P8Byc0p/ud7EJOfR1d
	qRjUyzt17/fjul2cNDSAezs=
X-Google-Smtp-Source: APXvYqxKK/qcvHBac1NVSosgF8su3KzuN29pHfb/USLLX6jTr3eiIQOnWeFm3Z3pD1LtGzkw6fODgw==
X-Received: by 2002:aca:75d5:: with SMTP id q204mr76220oic.147.1571070985303;
        Mon, 14 Oct 2019 09:36:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:53:: with SMTP id v19ls2731348oic.13.gmail; Mon, 14
 Oct 2019 09:36:24 -0700 (PDT)
X-Received: by 2002:aca:d90a:: with SMTP id q10mr26171721oig.129.1571070984645;
        Mon, 14 Oct 2019 09:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571070984; cv=none;
        d=google.com; s=arc-20160816;
        b=DeIK0VY3SM5eoVEFZUCxe24OJWdx8b9Xkn3B3c8gIcNg/N6ePp5aTKcBP4mxwUfWoQ
         VjytTVavv4Ahy9O0xAJQ7XIxU8gD3r9j8KcqhE2Rv+56RnM/E9s7p2XDrkOxyiFEJ1TC
         SLuSgsaA1gKj0Zt0Ay54ucpjF+GILZ6lsl32PuJFiHuoHAqhiS8sxxkfcOYNhjriu5zC
         kt8VAxwMu/M8G2pla8MueE+9Gv3tmWP3O8bgVHpbDlUZlTieVDGeC6k7Zuq6OJfW5PS4
         ioqF0UKq94OyvDjTegRo7qeVG97NAQp1/HGAso19KJ3uN7qdempyEUpuZMr9Z4aa7/hF
         6naA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=G+UPRO+SBrw8tFwjFXL3iqfge8blt027ZbrkkjqKIEQ=;
        b=rq50GYLWbeUCWeuoiW1VTJxLzmRa/ONsvqVn2QXk5ATEhLGvllUm4TGXDGx7d4zWNf
         zrIAljFyX8AYJGfbinm7fU9iRxUHPlCw3/b8j5pItEsVLhDphtd7DN8fQyz6rrnPmSHm
         nXiGngbmHyr2mDSvgknp6VfJqHiRIzKtu0p6mGsl8sGglGwYTgnwaR37DtUuoJHu7dD/
         4CajAGdMBlIZfVe3/MkniirsE90PaOMEFn58lNjnOPD4AEhHvks8JvAh/2WQxx3LJQJq
         6ho7Cda9zPHJtzueZlkxIf8zHe3IlwUia9OAEAceHu6BOisX313Gc2SrZgLhuy+X9eIG
         cOww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mU0Fdc8Y;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-16.smtp.github.com (out-16.smtp.github.com. [192.30.254.199])
        by gmr-mx.google.com with ESMTPS id c136si980776oib.4.2019.10.14.09.36.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) client-ip=192.30.254.199;
Date: Mon, 14 Oct 2019 09:36:23 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/90e8d6-8863e9@github.com>
Subject: [siemens/jailhouse] 8863e9: Fix typos in CONTRIBUTING.md
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=mU0Fdc8Y;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.199 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 8863e9d830a938e1904b8d842b29d29607ca99f4
      https://github.com/siemens/jailhouse/commit/8863e9d830a938e1904b8d842b29d29607ca99f4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-11 (Fri, 11 Oct 2019)

  Changed paths:
    M CONTRIBUTING.md

  Log Message:
  -----------
  Fix typos in CONTRIBUTING.md

Reported-by: laysan1509 <laysan1509@mail.ru>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/90e8d6-8863e9%40github.com.
