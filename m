Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBLPKU3UQKGQEOGFDJTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FA3679BA
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 12:40:46 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id c207sf9124487qkb.11
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 03:40:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563014445; cv=pass;
        d=google.com; s=arc-20160816;
        b=tYuOWXvMqOQRvJMMjXXB/s0Am50YdxJ37oBSUVKCM4azYNUDwhaxOpodi3c2iQVm4Y
         Pgzy8yknUR/BjOsY+mZPwDAyTjmdH1P1XlXgVlAnug5eg43MDef49Oxl9pHhtBYrJlox
         8XXpQIqfsDRWpAyGdjSwns0t9ECOsLOWCNmX8slaojrYrGP7jQOdy7ANKR1g/Q7fG+i6
         +4/vWGhoJveVnRmEQlbUdrMUu9eAUep8mfgkuZ7G16idKiJRXwQD38KWL1DCz65leLzO
         5wWS73EPmy29XNqYY582tH6DYW0NroA6NKeArm8X7aXCd87To6tfFjHNydsy+4q6+L3K
         /WAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=DKhZYCypN7DrQp/ZL4vkDJZV1gvIEEKwx6/18ngwCh4=;
        b=pKsyrlEyXAgutAq/3k7dmDjmQsl05dSRe0nf76w5qYX3EqvXIBTJJ+x0yZLvjmWl/e
         kkklZdbggv24KMk0R1vb/M/v1AXIdsP5r/Jke/URw6M/hSFFKxRHSHjcGCBMD7Rxx+JN
         Q53ewq2AezItGehusjxmPpjih+0pnRXrxRT9rZm3g2P1x95ItJJIYc/LNzJCCmg9U/cu
         jGNuSYKdS8FujxfHWX0tHfv4Bo0TISZjFy+3AWjKXF5/VCmijZFav/9Y1TcQ0E6YnX47
         hPxGAvRPP2+nu3+AfjnRXvH6hqjh4riR7X8Bhc8qvYxP62JHP4ldlf/4LDCZuOjq1905
         bIRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=njOrzg0H;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DKhZYCypN7DrQp/ZL4vkDJZV1gvIEEKwx6/18ngwCh4=;
        b=Bdgfudip+oXQ8dOLWU4Q4HUj+bvygnLeGZyZwyjXO1mfbr1XbpUsnbTpmhUoVThnfR
         HxXQmQVY7J2CoBZdnQe3fmPaTRJLdc+hNvnfa7uHHcNOQWVph70/IS0ll23ny8AWiWe+
         36LEavmVmgI02sR9xabXPn0hgQNYrMPBtlgoo8GBJ4AGKEPwPObulG3YIJFwOtNMpPZC
         /baRdcstU7NzYe+p9Li6IwX8GqxIOiRHikn1R3VyOcvVamaqPKIx5QwjUlXBjQ2mka19
         1gqNYjL7iDkIdRsmznf6OTodJ8SatcBB10uwzJUHbkRrg3DuHTzMkma21hFZJquxU3TX
         d1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DKhZYCypN7DrQp/ZL4vkDJZV1gvIEEKwx6/18ngwCh4=;
        b=TtDjnvHN4Ah4dTVyyTtYvV+jeYwIq6MvOpFr4Gh210pkrDFps77Eke0cbs9AM4TwXq
         Nz3497zb2e70g50qCRCIQJv2+9/rt7XDHkBTYq2DFrXBSYo6LmsH5Lwy13TgPYoeM/ZZ
         ggs0ZN2yOdnF7M28Dr5/lYmKJN36eJD3h0uzt/e9P4EyJWIc6uqL3Eo2txaw7JoHacpq
         G3kgyAEFMNjr7ZqnVb6ya8Saea+syCWhQGc1pg1HyJDhMVOWoda1DD6mtN0cgO01LXQV
         S6wm+wHkobzysZFi/tPRvQunUvftEcasDm+gEukSUqhG1F4cV6Vq+Wze1+GDwBc/sFG8
         C8Xg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVc3/+/WLH7xymRu1vpITLjVJIqFQov8a+hGYKH5J/TTVTk9mpC
	VlbxMs+LpRdeGqt4gRdPj6c=
