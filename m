Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRB2PVYDTAKGQEAXWH5KY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id D233914B25
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 15:47:23 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id v16sf1074049otp.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7oKAu6PdESP3DyL4ApK3cBhxAPOvSqwMvrch91lJLSM=;
        b=Iz4yXSBYQKj9j+JrDUvOQvQ/LRcCBAddkTP7VNhK+UjKn2li0lCUSIz7iwbE7N84RM
         n+0UN1esofOKPG5oRekvsg100ggA1cVXhAJOnQMiSiKUXaDVMmNfJcRGpToC6vXNs90N
         hyi3PHYzt4ThqpdB2gnfTqlYrpHyJfiCJbR87qkYx+AvRc5m0zjB2tPdUgG/A+gXc1co
         Ue9zcuvA6fbyHaH0L0xjfyNJCJrTOJDbkBOveKIAAmHf8hpwDlnByLX0S/B3xZuTRlH/
         yKciLsue/Rb8iw55wU+Y0LObCq9UHG5hE8vjhjFrfiJy8//J9LpkCzLdnCcsj/aiwPb+
         s85w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7oKAu6PdESP3DyL4ApK3cBhxAPOvSqwMvrch91lJLSM=;
        b=T+q4XMn0mj1a/vMzvMMfBTMA2ZPTY3df9lpWls+vrf3dI5qjsqLG+ngoiFcTluU/QI
         ok0Ele/dYhQYvTS2i1QQbphxLMQNMj4ga4nJd/79P4N8mIZ7E0V8QmAxOkZ6TPqgFQVE
         vUWvopSrPDM/xLvy4UqaLtme+6IUSDGlyEPUa1bibRFmLDheJ9ecEJcpTJn+zj2jLjFZ
         vdqTwnql/rHNENIEcZPMHyp0tPXPGRFXHU9iiCDqEciBQI0zCuZDCeiDr/JBtjai+/8R
         kuhs6xjBJO/TtgVvW0HFcBtErJI6zs/ElvNFdI4d32InW3ltwPQnruBNBYDjhrYGwyHV
         qnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7oKAu6PdESP3DyL4ApK3cBhxAPOvSqwMvrch91lJLSM=;
        b=W7gT/9sJ4CdYzJ8ATy8We28Njkyk7yK3P44szY8it9Ah6jyEHJZ0AA+9HPB1/X59kV
         oglnKDDEOb7lOyQZ4LS81aTJaTRexaSueVc5BBPH7YiZD+Qx2Em/NcJ44bthXj5T8C/z
         Dd8B8en/2co6z9gn0V6MAx0p45+aRiN688tkn5R8pEs1+QvZAVMVi0/856INODmGTdR9
         pESZjv0Q5nIeDA4Jeo6aaeUsgIw7zuPEv+GQWt5slHN+z+Xffpcc1nV8Djf0luepDm4F
         sVtWAAyArbEYa8t3l1Mp+Ubv+gx4i9tT/bAt2J8oPV4wZ7ZQQT6KCzaJblaPwwpgGgTZ
         4LOQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUg73D6JPZdgzlIg3IaBP8sSmDlaMCVbom0QXwV/n7I7VIPCpy3
	8HCUsWYaIYtfY+8/DQkVEcI=
X-Google-Smtp-Source: APXvYqzscKbLtNQzOGX1r0Ji4JwWgMW5RaVY8KHLklDA8gkDZcluMsFOJVZw+i95qPXFthRmx3mqvg==
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr8060486otf.326.1557150442375;
        Mon, 06 May 2019 06:47:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:9a:: with SMTP id a26ls901702oto.0.gmail; Mon, 06
 May 2019 06:47:21 -0700 (PDT)
X-Received: by 2002:a9d:550e:: with SMTP id l14mr12391384oth.369.1557150441738;
        Mon, 06 May 2019 06:47:21 -0700 (PDT)
Date: Mon, 6 May 2019 06:47:21 -0700 (PDT)
From: jeanne.romefort@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
Subject: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1908_1535081338.1557150441038"
X-Original-Sender: jeanne.romefort@gmail.com
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

------=_Part_1908_1535081338.1557150441038
Content-Type: text/plain; charset="UTF-8"

Hello, 

I'm trying to run jailhouse on a HP ProLiant ML350 Gen10.
ACPI DMAR is available, but my hardware-check fails with this 

error : 
	"Unsupported DMAR Device Scope Structure"

I also tried on a HP ProLiant DL360p Gen8 but I ended up with the same error... 


Any idea of this trouble ?

Best regards,


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1908_1535081338.1557150441038--
