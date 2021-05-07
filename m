Return-Path: <jailhouse-dev+bncBDS77PFL3YERBKXH2OCAMGQE3WY6QIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D8376198
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 May 2021 10:00:44 +0200 (CEST)
Received: by mail-pg1-x537.google.com with SMTP id m7-20020a6545c70000b029020f6af21c77sf4940159pgr.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 May 2021 01:00:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620374443; cv=pass;
        d=google.com; s=arc-20160816;
        b=aPvFpwtqs4QYmKpmqfbYUxx1d2vVQ1iKHBIbejatvGlW71eHvFcorQIF1Nn08tx1wD
         1ryRoxNDjTuinW1bLu6Jg9to3WGWXExNFSVUDyfpt7aLUJr0iMmPtK31+Nx1oS8Q6ufU
         CxBzE+3v5j1ygAKEhGCx0/RSN0mfuT39lKBfpThCbmfXxtaUMJxsfGciSeCxb5F7HW6q
         XY5b+xp9EW170tpywkAn3LD6ZLR8Spr2gmedUUKt6Eb6vVwv20WJPU09bd/Xv/OtKmRJ
         Rbel3gYrVqt7hWsBn4jZcmqKp57j5k8qWJwCcdehkJ/EgpX6FwdsHMoWtDAzG9kFwy8a
         i7yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :subject:from:to:sender:dkim-signature;
        bh=Uq3NqUfMh0BIM0sPw16qP+OmrbiTxXORyt7PyMXZnZs=;
        b=gP/TbliZ2EPx973aDEjBZaMsdYAsqLWtnQ0USlSP236NRsyOv8ZTbuWB6ZMejlFAgW
         YMWn9cAxYWf3y0MLXrIKWjxzB0AUmEMg3rnIaMVtDqcfZmKnQTcG4yoP2ZCI/JaH4S/Y
         EbdUMb2aVZEOpFBcgsHc04XFD2VQ8vdjXhotxVBZeCGoX/mmYhkgNxDo7TrOQU0wsPBa
         L9si5M+oo8/ap9PxLulEKhENrmDQHHxRv++KghClE6IyldbiwbwaZFdNfG41lNtV8Utq
         ICBbWgRTSiQQ+fnAEQgr7P9cQmoAgSFBEimSGxymA7YXtlDa9HPOTpapE8E07Q0o6bjH
         fxlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=Q531yF2V;
       spf=pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::42e as permitted sender) smtp.mailfrom=pkali@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Uq3NqUfMh0BIM0sPw16qP+OmrbiTxXORyt7PyMXZnZs=;
        b=KiDcOjIYsq4ikWEvTjXHqGt1A3Vx48Bssjcw+YY52lGXxWo4bsQJ6pUmi8Nbk/3of+
         rglujQCi64xLq1TrIS6PIQ1WJqSpC7F+kBuRZ86vdm/cxFn/89VHAc11A78SCQ66waQK
         pKehPfebdNBZ8TIo29J9/TtmPbg6CbSxaNprnj4go6DYYhST4IeAXfqE0zg/v97VwQ/c
         2OLgF+YcjGtFoVu0V4ZRFkzd32o2lP8Xgrgw3ZiJjqDfFAiGCciHfBIkBr8JJEOUpdcZ
         zpBUr4F21NqPU18so0gsmiEI6MC6oUtaiIOU0RZphi32vUQVA2uEKzGFpaiKsoQeoFGQ
         Rb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Uq3NqUfMh0BIM0sPw16qP+OmrbiTxXORyt7PyMXZnZs=;
        b=j6meanwERVY8qrFaLLMAWM8Gksd0McTIm+s/KQzg9xHP5chIWvGJGCUzv+uhCF0/93
         b7GD9z8MhA1e9PXnvD19iV79QTH+U7MVTzCThhDoMoN+BYqIcgQhYX1iOgt3D+rPClkY
         Z6G2rB8x262yRvW6hTJ0UBE1F/moo68YPl3ucF8J89MZdCZSLKJ9Npm+9IlcnlbS6lWn
         sCReJjY7uoy6j8QilABwW6zWgtQj4SNUMmMAo90M17CytRVVEhM23jvx+aUvWJYcJpm0
         5rzVIBmbw+n5h5l9bPKnxKvtk2Fmxfzq8MZtvpZoMGc/NzsqOhsIz30GyObQ/upSqz6/
         lnyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533VNxbumLRdVD3qGb0qzckNHvwdWihBgQEYsY4rk7grHd9A8kiy
	9/KC1u4jBIApM7AAei+JyyA=
