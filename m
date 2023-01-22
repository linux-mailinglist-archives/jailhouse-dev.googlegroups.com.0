Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAM5W2PAMGQE4HZH37Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2F6771E3
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:06 +0100 (CET)
Received: by mail-ej1-x63a.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fsf6429381ejb.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415746; cv=pass;
        d=google.com; s=arc-20160816;
        b=KJZBz/S0yrg8JUdRbKc9q0sKsChnIag6VjzjXVLJ+HrpVRXKSGmwpYKdJ9oLOLuWzp
         sU8xw9fwoaZ7qskxQj2+F3ZVYm270Knu3zr3O/pA7C7sEj0OhFB90CYdElX49stiB93W
         GOPku+VbB+BrKk7ept4xbI+BUx+KO7+nBCS4Y/NkLlTRHxYmXWEW1qn9QA4EQ9GEC1Ao
         /QKH7l0QeElxbaePVjQRnRrwa8G8mmxuDGhGotX9pLBxcX7YfxTWi927lis2MPND0CnN
         QvJPayptG5HB4/FCzZvS513wWZdqX+zqSkX+EkeQNZ8PuPat75e+XbV1Jn44zw/1ePMk
         EUag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=JoFsxq/1LqMiSI8ewi3WbGZmgA2IY20PRyFzn72xyg0=;
        b=X+25mkXi1Dceqq1iPhmILS3XgCevlHpyZUvYLODRmaJbgGmpfFh+0dMZZsSaQ2c8Ff
         CahhbNaomjIc5ica2to82/qYZQ+1hzsdpac270DEqzPwwY83PHkMpBCf8t1mWIs8brtr
         h4QhaNoe6XQvk0wkPmDRjOMt8kMujLwbSTS1nZiF2ESZ9YmhJ6ecEwXGm4RaxJulcM4L
         9qBSvIKBl6ld3EsiQU6TW3yqfOZnlWp0fm3HbIP0ygnK/BDubFnAdnsehT9R/kTdv0pC
         P3Id0nFpWv0jveqNR48i0eJTX/mZ8FOdzsFeNqmxnF1/0XnBaXIZHo2oZ9NkTmyB6MJ0
         MxKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=J7P5NQ1r;
       spf=pass (google.com: domain of fm-294854-20230122192904f08dc76002f31569cc-tmkby5@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192904f08dc76002f31569cc-TmKby5@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoFsxq/1LqMiSI8ewi3WbGZmgA2IY20PRyFzn72xyg0=;
        b=YknIeZ8SGUPt1IRNhqjRQADvL9B4xTSnMhU2/xzvlV2Xj8GCvPdLOr902NbTYhkil6
         rVDmdZJny+nnvSIBL52EthiswIi7MMpSqVjO55Aaq00RI9hhDlz5cn7g/tY2XZbmJgO6
         VEDnPO0trif7KYELyjXm5aYEyoXuBP+AINi3ia/KJdaTbyR0abkwBT5Ja7E1YQ7G04eP
         ZfPbB0wiNL+xFzWFBG7tR5imgcX5hpo7xxLt9TWH20UO+fzP/oBlJ1USoWx4VqH2xq0g
         J7NWgbseA/59onxhRYxLZZbpCWjOxIJt1AypQ4RDsfpt4F9rVnPb1cW3avWSiyPsFMFl
         swHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoFsxq/1LqMiSI8ewi3WbGZmgA2IY20PRyFzn72xyg0=;
        b=Pbe7xHqgi777Ns9SL+EywFbp+LQ4fQwV+ttOf39Kd6OCl4lG3FuJhgwJKkHEC4SJTM
         QN8gk7PyQTvxzBM4s3ywY/TiV5Ww5jBBmAEfCmB73sfgXkTmU/qhjFIkDF8floCKw797
         0Z/tNF3h5w/DLzaCOKt1h9vptx7Z5/keZfthRjV/rnrW1enbCWeif53ioB4R5iAXtcdk
         k4/WS3kTcj06TVEjM2cf1XSjY8tlgFEHnyEdZXnNq1fqoeXQHmgNVsEdr2QUHzENbaER
         6iFLrE8+oWX28a6dm+BJuA3Ri6hrZOnCMWIqJwMm7wPg4domCzron8qN7JHcxzH2JU1B
         4c9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kp5/XvoIbMExlyCcfWZjwabO+4p8ylDzKXZk7EYjKXaDz6ZWxAM
	ONpd1pYsnPnkSZfH7PRZEFs=
X-Google-Smtp-Source: AMrXdXuNiB0ZG8NsO6JDMPE1YRcoebNl5bbpkqmetfYEASKopTj9Vpa9+jpyDpSbICsAHqGZMh9+uw==
X-Received: by 2002:a17:906:5f96:b0:86d:e24a:5db with SMTP id a22-20020a1709065f9600b0086de24a05dbmr2580758eju.113.1674415746101;
        Sun, 22 Jan 2023 11:29:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5617:b0:7c1:381b:406d with SMTP id
 f23-20020a170906561700b007c1381b406dls5855555ejq.11.-pod-prod-gmail; Sun, 22
 Jan 2023 11:29:04 -0800 (PST)
X-Received: by 2002:a17:906:dfe9:b0:84d:378b:8820 with SMTP id lc9-20020a170906dfe900b0084d378b8820mr38992655ejc.18.1674415744796;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415744; cv=none;
        d=google.com; s=arc-20160816;
        b=zbWl2oRL6tGJV4nM6dKQlcFS5aFKUObOM81AZ6AOi2kroFvkGowJqVUskBtg6zYGjs
         zVxMa47UxsPG2Vy/RNG0Y0qgAp0a5NlJUO9cNQ86x31LZUo2aK/8JFN/1rPCpzwD15Jm
         Rx6x7dw7pQDxQsvRh3InfwnF+z5HXSnijpFmeiWSDJmYNrpPgV3E0mJMs0NRXcJ7Z87M
         Tmgm6k6Oy20tJcoAgifTnDlOydyqY2nJBglTjmDuIQsKRv5VaEih/tSvfB6Trz5HVXzR
         JmazcK2J+fgxv1ADO8+khxy245LOK8mqEfedeYd18U75p8DiV1TpTI/mvWB96TngwdyP
         GKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=7JqLAPh4qta549WvwTSALGRHMByqt/t/12ATrtUmom8=;
        b=WZnupekvNjntwk+3AS87ZzDTEmnSC7LMSrWEBKFJ3pMzk0P24ms57OK289VIkPolOx
         /1dn4vnk2RdsJHHvYuUqabt7d+tYK8P71RIaMFfbj0jzwmcmVddOiIoALCpDNzkNm3Ot
         N0rJBnKbmIdkB7QKnztaJ/jOhYnFmVZFNTAp5S++iSnzxjnw5OhJWcm4geAHNkvlDLVi
         sDCyaiLrjSawfaWMjzpHe8b8m4gL/GP/1bqZbPGJUGJ6mKKQpyJ4kqkSK5JnAWk3ov+7
         CYLrbWoQhlQCWlTs+xZxDVIFb6GNbT2Jj73pDNG3ReKwFxj3iHB1PtqudrF01YEfPyja
         Z1sw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=J7P5NQ1r;
       spf=pass (google.com: domain of fm-294854-20230122192904f08dc76002f31569cc-tmkby5@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192904f08dc76002f31569cc-TmKby5@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net. [185.136.65.226])
        by gmr-mx.google.com with ESMTPS id k20-20020a05640212d400b0047014e8771fsi2007424edx.3.2023.01.22.11.29.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192904f08dc76002f31569cc-tmkby5@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) client-ip=185.136.65.226;
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20230122192904f08dc76002f31569cc
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 13/14] configs: arm64: k3-am654: Rename inmate demo
Date: Sun, 22 Jan 2023 20:29:00 +0100
Message-Id: <7e740eaf303c22664a0ef6bffcd229c8d40611cb.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=J7P5NQ1r;       spf=pass
 (google.com: domain of fm-294854-20230122192904f08dc76002f31569cc-tmkby5@rts-flowmailer.siemens.com
 designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192904f08dc76002f31569cc-TmKby5@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

Aligns the naming scheme to other targets and makes check-configs work.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arm64/{k3-am654-inmate-demo.c => k3-am654-idk-inmate-demo.c}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename configs/arm64/{k3-am654-inmate-demo.c => k3-am654-idk-inmate-demo.c} (100%)

diff --git a/configs/arm64/k3-am654-inmate-demo.c b/configs/arm64/k3-am654-idk-inmate-demo.c
similarity index 100%
rename from configs/arm64/k3-am654-inmate-demo.c
rename to configs/arm64/k3-am654-idk-inmate-demo.c
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7e740eaf303c22664a0ef6bffcd229c8d40611cb.1674415741.git.jan.kiszka%40siemens.com.
