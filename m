Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBUVZ43YAKGQEZGXVWQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id E5539137DBE
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 11:00:51 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id g11sf2895161edu.10
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 02:00:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578736851; cv=pass;
        d=google.com; s=arc-20160816;
        b=fM/wGjfZT2+L4TkZMnFXYC7O9UOPA1yIu/7IPZ7Zd+6U+OBXy02KYryG3RZgpjwvdA
         HKNsl1Os6TyCuq/PKyKac/evc070DUuj0UbMbGuVrtsk3Ju9xn9o4IIkUcpB3ziu22qT
         lvST+RDXGbZ/2rxXfz+1p5SOuBWxseK4ebyawe+/GAzRPFami8iPxMyg5MOyE2j+7W+n
         HwrlmKZtQRKWM9y0eQaZL9SLHPmOq4fSFTv+fIS2Oz7DMQlklannnf8zuVYayRjTviRN
         rzba8B8qQsxk5hOhohVtRKTXI6aWyfTj/UW3vzXjYQA+iLpTOQN7TihJCiJKhW6RmKrZ
         VjzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kWSNPRDn67iXow3hHca6CW+ob1O3AOqhqpJ/meBt/xQ=;
        b=t+SwerdbbLIzSYcQ09otdsjstaGSeK3Xh2HrQisnHBLqvFQLtSgwpWkJu0HKn8TAut
         yBMygxAM5aVCMXzDp8AMGqEx9qykFYJpNpRsNQ81bMW/VkduxI6nxijBVG+CNshg/tct
         6qmjSmyMma4t+Zy0rw3zq1PCgTnO62O6wr5oabhBdlnJyuGYXiwqxhSMvooIgbzzbolV
         vGFepUsu0pQFcXqWreTmmzwWExjbnMlM0zZhcN8O3/6VBnMOECnqhdiZWnWqT1FiSCZP
         dTdZ5PVmdYMXvZz4B1r5w0PdKoDkpWSsqHqIJwHlyY5YEvGNWk5F+k/D3OaGGxRpn8KX
         vEzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=n8NqmaGv;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kWSNPRDn67iXow3hHca6CW+ob1O3AOqhqpJ/meBt/xQ=;
        b=ZpqE14gc66EuuN8bdVhyZnaVxUpZ+zWiDi987MsyeUeLxUM43Br9TwA/1M0LTGTlNR
         xZwFQI+5pF7XSdTQTdZyx3oFYP4t+MGT4qLNomLNGh1E4jKIAN1K6/2iMc3XEkdZi7nQ
         7EOQ25hPtx7g/2vyy8aiPVPaTcxhSvO/Ak4AftkSK/+xxTOXr1OhqXI7mM9/o8Ciumz0
         NjtMOPavaS8osAnS63We6Vy59sH3d+VBENvjDW4DZESC/638KdXFDho0wfTO1R4jgeYi
         ZIrrhyvXP5HvW3a0TcgS2+lVw4ulphEhFWv7o/PUKGeoNhzlwElz1ogE2+BmlFFVH410
         XhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kWSNPRDn67iXow3hHca6CW+ob1O3AOqhqpJ/meBt/xQ=;
        b=QeISVwfOccPmGVkuXIRI9MaTOfcFK7JGQs+ZsW0eNNjxXaG5eswoGq1ZJekZ4rnTSB
         3DK0UsOcNKLh8l5vMivx2Cv7HzyrPanmB89Etc/K0fwpvmsCQ/zT8OVO9VZeU8oSWt17
         UZYM+t5a3QYs8itKG0p/mA18K3gIKay+AFsWbM/Clg+Iq3kilFzoQnB3fmCUeT7vdJCX
         b4SghFreFXOQcTnJ9T5HiAwoaT5NpjnM4+c5YLd66dCO+Q86n/C6ABRH8kg2K/QngwDy
         MDlGGSkqNKYyrsynHVG78xnm7a7B+nMY2MLcpf5WHQ/eDl79IF4rO9SL6pnqrZ1zBZN2
         OHdQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWGpwZ1TK3yXrzjEfJCx1BWBKpsVPopcP0CaS1CT6vL9iyq5F4K
	pGUueK/rK7+yy0ip5M5RErk=