X-Google-Smtp-Source: APXvYqwu4078W6YEmdgRYoh6g8ZnyjUyqC/PURoUsH0rD0G+dakeEZ5UbfHv3wJ8I1IH7UWoGoPrDA==
X-Received: by 2002:a37:a14e:: with SMTP id k75mr9866186qke.65.1563014445526;
        Sat, 13 Jul 2019 03:40:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:228c:: with SMTP id f12ls3010530qta.9.gmail; Sat, 13 Jul
 2019 03:40:45 -0700 (PDT)
X-Received: by 2002:ac8:6619:: with SMTP id c25mr10197570qtp.221.1563014445207;
        Sat, 13 Jul 2019 03:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563014445; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0COrkMZpYqqKsB6qoXafAEgNKUTP56AeJxQi9hM+jeN2UGAju5iRuy3X24xTcgK3t
         l5l6eFZ/8r9k1Y2z5JsCdT6BRQB3QMtZ1lD8ykZ8sHYdNU0x9lX7jiIY1wCBg3oQQWg+
         8EVR8c3Ab8fweg4hjQQiIWRoSIbNxmI/1qBuK2Hnq7yuCVkV0DPWbKbZjEGhHf03IkKS
         Q84JMn8f5OnfTD044WRXtj7vDp3AFO7rhWjAhFZqHKSjLCJwHoiOjwvfS3mya0+iWOfr
         2JL8usY3zEkElzsLu4vbjgVtcYVfgbI1rC19PzBmhBMPROupzXjqcbd3Z2xED5g8q9jk
         uFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ZWhFPyy1LIw+jPKJl6IAuxT6qh7S+l0RPt6kzuKx4Eg=;
        b=BsyHjz1ET1awDvc+QUJ//b4gMughL9hB0GT9DN8hH3kAKdaZMkRmKGHddkLFi3hlCA
         R1fAKtEfKFqIxEztMveoqf7WYquh37lu0f7dXD04TKlW21DQQLAqXuzjb2WAkOkHd49/
         5e8rwC52SlQUZHHQoWctea57sTyNJ4tDUwqoLu30Y9azmjqMPLTXrMPh0fhvzuLHXXtj
         M94VoU9/ZCBebONB7LWcwVPzN/V2ycu+c1cwjzOmQGq6E/U4DGxHda0vViVhMTHKOW4X
         Jue+EVfI7USA1R4b3y3qp/falbppBLjDLE75cHnmIHSbZzvWS9bhB7nAkOEELSDIEeue
         Eu7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=njOrzg0H;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-12.smtp.github.com (out-12.smtp.github.com. [192.30.254.195])
        by gmr-mx.google.com with ESMTPS id m23si829858qtc.0.2019.07.13.03.40.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 03:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) client-ip=192.30.254.195;
Date: Sat, 13 Jul 2019 03:40:43 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ede099-9f2338@github.com>
Subject: [siemens/jailhouse] 9f2338: arm: Fix build with gcc-8
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=njOrzg0H;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.195 as
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
  Commit: 9f233898917f8c1141132606f2f2c624405d8c81
      https://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f2f2c624405d8c81
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-13 (Sat, 13 Jul 2019)

  Changed paths:
    M hypervisor/arch/arm/Makefile
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm/include/asm/sysregs.h

  Log Message:
  -----------
  arm: Fix build with gcc-8

The inline .arch_extension statements are ignored by gcc-8. We rather
need -march=armv7ve now.

To keep older gcc prior to version 5 happy, leave the inline statements
in place. Can be removed once we require newer gcc for other reasons.

Reported-by: Vitaly Andrianov <vitalya@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ede099-9f2338%40github.com.
For more options, visit https://groups.google.com/d/optout.
