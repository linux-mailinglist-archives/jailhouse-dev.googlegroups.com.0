Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWOOQH3QKGQEPUSB6TI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 979231F4CA4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jun 2020 06:53:46 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id w27sf306083lfq.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jun 2020 21:53:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591764826; cv=pass;
        d=google.com; s=arc-20160816;
        b=WGdU+sPXuLsSpwxXl275awLqny3VzCQy6lXbAHgdodhvZ3VnHdTIii+tGnP+PLn/EB
         KSJs/6+mItnZb+Brx3NksliqzezQ1b9ZUAkwLxvy4UCj/0kiVP/VfFMKjaS71jmfBm8b
         sP2b9FBdgKUJZfm0JLHz/d9bPl1msrcPoVQU+18SC3f5F1Hh5HJ5ygXyzsbkYXJ5aSaZ
         yKbbBsw/OGl1YEZzmMP7P74Xy8sWwCa0AObWjgtvCuYN9lURH8Wk6EV3XlgHxc9qaLNu
         xE6aPScfpnEEKI2monZ29yiEsdbTvlWqnPuBj9qlPv0QyuoU32Ix83IdNijCe6R8ojQ3
         XSwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=imPLJkbszylX8LabK47+Xd49qvhFOFF6ylsKHk8gw4Y=;
        b=FaI9aCWeXeyUKIkMaWiMQe/zU+L8OAa4jlL+mDFjC6h/EKJyBBQkEE3sgOx1ygDHi2
         MBXY9SZlNE/htqFdPE4sOhKP5I8RSLJtE1w+GYWyJa2l8faCcnq174PTxJ1JRTXuqvoS
         TdNcjH616Nuw+YUv322DXw69JJvf89VRzXhAByc+XncC+sLdXpj5+H+CBChYjBq1mwn3
         yz0dE9bU2cQ4VNtzzjWTzeS3stibZgSm+8cSW2Dryz0IaokYsI2/AMmtz450EWD6FPk5
         pNxlxe3KDf58wyBPhFJjow6sM/jEObqZxFAyAo2QicSZC4Vvn0HPyZ+hKxExX6lePyh2
         zxbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=imPLJkbszylX8LabK47+Xd49qvhFOFF6ylsKHk8gw4Y=;
        b=FZfRfwQ8XkLUX53V8kxko4KvxIW5iFNdwvYGc4dBePikYhLobk7UKNLCxAZHRGWaKS
         bwFOH25vb4MCz2zOPbjQqO+2254NsEsBbXeiGLaD9a3ubDKg4tYncdF4v+xbAdRM92SJ
         F8+Ef7VwrOyenKUwavaVGPFOiHqn3RLglJfC3y3QH9WsrFHJ/nisVfVqDiDiSsSx68oO
         MhnGpH6jiyKs3WRASFhylMtA26cG0YstDMTtyN1tsOLGYE/jazKKG9Y579f37aDOLnuh
         GVxt9EzVybPmnSQW7028vcVY6ZngQWxA4JN8l/hw+OT1QDq3pFTYuz/BxlWgTcZ359iD
         yZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=imPLJkbszylX8LabK47+Xd49qvhFOFF6ylsKHk8gw4Y=;
        b=U/+MXl8EiOHSUkPxZwKaMcJvw7XnFWt/CWCwDq2efVL8L3jrwDd+FO4XurEqNWBSM4
         ZgYOvv8kY3y27bX3MNjnAcR6Q41KOEqo7V+ns+z8wK5i1ZN5wshl4ekdl6M/1HJDFjij
         hbYOyNvn4DqZNdlr+wcpZkPkY/RKDFaEeo955UPgUCBZU+41tL2zGbAVf2jCQAA70m8u
         2aiQV09Wa87A7J2JESeMmHcv2yFNuskWwpfGVg5c5HYyde0Zz+5pUzIisIreRIcIaEv1
         AKl1mjQzYGxXIBy6p9KJjT3MA/fX+Ysts26ZCEOvTcrQb1RBVdj4fOw8dGM5VlYZg8EQ
         6nMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530guisL5cUqBs4CueNY1Uixp6ywxCLxvcpGhPE2lxUiveUSNbOZ
	P31s1BQEDl1yD51+k6iZrWA=