X-Google-Smtp-Source: APXvYqwrJdtZUHoii9pCL5dcSIeCDlfCbpRUxyt8Lyv8fyy+9Zi/qrnkOpfjVgYuWTzDhdkdW9wj2Q==
X-Received: by 2002:a17:906:a398:: with SMTP id k24mr7417507ejz.210.1578736851093;
        Sat, 11 Jan 2020 02:00:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c82b:: with SMTP id dd11ls2144368ejb.8.gmail; Sat,
 11 Jan 2020 02:00:50 -0800 (PST)
X-Received: by 2002:a17:906:2cd6:: with SMTP id r22mr7328796ejr.313.1578736850510;
        Sat, 11 Jan 2020 02:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578736850; cv=none;
        d=google.com; s=arc-20160816;
        b=nG7QLab0ykD4rNlS1DydglT5YY8sYsw/CHS4GdwaVtOpl1ExR5v/5huuZk3gK3O8h7
         Uj0DD4I7hsWf5oZBIrm+HqEU6qsRjtP9wTVHxLsx3oyeWO662FW3vi70mD6N4+Txq+f6
         +/5vhILjvTyhEEClGUBphrPRL0aZicVADFz0NpkSM6EkdNp8gJkrW/EP1ht/v05krdT0
         qDGzieNOWe2JB3yTvEg3SNlEjvI+zv90BU9JfzhGc+hmX5nAnh4T7ViEU1bhTJysEuWr
         roP1WbjsaiW9DuOHUU8Ad698rG3Towmvq6bnHX4Q7ZJ6GYobSReOjyt0EZHzlMPT7UkJ
         QY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=bbAd+934qe7Em6cmyGW8Erob8EUVA4GjlgZIJYb5kuY=;
        b=qqxRMniBApeL0fhjw2qpbCyEUsgkItXWFNZJ8BxzJm9F1fy2D+8WEWNkoRQlZWs2eN
         gA6Ox9GZ1p0GhZZbbWEC9K/nFND3FkmhuDmeEWkYPmiSmizKU/jnaKIPBoADhpKFJKcW
         H+J7dA7xTH4XmqPHCCmAxTMFRqFgQL/bnqvzpOL2e05NbbN2e3uFwAq9V0i7TNaVRIkM
         M3glJ92KfHENU6laPJWh8IVEfb20lt54W9Xu3sWtZnrZ2aVxgvxJT+fdAEvf5OD+RDkd
         IeCMMB5AsIKiU6xa9yvVnuQjGWCcjm3CTbplpYS+yKhdbuGT1gF7ANMH50ybF3aTGVwa
         yCzw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=n8NqmaGv;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id w19si261574edr.1.2020.01.11.02.00.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Jan 2020 02:00:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LsQ9o-1jnZQv2Nq4-0122eJ; Sat, 11
 Jan 2020 11:00:49 +0100
Subject: Re: jailhouse-images/wip/update does not build (incomplete commit(?)
 / rt-version broken)
To: Thorsten Schulz <contact.thorsten@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <46455211-7834-4791-b623-6c7278584b83@googlegroups.com>
 <343f38b5-4fd1-4bcb-89ca-62cc577b3df0@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <f89cb542-0db5-d16b-48b3-8fed270e015a@web.de>