X-Google-Smtp-Source: ABdhPJyQJ4sX064fOmXdvJFzv2xXfOOzxprXqcSnD2IlK6HKXLK6AO5iCRCGqZN44oQqZlDnYyfitw==
X-Received: by 2002:a17:903:2093:b029:ee:d210:c956 with SMTP id d19-20020a1709032093b02900eed210c956mr8805192plc.82.1620374443138;
        Fri, 07 May 2021 01:00:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:8d85:: with SMTP id i5ls2430713pfr.0.gmail; Fri, 07 May
 2021 01:00:42 -0700 (PDT)
X-Received: by 2002:a63:4a4b:: with SMTP id j11mr8431281pgl.451.1620374442253;
        Fri, 07 May 2021 01:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620374442; cv=none;
        d=google.com; s=arc-20160816;
        b=oWlzwDFjGG0HN7roeyefoJKOQmRzGHs6kXrS+fVZv4zmwxV+lpsTWEuAvnqaGRLLdK
         BEFPFsW2CabBOMRzQXhad/EfyxxGp25CqIylQQ3YqtEoBjO5Lg2U73qVXnku/h6ngEsX
         Jv3Edxj6NBfSl+IvNaIUmeDPwAWgsTatvP3+W4HAloybby+v9wHJuep9jFsON5BUE5F/
         SLvHvPfo/sUz8FxaNzp33ctzxGWmXRJjJ5EncUlhpW2hGAakhyFjPn98f7zOSGPI9j94
         uv2xiD+wnGP9tJrlgT3oEFg/d81BLbdf4g0S5QjENmo0v1a3GqP3/FLpdA+zDej9XACs
         dtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=eaimYmv2AUk3rKM5rsUkecPvzHbdkgw93HWOwR/5tQ8=;
        b=l0p2lYoncDeYzdSwwed3jgzHtscmpohFelo1jhYaZAlvrp5ADP1PxNlgUQZALBji3Y
         CLQ1Bp7lAGBVc9sAuTAKSIBW51+tyBSfUOyNZbAEHbCujyidJd0znCAOl3YqeHXqb6il
         yx5AQHY4/rnQYcosAIUGjHQT/+A8nASKuJlrV09//kOCN5JN7RuT2YxQjs04ktTjmfK/
         g984BQrh1UyyaCOZwS6+5WikTmixngkYJvHA03v2QoYUBTF4LDNwf3vjW1B1IyZTmciI
         bNmFBxjdAyHSWQXBcrFDUhr+JnrT7qyYh3EZAUIiKecBqz+M3aaiP+tBncO10dBbBjRQ
         vc7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=Q531yF2V;
       spf=pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::42e as permitted sender) smtp.mailfrom=pkali@cimware.in
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com. [2607:f8b0:4864:20::42e])
        by gmr-mx.google.com with ESMTPS id o15si409917pgu.4.2021.05.07.01.00.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 May 2021 01:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::42e as permitted sender) client-ip=2607:f8b0:4864:20::42e;
Received: by mail-pf1-x42e.google.com with SMTP id b15so7078297pfl.4
        for <jailhouse-dev@googlegroups.com>; Fri, 07 May 2021 01:00:41 -0700 (PDT)
X-Received: by 2002:a63:10:: with SMTP id 16mr8862773pga.143.1620374440845;
        Fri, 07 May 2021 01:00:40 -0700 (PDT)
Received: from Administrators-MacBook-Pro.local ([115.99.223.186])
        by smtp.gmail.com with ESMTPSA id v15sm4050777pgc.57.2021.05.07.01.00.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 May 2021 01:00:40 -0700 (PDT)
To: jailhouse-dev@googlegroups.com
From: Prashant Kalikotay <pkali@cimware.in>
Subject: Can Jailhouse work with CentOS
Message-ID: <299a190c-72fb-1027-0efc-7a45b98bffe0@cimware.in>
Date: Fri, 7 May 2021 13:30:36 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Original-Sender: pkali@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b=Q531yF2V;       spf=pass (google.com: domain of pkali@cimware.in
 designates 2607:f8b0:4864:20::42e as permitted sender) smtp.mailfrom=pkali@cimware.in
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

Dear Sir/Madam,

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 I am trying to=
 install jailhouse in CentOS=20
but the installation did not work or it did not get installed. Whereas=20
when I tried to install in Ubuntu it readily installed. My query is does=20
Jailhouse install in CentOS or is there any additional things to be done=20
to install it?.

Thanking you in advance.


Regards,

Prashant K

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/299a190c-72fb-1027-0efc-7a45b98bffe0%40cimware.in.