X-Google-Smtp-Source: ABdhPJxMl/hoKPHWDESE7esi//jPvTvUzKfV6S5YJkbX3MVnUuA957Bbzyi6kUuskGGGBTZ3szMmiQ==
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr650797lfk.87.1591764826082;
        Tue, 09 Jun 2020 21:53:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9718:: with SMTP id r24ls823958lji.3.gmail; Tue, 09 Jun
 2020 21:53:45 -0700 (PDT)
X-Received: by 2002:a2e:9987:: with SMTP id w7mr795520lji.242.1591764825073;
        Tue, 09 Jun 2020 21:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591764825; cv=none;
        d=google.com; s=arc-20160816;
        b=FjZ87a0mfQ02U0e6DmEme0Pu5krTZBtr4nJnOtJBooEYyq0gAh3OG0wQ44u1BXyiwJ
         6B3y3StdCNF1T1rP2DQAOvZMY7Ky9HLPxNheay56GdwV9WyaL2lXF4lRXthj3scaU07N
         gQ59+XzxfjbJ9VIsA55liVoAlVaCCAe8RYxh5PZxPAvJHRIuMvtWF3od+swrhm7pbfvW
         N0pt+JdVbpzLBYqFYH6XlL7vz2pFAb2hFFHZenKGamtHTc9+FYu/VZMXXhQuQRHdKvPQ
         ayWNNNKzlDhBTicSpAGZOnh1g17o538ydXFy9O7FaKVMY1ip0M+1DbnWhP1wICAyHhGS
         gscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=gLyHB3TD+OygqhyJOdl8OpIleyXphSKmnw1prllvhg8=;
        b=myD/lAsVRfA5VwGrGXi2p8MiNcRFhp5nLlPX+9gPAN7okL2UKZdEGrxYjQR9RppByG
         UbDq/99HUPoT3P64SbTPywMB9SvtwAVuwtkrN63eBtIv8l+ZUylfpPjn/biLZfvcD4N7
         uQL/hCkcWb5VlK3m1qlJWDOxrhQ995/yztF/G62hdcjKEffwgwfbIfh2iWTp6urr80x3
         8/vDjpkM/OIJQJmMw9QcexZoxp+6TTtlgytVNKKkWg/2CUJS2X/Bn9q0RftZBQm880uQ
         Nvk1Xi+heDaXVSkgw3yBd8RLsazgcKvEP8/sxL0HCYQQpw/GDm2cBliOIW6IIl16kHyP
         PCqg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o10si859877ljp.3.2020.06.09.21.53.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 21:53:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 05A4ri9i016100
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jun 2020 06:53:44 +0200
Received: from [139.22.36.66] ([139.22.36.66])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05A4rhj2027710;
	Wed, 10 Jun 2020 06:53:43 +0200
Subject: Re: [PATCH] pyjailhouse: config_parser: simplify signature checks
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20200607213226.861989-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <493a148c-39e1-5a1e-cdb3-95df8c64faf9@siemens.com>
Date: Wed, 10 Jun 2020 06:53:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200607213226.861989-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 07.06.20 23:32, Ralf Ramsauer wrote:
> Just a slight simplification, no functional change.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/config_parser.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
> index ccb5aaac..6b9d9066 100644
> --- a/pyjailhouse/config_parser.py
> +++ b/pyjailhouse/config_parser.py
> @@ -158,7 +158,7 @@ class CellConfig:
>               self.cpu_reset_address) = \
>                  struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
>              if not root_cell:
> -                if str(signature.decode()) != 'JHCELL':
> +                if signature != b'JHCELL':
>                      raise RuntimeError('Not a cell configuration')
>                  if revision != _CONFIG_REVISION:
>                      raise RuntimeError('Configuration file revision mismatch')
> @@ -203,7 +203,7 @@ class SystemConfig:
>               revision) = \
>                  struct.unpack_from(SystemConfig._HEADER_FORMAT, self.data)
>  
> -            if str(signature.decode()) != 'JHSYST':
> +            if signature != b'JHSYST':
>                  raise RuntimeError('Not a root cell configuration')
>              if revision != _CONFIG_REVISION:
>                  raise RuntimeError('Configuration file revision mismatch')
> 

Applied.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/493a148c-39e1-5a1e-cdb3-95df8c64faf9%40siemens.com.