Date: Sat, 11 Jan 2020 11:00:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <343f38b5-4fd1-4bcb-89ca-62cc577b3df0@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:i+RJddo+9TzV7+QSge02cLM50uiVkRV251lH1CXQwGtaKnZPb0T
 ZmYUbKcRM+lCcnrT/vhMWiwXcmU0yt4xpx0wcnAv0CLlQTAL/N7JgJj4dYYlmrXzeOq+PxB
 MLJXObsFX7y0qELYbLz89zaWD7ycXoGSI0hkq1FDaF6MwMm+B4nVZIeNx9p+HfNFSTX7iwb
 Mj1SO9Fgq/mpzSwR03zIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8vlPC4Tm5vA=:2wYoXz5wTviZKjo2fbijn6
 bqQoKvTBwtlXZvqBIgKumJXe7f9JL1EIBblD6oQVZhGnr2wMDX9shD+E7wpCqugfhHRPyc+Ke
 cu9wTntVrhyCGX1ZbVa4FFHgRlDFc30dItCqNjWgOktkz/9x6KSlHTxn6sYKZHeAJara8m51U
 47GvJYSfPlbO8raZPaXnEeQNUQmPIqDzAoMMOyGp4UfNSKL/by7azEqnOvelK3FknnqVFZK0e
 akOd8UyH5CJvgTxgDgaJp87HaSBGCEN4TCVoSTyskQ2U8Vue9ta5Fzhvr1WahHRP5nVz8iTx8
 76bymufMDsPxznD1pVaCYHs0qRFbXJgNKuWzPLaELPxzh+pQSPBcWkfR6yi5byzNJ29vv49o/
 Ssil0xwj6nbQrFmERjJvPVhDPjT2VQcx/Pm0S1asgaWaB/mDtdFrDD5QQhcBNlqm/pNQYFmJd
 ABLWNexzVdCiIAQmihQmpBgxWhWX2SOnUIpri3Tc2ab0/k13XcQl2XRmG+j7NlBkNxNzp8AfR
 1n2kV4N6UWuqHwXtAwMn57RXyQmdeag78tc0+4pkF/0txB5FZBvszSMf5se/Qx062rHvzMiBN
 5c5koaFNW/EKL4Ujz9urfwovZ+F7v8MtZPJNeH1xK1r4u8goUEecETosWZv8Q6eJY34xP5cTw
 fEAMWkoag6CW5MOPmw9rhaQgoldI41lFk8Lf29I5WcruSd+d2ZxUshGYxEoCNC7g4QuX0oQxX
 UXxkuhwXkyvdq2422vNbymzeT+UxCJ6g13AWu9V/SMqtIrzmvf5yFw3rdjwm2bi5LeZ7au3Ij
 CySsemZP/lq5g9pQ+eHHPKiI4wTOUMMkIzBqT2tMz16n+xbGmcONa7iaPZ1sczUgz2992q3pC
 IG/plYr0mRVS0lVb9uDn0FfNxb4Jm4F4K3r+vGZCNZIOEtS822zX+wKx8g0PgDNCmB4R/6uyV
 mgkWtPpTt1eeRJSpb28KhXFuiDZG5D+ASf2iN7VrW9ngpQWZvll0XZ51zTNvQ40NhGUJNOg4Z
 onZGaBWZ+a82zUYsinJ+vVj4ZY6pvtx2EVPebwJVdMcXrVO1T8i3YjYQn577y1+1ZOj2N0q/Z
 CCUnG7KZe3gUlgdroEAOvoH4T6LgwqoWc09pGrlCm2A2SBocI1A4Bhcx8k0FLgaWkyvjo9900
 Tkq+7rmjOpiiymk+zIpVfAvh5GGE9LdPPydmkN8lAFxXa1/wB0Rc9JGHQACt5+YDq+Inh3BSP
 3J9zZoToNzMcwoLzeF4QssFx4WYA9JgRXhXIQEikotSSU8SqCCdGyEPTYZs8=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=n8NqmaGv;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 11.01.20 10:08, Thorsten Schulz wrote:
> Sorry, the 2nd is issue is on me:
>
> I should have had a second look into the build system. When on the
> *wip/update branch*, one explicitly has to call `./build-image.sh
> *--latest*` otherwise the newer patches to the build-process clash with
> the referenced older stable version of jailhouse. So, after I had a
> second coffee ;-) ,
>
> `./build-image.sh --rt --latest` builds flawlessly.
>
> However, the bitbake file for the non-rt 5.4 kernel still seems missing.

Thanks for pointing out, fixed version pushed.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f89cb542-0db5-d16b-48b3-8fed270e015a%40web.de.
